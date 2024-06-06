import 'package:flutter/material.dart';
import 'package:megga_posto_mobile/model/supply_model.dart';
import 'package:megga_posto_mobile/utils/interface/i_supply_features.dart';

import '../../../repositories/http/get_supply.dart';
import '../../../repositories/http/get_supply_pump.dart';
import '../../dependencies.dart';

class SupplyFeatures implements ISupplyFeatures {
  final _supplyController = Dependencies.supplyController();

  SupplyFeatures.privateConstructor();

  static final SupplyFeatures _instance = SupplyFeatures.privateConstructor();

  factory SupplyFeatures() => _instance;

  @override
  // Adiciona a lista de abastecimentos na variavel supplyList
  Future<List<Supply>> setSupply(BuildContext context) async {
    _supplyController.supplyList.clear();
    var supply = await GetSupply().getSupply(context);
    _supplyController.supplyList.addAll(supply);
    _supplyController.update();
    return supply;
  }

  @override
  // Adiciona a lista de abastecimentos na variavel supplyPumpList
  Future<bool> setSupplyPump(BuildContext context, int idSupply) async {
    _supplyController.supplySelectedPumpList.clear();
    var supplyPump = await GetSupplyPump().getSupplyPump(context, idSupply);
    if (supplyPump.isEmpty) return false;
    _supplyController.supplySelectedPumpList.addAll(supplyPump);
    _supplyController.update();
    return true;
  }

  @override
  // Limpa todos os campos
  void clearAll() {
    _supplyController.supplyList.clear();
    _supplyController.supplySelectedPumpList.clear();
  }
}
