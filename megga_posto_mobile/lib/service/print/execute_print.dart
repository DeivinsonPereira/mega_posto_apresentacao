// ignore_for_file: use_build_context_synchronously
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/custom_cherry.dart';
import 'package:megga_posto_mobile/utils/date_time_formatter.dart';
import 'package:megga_posto_mobile/utils/format_numbers.dart';
import 'package:megga_posto_mobile/utils/methods/bill/bill_get.dart';
import 'package:megga_posto_mobile/utils/singletons_instances.dart';

import '../../utils/native_channel.dart';

class ExecutePrint {
  final _billGet = BillGet();
  final _logger = SingletonsInstances().logger;

  Future<void> printText(String text, BuildContext context) async {
    try {
      _logger.d('Iniciando o envio para a impressão do texto');

      final Map<String, dynamic> printSettings = {
        'tipoImpressao': "Texto",
        'mensagem': text,
        'options': [false, false, false], // [negrito, italico, sublinhado]
        'size': 18,
        'font': 'SANS SERIF',
        'alinhar': 'CENTER'
      };

      var result =
          await NativeChannel.platform.invokeMethod('imprimir', printSettings);
      if (result != null) {
        _logger.d("Método readNfc chamado com sucesso, resultado: $result");
      } else {
        _logger.e("Erro ao ler NFC");
      }
    } on PlatformException catch (e) {
      _logger.e("Erro ao ler NFC: $e");
    } catch (e) {
      _logger.e("Erro ao ler NFC: $e");
    }
  }

  Future<void> printQrCodeAndText(
      String pix, DateTime time, BuildContext context) async {
    try {
      _logger.d('Iniciando o envio para a impressão do texto');

      String initHour = DatetimeFormatter.getDataHoraOptionalPlusMinutes(time);
      String dueHour =
          DatetimeFormatter.getDataHoraOptionalPlusMinutes(time, minutes: 5);
      String value =
          FormatNumbers.formatNumbertoString(_billGet.getTotalValueFromCart());

      final Map<String, dynamic> printSettings = {
        'tipoImpressao': 'printPixQrCode',
        'pix': pix,
        'initDate': initHour,
        'dueDate': dueHour,
        'value': value
      };

      var result =
          await NativeChannel.platform.invokeMethod('imprimir', printSettings);

      if (result != null) {
        _logger
            .d("Método printPixQrCode chamado com sucesso, resultado: $result");
      } else {
        _logger.e("Erro ao imprimir QRCode");
      }
    } catch (e) {
      _logger.e("Erro ao imprimir QRCode: $e");
      CustomCherryError(message: 'Erro desconhecido: $e').show(context);
      Get.back();
    }
  }

  Future<void> printNfce(String text1, String text2, String text3,
      String qrCode, String text4) async {
    try {
      _logger.d('Iniciando o envio para a impressão do texto');

      final Map<String, dynamic> printSettings = {
        'tipoImpressao': 'printNfce',
        'text1': text1,
        'text2': text2,
        'text3': text3,
        'qrCode': qrCode,
        'text4': text4
      };

      var result =
          await NativeChannel.platform.invokeMethod('imprimir', printSettings);

      if (result != null) {
        _logger
            .d("Método printPixQrCode chamado com sucesso, resultado: $result");
      } else {
        _logger.e("Erro ao imprimir QRCode");
      }
    } catch (e) {
      _logger.e("Erro ao imprimir QRCode: $e");
    }
  }
}
