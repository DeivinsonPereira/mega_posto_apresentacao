import 'package:get/get.dart';
import 'package:megga_posto_mobile/model/cart_shopping_model.dart';
import 'package:megga_posto_mobile/model/collections/product.dart';
import 'package:megga_posto_mobile/model/product_and_quantity_model.dart';

import 'package:megga_posto_mobile/model/supply_model.dart';

import 'package:megga_posto_mobile/model/supply_pump_model.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';
import 'package:megga_posto_mobile/utils/methods/bill/bill_get.dart';
import 'package:megga_posto_mobile/utils/singletons_instances.dart';

import '../../../repositories/isar_db/product/get_product.dart';
import '../../interface/i_bill_features.dart';

class BillFeatures implements IBillFeatures {
  final _billController = Dependencies.billController();
  final _billGet = BillGet();
  final _logger = SingletonsInstances().logger;

  BillFeatures._privateConstructor();

  static final BillFeatures _instance = BillFeatures._privateConstructor();

  factory BillFeatures() => _instance;

  // Adiciona o abastecimento e os produtos no carrinho
  // caso já tenha um produto com o mesmo código no carrinho ele aumenta a quantidade,
  // se não ele adiciona o produto ao carrinho
  @override
  void addCartShoppingListFromProduct(Product? product) {
    ProductAndQuantityModel productFiltered =
        _billGet.getProductFromCart(product!);

    if (productFiltered.product != null) {
      productFiltered.quantity = productFiltered.quantity! + 1;
      _updateVariables();
      return;
    }

    ProductAndQuantityModel productAndQuantityModel =
        ProductAndQuantityModel(product: product, quantity: 1);

    _billController.cartShopping.value.productAndQuantity ??= [];
    _billController.cartShopping.value.productAndQuantity!
        .add(productAndQuantityModel);

    _updateVariables();
  }

  // adiciona os produtos se entrar na tela dos produtos diretamente
  @override
  void addCartShoppingListFromSupply(bool isSupply, {Product? product}) {
    CartShoppingModel cartShopping = _billController.cartShopping.value;

    if (isSupply) {
      cartShopping.supplyPump = _billController.supplyPumpSelected;

      return;
    }
    ProductAndQuantityModel? productFiltered;

    if (product != null) {
      productFiltered = _billGet.getProductFromCart(product);
    }
    if (_isProductInCart(productFiltered)) {
      productFiltered?.quantity =
          productFiltered.quantity == null ? 1 : productFiltered.quantity! + 1;
    }

    if (!_isProductInCart(productFiltered)) {
      _billController.cartShopping.value.productAndQuantity ??= [];
      cartShopping.productAndQuantity!
          .add(ProductAndQuantityModel(product: product, quantity: 1));
    }

    _updateVariables();
  }

  // adiciona o abastecimento no carrinho após a tela dos produtos
  @override
  void addSupplyFromProduct() {
    _billController.cartShopping.value.supplyPump =
        _billController.supplyPumpSelected;
  }

  // limpa o carrinho de compras
  @override
  void clearCartShoppingList() {
    _billController.cartShopping.value = CartShoppingModel();
  }

  // limpa o bico selecionado
  @override
  void clearSupplyPumpSelected() {
    _billController.supplyPumpSelected = SupplyPump(
        id: 0,
        caixaId: 0,
        bicoId: 0,
        notaFiscalId: 0,
        dataHora: '00:00:00',
        unitario: 0,
        quantidade: 0,
        total: 0);
  }

  @override
  // Limpa as variáveis
  void clearAll() {
    clearCartShoppingList();
    clearSupplyPumpSelected();
    _billController.cartShopping.value = CartShoppingModel();
  }

  // remove um item do carrinho
  @override
  void removeItemCartShoppingList(Product product) {
    CartShoppingModel cartShopping = _billController.cartShopping.value;
    ProductAndQuantityModel? productFiltered =
        _billGet.getProductFromCart(product);

    if (productFiltered.product == null) return;

    productFiltered.quantity = productFiltered.quantity! - 1;
    if (productFiltered.quantity! <= 0) {
      cartShopping.productAndQuantity!.remove(productFiltered);
    }

    _updateVariables();
  }

  @override
  // remove o abastecimento do carrinho
  void removeSupplyPumpCartShoppingList() {
    if (_billController.cartShopping.value.supplyPump != null) {
      _billController.cartShopping.value.supplyPump = null;
    }
    _updateVariables();
  }

  @override
  // seta o abastecimento selecionado
  void setSupplies(Supply supply, SupplyPump supplyPump) {
    _billController.supplySelected = supply;
    _billController.supplyPumpSelected = supplyPump;
    _updateVariables();
  }

  @override
  Future<void> addProduct() async {
    List<Product> products = await GetProduct().getProduct();

    if (products.isNotEmpty) {
      _billController.products.assignAll(products);
    } else {
      _logger.e('Nenhum produto encontrado.');
      return;
    }
  }

  void _updateVariables() {
    _billController.update();
    _billController.cartShopping.refresh();
  }

  bool _isProductInCart(ProductAndQuantityModel? productFiltered) {
    return productFiltered != null && productFiltered.product != null;
  }
}
