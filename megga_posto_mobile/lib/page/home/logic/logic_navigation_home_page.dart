import 'package:get/get.dart';
import 'package:megga_posto_mobile/utils/methods/supply/supply_features.dart';

import '../../../model/supply_model.dart';
import '../../../utils/dependencies.dart';
import '../../loading/loading_page.dart';
import '../../products/products_page.dart';
import '../../supply/supply_page.dart';

class LogicNavigationHomePage {
  final _billCotroller = Dependencies.billController();
  final _supplyFeatures = SupplyFeatures();

  LogicNavigationHomePage._privateConstructor();

  static final LogicNavigationHomePage _instance = LogicNavigationHomePage._privateConstructor();

  factory LogicNavigationHomePage() => _instance;

  Future<void> navigationToSupply() async {
    Get.dialog(const LoadingPage());
    List<Supply> supplyList = await _supplyFeatures.setSupply(Get.context!);
    if (supplyList.isNotEmpty) {
      _billCotroller.isProduct = false;
      Get.back();
      Get.to(() => const SupplyPage());
    }
  }

  void navigationToProduct() {
    var billController = Dependencies.billController();
    billController.isProduct = true;
    Get.to(() => ProductsPage(), transition: Transition.rightToLeft);
  }

}
