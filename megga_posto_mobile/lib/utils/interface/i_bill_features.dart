import '../../model/collections/product.dart';
import '../../model/supply_model.dart';
import '../../model/supply_pump_model.dart';

abstract class IBillFeatures {
  void setSupplies(Supply supply, SupplyPump supplyPump);
  void addCartShoppingListFromSupply(bool isSupply, {Product? product});
  void addCartShoppingListFromProduct(Product? product);
  void addSupplyFromProduct();
  void removeItemCartShoppingList(Product product);
  void removeSupplyPumpCartShoppingList();
  void clearCartShoppingList();
  void clearSupplyPumpSelected();
  void clearAll();
  Future<void> addProduct();
}
