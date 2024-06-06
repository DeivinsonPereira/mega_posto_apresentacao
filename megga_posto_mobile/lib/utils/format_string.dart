import 'package:intl/intl.dart';
import 'package:megga_posto_mobile/page/payment/enum/modalidade_payment.dart';

import '../model/info_adictional.dart';
import 'dependencies.dart';

abstract class FormatString {
  static String splitText(String text, String separator) {
    var textDivided = text.split(separator);
    return textDivided.last.trim();
  }

  // Determina o máximo de caracteres e coloca uma elipse caso tenha mais do que o length
  static String maxLengthText(String text, int length) {
    if (text.length > length) {
      return "${text.substring(0, length)}...";
    } else {
      return text;
    }
  }

  // Formata a String para o formato de telefone (00) 00000-0000 ou (00) 0000-0000
  static String formatPhone(String phone) {
    if (phone.length == 11) {
      return "(${phone.substring(0, 2)})${phone.substring(2, 7)}-${phone.substring(7, 11)}";
    } else if (phone.length == 10) {
      return "(${phone.substring(0, 2)}) ${phone.substring(2, 6)}-${phone.substring(6, 10)}";
    } else {
      return phone;
    }
  }

  // Formata a String para o formato de CNPJ
  static String formatCNPJ(String cnpj) {
    if (cnpj.length == 14) {
      return "${cnpj.substring(0, 2)}.${cnpj.substring(2, 5)}.${cnpj.substring(5, 8)}/${cnpj.substring(8, 12)}-${cnpj.substring(12, 14)}";
    } else {
      return cnpj;
    }
  }

  // Formata a String para o formato de inscrição estadual 025/8112565
  static String formatInscricaoEstadual(String ie) {
    if (ie.length == 9) {
      return "${ie.substring(0, 2)}/${ie.substring(2, 9)}";
    } else {
      return ie;
    }
  }

  // Formata o preço unitario para 3 casas decimais
  static String formatThreeDecimals(String value) {
    double number = double.parse(value);
    String formattedString = number.toStringAsFixed(3);

    return formattedString;
  }

  // Formata o código para a descrição de pagamento
  static String transformCodeInPaymentForm(String value) {
    var paymentController = Dependencies.paymentController();

    var valueFormated = '0';

    if (value.startsWith('0')) {
      valueFormated = value.substring(1);
    }

    var paymentFormList = paymentController.paymentForms
        .firstWhere((element) => element.codigo.toString() == valueFormated);

    switch (paymentFormList.tipoDocto) {
      case ModalidadePaymment.DINHEIRO:
        return 'DINHEIRO';
      case ModalidadePaymment.DEBITO:
        return 'DEBITO';
      case ModalidadePaymment.CREDITO:
        return 'CREDITO';
      case ModalidadePaymment.NOTA:
        return 'NOTA';
      case ModalidadePaymment.PIX:
        return 'PIX';
      default:
        return 'DINHEIRO';
    }
  }

  // Transforma dateTime tipo String para data
  static String transformDateTimeStringToDate(String dateTimeString) {
    var date = DateTime.parse(dateTimeString);
    return DateFormat('dd/MM/yyyy').format(date);
  }

  // Transforma dateTime tipo String para hora
  static String transformDateTimeStringToHour(String dateTimeString) {
    var hour = DateTime.parse(dateTimeString);
    return DateFormat('HH:mm:ss').format(hour);
  }

  static InfoAdictional parseInfo(String info, String qrCode) {
    try {
      final frentistaRegex = RegExp(r'Frentista: (.*?);;');
      final tFederaisRegex =
          RegExp(r'Pagou aproximadamente: (.*?) de tributos federais');
      final tEstaduaisRegex =
          RegExp(r'de tributos federais (.*?) de tributos estaduais ->');
      final fonteRegex = RegExp(r'Fonte: (.*?);;');

      String? frentista = frentistaRegex.firstMatch(info)?.group(1);
      String? tFederais = tFederaisRegex.firstMatch(info)?.group(1);
      String? tEstaduais = tEstaduaisRegex.firstMatch(info)?.group(1);
      String? fonte = fonteRegex.firstMatch(info)?.group(1);

      var text = _formatarString(qrCode);

      InfoAdictional information = InfoAdictional(
        frentista: frentista,
        tribFederais: tFederais,
        tribEstaduais: tEstaduais,
        fonte: fonte,
        chave: text,
      );

      return information;
    } catch (e) {
      return InfoAdictional();
    }
  }

  static String _formatarString(String url) {
    var partes = url.split('=');
    if (partes.length > 1) {
      var p = partes[1].split('|')[0];
      var sb = StringBuffer();
      for (var i = 0; i < p.length; i++) {
        if (i > 0 && i % 4 == 0) {
          sb.write(' ');
        }
        sb.write(p[i]);
        if (i == 23) {
          sb.write('\n');
        }
      }
      return sb.toString();
    } else {
      return 'URL inválida';
    }
  }
}
