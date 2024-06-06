import 'package:megga_posto_mobile/utils/dependencies.dart';

class BooleanMethods {
  final _billController = Dependencies.billController();
  final _paymentController = Dependencies.paymentController();

  bool isProductEmpty() {
    return _billController.cartShopping.value.productAndQuantity == null;
  }

  bool isSupplyPumpEmpty() {
    return _billController.cartShopping.value.supplyPump == null;
  }

  bool isPaymentSelectedEmpty() {
    return _paymentController.listPaymentsSelected.isEmpty;
  }
}
