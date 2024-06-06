// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:logger/logger.dart';

import '../../common/custom_cherry.dart';
import '../../model/credentials_model.dart';
import '../../utils/auth.dart';
import '../../utils/endpoints.dart';
import '../../utils/methods/config/config_features.dart';

class GetCredentials {
  final _configFeatures = ConfigFeatures.instance;
  final _logger = Logger();

  Future<bool> getCredentials(BuildContext context) async {
    HttpClient client = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

    IOClient ioClient = IOClient(client);

    Uri uri = Uri.parse(Endpoints.endpointCredentials());

    try {
      var response = await ioClient.post(uri, headers: Auth.header).timeout(
            const Duration(seconds: 15),
          );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          _configFeatures.setCredential(Credentials.fromMap(data['data']));
          return true;
        } else {
          _logger.e('Erro ao buscar credenciais. ${data['message']}');
          CustomCherryError(message: data['message']).show(context);
          return false;
        }
      } else {
        _logger.e('Erro ao buscar credenciais. ${response.statusCode}');
        const CustomCherryError(message: 'Erro ao buscar credenciais.')
            .show(context);
        return false;
      }
    } catch (e) {
      _logger.e('Erro ao buscar credenciais. $e');
      const CustomCherryError(message: 'Erro ao buscar credenciais.')
          .show(context);
      return false;
    }
  }
}
