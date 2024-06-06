import 'package:megga_posto_mobile/model/payment_form_selected.dart';

import '../../../model/sell_item_model.dart';
import '../../../model/sell_model.dart';
import '../../../model/supply_model.dart';
import '../../../model/supply_pump_model.dart';

abstract class IExecuteSell {
  Future<void> executeSell({Supply? supply, SupplyPump? supplyPump});
  Future<Sell> getSell();
  SellItem? getSupplyItem();
  List<SellItem?> getProductItem();
  List<PaymentFormSelected> getPaymentFormSelected();
}
