import 'package:get/get.dart';
import 'package:megga_posto_mobile/model/supply_pump_model.dart';
import '../model/cart_shopping_model.dart';
import '../model/collections/product.dart';
import '../model/supply_model.dart';

class BillController extends GetxController {
  late Supply supplySelected;
  SupplyPump supplyPumpSelected = SupplyPump(
      id: 0,
      caixaId: 0,
      bicoId: 0,
      notaFiscalId: 0,
      dataHora: '00:00:00',
      unitario: 0,
      quantidade: 0,
      total: 0);

  bool isProduct = false;

  var cartShopping = CartShoppingModel().obs;

  var products = <Product>[].obs;
}
