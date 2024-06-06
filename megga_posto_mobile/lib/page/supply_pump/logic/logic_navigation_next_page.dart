import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/model/supply_pump_model.dart';
import 'package:megga_posto_mobile/utils/methods/bill/bill_features.dart';

import '../../../model/supply_model.dart';
import '../../../utils/boolean_methods.dart';
import '../../cart_shopping/cart_shopping_page.dart';
import '../../payment/payment_page.dart';

class LogicNavigationNextPage {
  final _billFeatures = BillFeatures();

  LogicNavigationNextPage._privateConstructor();

  static final LogicNavigationNextPage _instance =
      LogicNavigationNextPage._privateConstructor();

  factory LogicNavigationNextPage() => _instance;

  Future<void> nextPage(
      Supply supplySelected, SupplyPump supplyPumpSelected) async {
    _billFeatures.setSupplies(supplySelected, supplyPumpSelected);
    _billFeatures.addCartShoppingListFromSupply(true);

    if (BooleanMethods().isProductEmpty()) {
      _navigation(const PaymentPage());
      return;
    }

    _navigation(const CartShoppingPage());
  }

 

  void _navigation(Widget page) {
    Get.to(() => page, transition: Transition.rightToLeft);
  }
}
