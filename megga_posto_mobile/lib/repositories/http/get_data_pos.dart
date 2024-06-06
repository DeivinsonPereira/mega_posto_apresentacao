// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:logger/logger.dart';

import '../../common/custom_cherry.dart';
import '../../model/data_pos_model.dart';
import '../../utils/auth.dart';
import '../../utils/dependencies.dart';
import '../../utils/endpoints.dart';
import '../../utils/methods/config/config_features.dart';

class GetDataPos {
  final _configFeatures = ConfigFeatures.instance;
  final _confiController = Dependencies.configController();
  final Logger logger = Logger();

  Future<bool> getDataPos(BuildContext context) async {
    Uri uri = Uri.parse(Endpoints.endpointCredetialPix());

    HttpClient client = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

    IOClient ioClient = IOClient(client);

    try {
      var bodyRequest = {
        "pserial": _confiController.serialDevice,
      };

      var response = await ioClient
          .post(
            uri,
            body: jsonEncode(bodyRequest),
            headers: Auth.header,
          )
          .timeout(
            const Duration(seconds: 15),
          );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          _configFeatures.setDataPos(DataPos.fromMap(data['data']));
          return true;
        } else {
          logger.e('Erro ao buscar credenciais. ${data['message']}');
          CustomCherryError(message: data['message']).show(context);
          return false;
        }
      } else {
        logger.e('Erro ao buscar credenciais. ${response.statusCode}');
        const CustomCherryError(message: 'Erro ao buscar credenciais.')
            .show(context);
        return false;
      }
    } on TimeoutException catch (e) {
      logger.e('Tempo esgotado. $e');
      const CustomCherryError(
        message: 'Falha na comunicação com o servidor.',
      ).show(context);
      return false;
    } catch (e) {
      logger.e('Erro ao buscar credenciais. $e');
      const CustomCherryError(
        message: 'Falha na comunicação com o servidor.',
      ).show(context);
      return false;
    }
  }
}
