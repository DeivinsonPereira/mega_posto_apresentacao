import 'package:flutter/material.dart';
import 'package:megga_posto_mobile/common/custom_cherry.dart';
import 'package:megga_posto_mobile/utils/singletons_instances.dart';

import '../../../utils/dependencies.dart';

class VerifyLogin {
  final _singletonInstances = SingletonsInstances();
  final _configController = Dependencies.configController();
  late final _logger = _singletonInstances.logger;

  Future<void> verifyLogin(BuildContext context) async {
    if (_configController.ipServidorController.text.isEmpty) {
      const CustomCherryError(message: 'IP do servidor não informado.')
          .show(context);
      _logger.e('IP do servidor não informado.');
      return;
    }

  }
}
