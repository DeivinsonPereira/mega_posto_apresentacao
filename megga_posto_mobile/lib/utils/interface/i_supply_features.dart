import 'package:flutter/material.dart';

import '../../model/supply_model.dart';

abstract class ISupplyFeatures {
  Future<List<Supply>> setSupply(BuildContext context);
  Future<bool> setSupplyPump(BuildContext context, int idSupply);
  void clearAll();
  
}