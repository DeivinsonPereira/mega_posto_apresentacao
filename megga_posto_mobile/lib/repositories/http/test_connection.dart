import 'dart:io';
import 'package:http/io_client.dart';
import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/utils/auth.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';

class TestConnection {
  var configController = Dependencies.configController();
  Logger logger = Logger();

  Future<bool> test() async {
    var url = configController.ipServidorController.text;

    HttpClient client = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

    IOClient ioClient = IOClient(client);

    if (url.isEmpty) {
      return false;
    }

    Uri uri = Uri.parse(url);

    try {
      var response = await ioClient.get(uri, headers: Auth.header);

      if (response.statusCode == 200) {
        return true;
      } else {
        logger.e('Não foi possivel conectar ao servidor.');
        return false;
      }
    } catch (e) {
      logger.e('Não foi possivel conectar ao servidor.$e');
      return false;
    }
  }
}
