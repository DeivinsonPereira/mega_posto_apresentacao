import '../../model/collections/product.dart';

abstract class IBillGet {
  double getTotalValueFromCart();
  int getProductQuantityFromCart(Product product);
  int calculateTotalQuantityFromCart();
}
