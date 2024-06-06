// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';

import '../../model/supply_pump_model.dart';
import '../../utils/auth.dart';
import '../../utils/endpoints.dart';

class GetSupplyPump {
  var configController = Dependencies.configController();
  Logger logger = Logger();

  Future<List<SupplyPump>> getSupplyPump(
      BuildContext context, int idSupplyPump) async {
    HttpClient client = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

    IOClient ioClient = IOClient(client);

    Uri uri = Uri.parse(Endpoints.endpointSupplyPump());

    try {
      var bodyRequest = {
        "pidbico": idSupplyPump,
        "pidatendente": configController.idUsuario.value,
      };

      var response = await ioClient.post(
        uri,
        body: jsonEncode(bodyRequest),
        headers: Auth.header,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          List<SupplyPump> supplies = [];
          for (var supply in data['data']) {
            supplies.add(SupplyPump.fromMap(supply));
          }
          return supplies;
        } else {
          logger.e('Erro ao buscar abastecimentos. ${data['message']}');
          return [];
        }
      } else {
        logger.e('Erro ao buscar abastecimentos. ${response.statusCode}');
        return [];
      }
    } catch (e) {
      logger.e('Erro ao buscar abastecimentos. erro: $e');
      return [];
    }
  }
}
