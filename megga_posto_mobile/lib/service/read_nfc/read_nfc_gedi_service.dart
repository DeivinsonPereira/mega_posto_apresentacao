import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/utils/native_channel.dart';

class ReadNfcGediService {
  
  final Logger _logger = Logger();

  Future<void> readNfc(BuildContext context) async {
    try {
      _logger.d("Iniciando chamada do método readNfc");

      var result = await NativeChannel.platform.invokeMethod('lernfcgedi');

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
}
