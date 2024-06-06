// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/custom_cherry.dart';
import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/repositories/isar_db/dado_empresa/insert_dado_empresa.dart';
import 'package:megga_posto_mobile/repositories/isar_db/isar_service.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';
import 'package:megga_posto_mobile/utils/methods/config/config_features.dart';

import '../repositories/http/test_connection.dart';

class CheckConnection {
  final _configFeatures = ConfigFeatures.instance;
  final _configController = Dependencies.configController();

  Future<void> checkConnectionAndPersistData(BuildContext context) async {
    bool connection = await TestConnection().test();

    if (connection == false) {
      const CustomCherryError(
              message: 'Não foi possivel conectar ao servidor.')
          .show(context);
      return;
    }
    if (_configController.ipServidorController.text.endsWith('/')) {
      _configFeatures.updateIpServidor();
    } else {
      _configController.ipServidorController.text =
          '${_configController.ipServidorController.text}/';
      _configFeatures.updateIpServidor();
    }

    var result = await InsertDadoEmpresa(IsarService(), Logger())
        .insertDadoEmpresa(_configController.ipServidorController.text);
    if (result == false) {
      const CustomCherryError(message: 'Não foi possivel salvar os dados.')
          .show(context);
      return;
    } else {
      Get.back();
      const CustomCherrySuccess(message: 'Dados salvos com sucesso.')
          .show(context);
    }
  }
}
