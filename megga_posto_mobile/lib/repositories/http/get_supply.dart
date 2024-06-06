// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/io_client.dart';
import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/common/custom_cherry.dart';
import 'package:megga_posto_mobile/model/supply_model.dart';
import 'package:megga_posto_mobile/utils/endpoints.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';

import '../../utils/auth.dart';

class GetSupply {
  final Logger _logger = Logger();
  var configController = Dependencies.configController();

  Future<List<Supply>> getSupply(BuildContext context) async {
    HttpClient client = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

    IOClient ioClient = IOClient(client);

    Uri uri = Uri.parse(Endpoints.endpointResumeSupply());

    try {
      var bodyRequest = {"pidatendente": configController.idUsuario.value};

      var response = await ioClient.post(uri,
          body: jsonEncode(bodyRequest), headers: Auth.header);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          List<Supply> supplies = [];
          for (var supply in data['data']) {
            supplies.add(Supply.fromMap(supply));
          }
          return supplies;
        } else {
          _logger.e('Erro ao buscar dados. ${data['message']}');
          const CustomCherryError(message: 'Nenhum abastecimento encontrado!')
              .show(context);
          Get.back();
          return [];
        }
      } else {
        _logger.e('Erro ao buscar dados. ${response.statusCode}');
        const CustomCherryError(
                message: 'Erro ao buscar dados. Tente novamente!')
            .show(context);
        Get.back();
        return [];
      }
    } catch (e) {
      _logger.e('Erro ao buscar dados. $e');
      const CustomCherryError(message: 'Falha na conexão com o servidor.')
          .show(context);
      Get.back();
      return [];
    }
  }
}
