import 'package:megga_posto_mobile/model/collections/product.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';
import 'package:megga_posto_mobile/utils/singletons_instances.dart';

import '../../../model/cart_shopping_model.dart';
import '../../../model/product_and_quantity_model.dart';
import '../../interface/i_bill_get.dart';

class BillGet implements IBillGet {
  final _billController = Dependencies.billController();

  BillGet._privateConstructor();

  static final BillGet _instance = BillGet._privateConstructor();

  factory BillGet() => _instance;

  // Retorna a quantidade de todos os produtos do carrinho
  @override
  int calculateTotalQuantityFromCart() {
    List<ProductAndQuantityModel>? productList =
        _billController.cartShopping.value.productAndQuantity;
    int quantity = 0;

    if (productList == null) return quantity;

    for (var item in productList) {
      quantity += item.quantity!;
    }
    return quantity;
  }

  // retorna a quantidade de cada produto
  @override
  int getProductQuantityFromCart(Product product) {
    List<ProductAndQuantityModel>? productList =
        _billController.cartShopping.value.productAndQuantity;
    if (productList == null) return 0;

    ProductAndQuantityModel productFiltered = productList.firstWhere(
        (element) => element.product!.codigo == product.codigo,
        orElse: () => ProductAndQuantityModel(quantity: 0));

    if (productFiltered.product == null) return 0;

    return productFiltered.quantity!;
  }

  // retorna o valor total do carrinho
  @override
  double getTotalValueFromCart() {
    double totalValue = 0.0;
    CartShoppingModel cartShopping = _billController.cartShopping.value;

    if (cartShopping.supplyPump != null) {
      totalValue += cartShopping.supplyPump!.total!;
    }

    if (cartShopping.productAndQuantity == null) return totalValue;

    for (var item in cartShopping.productAndQuantity!) {
      totalValue += item.product!.valor! * item.quantity!;
    }
    return totalValue;
  }

  ProductAndQuantityModel getProductFromCart(Product product) {
    if (SingletonsInstances().booleanMethods.isProductEmpty()) {
      return ProductAndQuantityModel();
    }

    return _billController.cartShopping.value.productAndQuantity!.firstWhere(
        (element) => element.product?.codigo == product.codigo,
        orElse: () => ProductAndQuantityModel());
  }
}
