// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/custom_cherry.dart';
import 'package:megga_posto_mobile/page/loading/loading_page.dart';
import 'package:megga_posto_mobile/utils/methods/supply/supply_features.dart';

import '../../../model/supply_model.dart';
import '../../supply_pump/supply_pump_page.dart';

class LogiNavigationSupplyPump {
  final _supplyFeatures = SupplyFeatures();

  // se carregar os abastecimentos navega para a pagina de abastecimento por bico
  Future<void> navigation(BuildContext context, Supply supplySelected) async {
    Get.dialog(const LoadingPage());
    bool isSuccess =
        await _supplyFeatures.setSupplyPump(context, supplySelected.bicoId);
    if (isSuccess) {
      Get.back();
      Get.to(() => SupplyPumpPage(
            supplySelected: supplySelected,
          ));
    } else {
      Get.back();
      const CustomCherryError(message: 'Erro ao carregar os abastecimentos')
          .show(context);
    }
  }
}
