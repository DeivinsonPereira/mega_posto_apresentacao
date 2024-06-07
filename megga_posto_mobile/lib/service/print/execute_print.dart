// ignore_for_file: use_build_context_synchronously
import 'package:megga_posto_mobile/service/print/teste_print_xml/interface/i_print.dart';
import 'package:megga_posto_mobile/utils/singletons_instances.dart';

import '../../utils/native_channel.dart';

class ExecutePrint implements IPrint{
  final _logger = SingletonsInstances().logger;

  Future<void> printNfce(String text1, String text2, String qrCode, String text4) async {
    try {
      _logger.d('Iniciando o envio para a impressão do Xml');
      
          await NativeChannel.platform.invokeMethod('printNfce', {
            "textHeader": text1,
            "textBody": text2,
            "qrCode": qrCode,
            "textFooter": text4
          });

    } catch (e) {
      _logger.e("Erro ao imprimir Xml: $e");
    }
  }

  Future<void> printTeste() async {
    try {
      _logger.d('Iniciando o envio para a impressão do teste');
      
          await NativeChannel.platform.invokeMethod('printTest');

    } catch (e) {
      _logger.e("Erro ao imprimir teste: $e");
    }
  }
  
  @override
  Future<void> printQrCodeAndText() {
    // TODO: implement printQrCodeAndText
    throw UnimplementedError();
  }
  
  @override
  Future<void> printTef(String xml) {
    // TODO: implement printTef
    throw UnimplementedError();
  }

  
}
