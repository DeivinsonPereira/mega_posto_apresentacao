// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/custom_back_button.dart';
import 'package:megga_posto_mobile/common/custom_continue_button.dart';
import 'package:megga_posto_mobile/utils/methods/bill/bill_features.dart';

import 'package:megga_posto_mobile/utils/static/custom_colors.dart';
import 'package:megga_posto_mobile/common/custom_text_style.dart';

import '../../common/custom_header_app_bar.dart';
import '../../model/collections/product.dart';
import '../../utils/dependencies.dart';
import '../../utils/format_numbers.dart';
import '../../utils/methods/bill/bill_get.dart';
import 'components/custom_image_product.dart';
import 'logic/logic_product_confirm_button.dart';

class ProductsPage extends StatelessWidget {
  bool? isProductFromMenu;
  ProductsPage({
    super.key,
    this.isProductFromMenu = false,
  });

  @override
  Widget build(BuildContext context) {
    final _billController = Dependencies.billController();
    final _billFeatures = BillFeatures();
    final _billGet = BillGet();

    // Constrói a imagem do produto no card
    Widget _buildImageCard() {
      return CustomImageProduct().getImage('', width: 75, height: 75);
    }

    // Constrói o nome do produto
    Widget _buildProductName(Product productSelected) {
      return Text(
        productSelected.descricao!,
        style: CustomTextStyles().blackBoldStyle(16),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      );
    }

    // Constróiu o botão de adição de produto
    Widget _buildIconAdictionProduct(Product productSelected) {
      return Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: CustomColors.iconPumpColor,
        ),
        child: IconButton(
          onPressed: () {
            if (_billController.isProduct) {
              _billFeatures.addCartShoppingListFromProduct(productSelected);
            } else {
              _billFeatures.addCartShoppingListFromSupply(false,
                  product: productSelected);
            }
          },
          icon: const Icon(Icons.add, color: Colors.white, size: 20),
        ),
      );
    }

    // Constrói a quantidade
    Widget _buildQuantity(Product productSelected) {
      return Obx(
        () => Text(
          _billGet.getProductQuantityFromCart(productSelected).toString(),
          style: CustomTextStyles().blackBoldStyle(25),
        ),
      );
    }

    // Constrói o ícone de remoção de produto
    Widget _buildIconRemoveProduct(Product productSelected) {
      return Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromARGB(255, 122, 31, 24),
          ),
          child: IconButton(
            onPressed: () {
              _billFeatures.removeItemCartShoppingList(productSelected);
            },
            icon: const Icon(
              Icons.remove,
              color: Colors.white,
              size: 20,
            ),
          ));
    }

    // Constrói o valor do produto no card
    Widget _buildValue(Product productSelected) {
      return Text(
          'R\$ ${FormatNumbers.formatNumbertoString(productSelected.valor)}',
          style: const TextStyle(fontSize: 18));
    }

    // Constrói a linha dos botões e quantidade
    Widget _buildButtonsAndQuantity(Product productSelected) {
      return Row(
        children: [
          _buildIconAdictionProduct(productSelected),
          const SizedBox(
            width: 5,
          ),
          _buildQuantity(productSelected),
          const SizedBox(
            width: 5,
          ),
          _buildIconRemoveProduct(productSelected),
          const SizedBox(
            width: 5,
          ),
        ],
      );
    }

    // Constrói o corpo do card
    Widget _buildCardBody(Product productSelected) {
      return Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                _buildImageCard(),
                SizedBox(
                  width: Get.size.width * 0.45,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProductName(productSelected),
                        const Text('Valor:', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(children: [
              _buildButtonsAndQuantity(productSelected),
              _buildValue(productSelected),
            ]),
          ]),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
            child: Divider(
              color: Colors.black,
              height: 1,
            ),
          ),
        ],
      );
    }

    // Constrói a listview e chama os cards
    Widget _buildListProducts() {
      return ListView.builder(
          itemCount: _billController.products.length,
          itemBuilder: (context, index) {
            Product productSelected = _billController.products[index];
            return _buildCardBody(productSelected);
          });
    }

    // Constrói a linha dos botõesde voltar e confirmar
    Widget _buildButtonBackAndConfirm() {
      return Row(
        children: [
          Expanded(
            child: CustomBackButton(
              text: 'Voltar',
              function: () => Get.back(),
              color: CustomColors.backButton,
            ),
          ),
          isProductFromMenu!
              ? const SizedBox()
              : Expanded(
                  child: CustomContinueButton(
                    text: 'Confirmar',
                    colorButton: CustomColors.confirmButton,
                    function: () =>
                        LogicProductConfirmButton().executeLogic(context),
                  ),
                ),
        ],
      );
    }

    // Constrói a página de produtos
    return Scaffold(
      body: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          if (!isProductFromMenu!) {
            _billFeatures.clearCartShoppingList();
            _billFeatures.clearSupplyPumpSelected();
            return;
          }
        },
        child: Column(
          children: [
            CustomHeaderAppBar(
              isProduct: true,
              isProductFromMenu: isProductFromMenu,
            ),
            Expanded(child: _buildListProducts()),
            _buildButtonBackAndConfirm(),
          ],
        ),
      ),
    );
  }
}
