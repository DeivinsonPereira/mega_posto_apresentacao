import 'dart:convert';
import 'package:megga_posto_mobile/utils/format_numbers.dart';
import 'package:megga_posto_mobile/utils/format_string.dart';
import 'package:megga_posto_mobile/service/print/execute_print.dart';
import 'package:xml2json/xml2json.dart';

import '../../../utils/dependencies.dart';

class PrintXml {
  final Xml2Json xml2Json = Xml2Json();
  var paymentController = Dependencies.paymentController();

  Future<void> printXml(String xml) async {

    xml2Json.parse(xml);
    var jsonString = xml2Json.toParker();
    var data = jsonDecode(jsonString);
    var nfce = data["NFe"]["infNFe"]["emit"];
    var products = data["NFe"]["infNFe"]["det"];
    var qrcode = data['NFe']['infNFeSupl'];
    var tax = data["NFe"]["infNFe"]["total"]["ICMSTot"];
    var paymentForms = data["NFe"]["infNFe"]["pag"]["detPag"];
    var ide = data["NFe"]["infNFe"]["ide"];
    var information = FormatString.parseInfo(
        data["NFe"]["infNFe"]["infAdic"]['infCpl'], qrcode['qrCode']);

    String text1 = '${nfce['xFant']}\n';
    text1 += '${nfce["enderEmit"]['xLgr'] + ", " + nfce["enderEmit"]['nro']}\n';
    text1 +=
        '${nfce["enderEmit"]['xBairro'] + ", " + nfce["enderEmit"]['xMun'] + " - " + nfce["enderEmit"]['UF']}\n';
    text1 += 'Fone: ${FormatString.formatPhone(nfce["enderEmit"]['fone'])}\n';
    text1 += 'CNPJ: ${FormatString.formatCNPJ(nfce['CNPJ'])}\n';
    text1 +=
        'Iscricao Estadual: ${FormatString.formatInscricaoEstadual(nfce['IE'])}\n';
    text1 += 'Inscricao Municipal: ${nfce['enderEmit']['cMun']}\n';
    text1 += '------------------------------------------\n';
    String text2 = 'Codigo Descricao\n';
    text2 += '  Qtde   Uni.  Val. Unit   Val. Tot\n';
    text2 += '------------------------------------------\n';

    for (int i = 1; i < products.length; i++) {
      text2 +=
          '$i ${products[i]['prod']['xProd']}\n     ${products[i]['prod']['qCom']}   ${products[i]['prod']['uCom']}   ${FormatString.formatThreeDecimals(
        products[i]['prod']['vUnCom'],
      )}    ${FormatNumbers.formatNumbertoString(
        double.parse(products[i]['prod']['vProd']),
      )}\n';
    }
    text2 += '------------------------------------------\n';
    text2 += _formateLine('Qtd. total de itens', '${products.length - 1}\n');
    text2 += _formateLine('Valor total R\$',
        '${FormatNumbers.formatNumbertoString(double.parse(tax['vProd']))}\n');
    text2 += _formateLine('Desconto R\$',
        '${FormatNumbers.formatNumbertoString(double.parse(tax['vDesc']))}\n');
    text2 += _formateLine('Valor a pagar R\$',
        '${FormatNumbers.formatNumbertoString(double.parse(tax['vNF']))}\n');
    text2 += '------------------------------------------\n';
    text2 += _formateLine('Forma de Pagamento', ' Valor Pago\n');
    text2 += '------------------------------------------\n';

    if (data["NFe"]["infNFe"]["pag"].length > 1) {
      for (int i = 0; i < paymentForms.length; i++) {
        text2 += _formateLine(
          FormatString.transformCodeInPaymentForm(paymentForms[i]['tPag']),
          '${FormatNumbers.formatNumbertoString(double.parse(paymentForms[i]['vPag']))}\n',
        );
      }
    } else {
      text2 += _formateLine(
        FormatString.transformCodeInPaymentForm(paymentForms['tPag']),
        '${FormatNumbers.formatNumbertoString(double.parse(paymentForms['vPag']))}\n',
      );
    }
    text2 += '------------------------------------------\n';
    text2 += _formateLine('Tributos totais:',
        '${FormatNumbers.formatNumbertoString(double.parse(tax['vTotTrib']))}\n');
    text2 += 'Incidentes (Lei Federal 12.741/2012)\n';

    text2 += '------------------------------------------\n';
    text2 += 'Numero ' + ide['nNF'] + '  ' + 'Serie ' + ide['serie'] + '\n';
    text2 +=
        'Emissao ${FormatString.transformDateTimeStringToDate(ide['dhEmi'])}  ${FormatString.transformDateTimeStringToHour(ide['dhEmi'])}\n';
    text2 += 'Via Consumidor\n';
    text2 += 'Consulte pela Chave de acesso em\n';
    text2 += qrcode['urlChave'] + '\n';
    text2 += '${information.chave!}\n';
    // TODO => DEPOIS TEM QUE VIR O PROTOCOLO DE AUTORIZACAO E DATA E HORA DE AUTORIZACAO

    text2 += '------------------------------------------\n';

    //TODO -> deve aparecer o cpf do cliente caso informado

    String text3 = 'CONSUMIDOR NAO IDENTIFICADO\n';
    text3 += '------------------------------------------\n';
    String qrCode = qrcode['qrCode'];
    String text4 = '------------------------------------------\n';
    text4 += 'OPERADOR: ${information.frentista!}\n';
    text4 += 'Valor: ${information.tribFederais!} de tributos federais\n';
    text4 += 'Valor: ${information.tribEstaduais!} de tributos estaduais\n';
    text4 += 'Fonte: ${information.fonte!}\n';
    text4 += '------------------------------------------\n';

    await ExecutePrint().printNfce(text1, text2, text3, qrCode, text4);
  }

  String _formateLine(String textInit, String textEnd) {
    int quite = 22;

    int qnt1 = quite - textInit.length;
    int qnt2 = quite - (textEnd.length - 1);

    return textInit.padRight(qnt1, ' ') + textEnd.padLeft(qnt2, ' ');
  }
}
