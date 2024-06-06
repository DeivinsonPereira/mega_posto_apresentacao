// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/custom_text_style.dart';
import 'package:megga_posto_mobile/page/products/products_page.dart';
import 'package:megga_posto_mobile/utils/format_numbers.dart';
import 'package:megga_posto_mobile/utils/methods/bill/bill_features.dart';
import 'package:megga_posto_mobile/utils/methods/bill/bill_get.dart';

import '../page/fidelity/fidelity_dialog.dart';
import 'custom_logo.dart';

class CustomHeaderAppBar extends StatelessWidget {
  bool? isSupplyPump;
  int? bicoId;
  bool? isProduct;
  bool? isProductFromMenu;
  bool? isPayment;
  CustomHeaderAppBar({
    super.key,
    this.isSupplyPump = false,
    this.bicoId = 0,
    this.isProduct = false,
    this.isProductFromMenu = false,
    this.isPayment = false,
  });

  @override
  Widget build(BuildContext context) {
    final _billFeatures = BillFeatures();
    final _billGet = BillGet();

    // Constrói o container que mostra a quantidade de produtos no carrinho
    Widget _buildContainerQuantity() {
      return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 155, 33, 24),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            '${_billGet.calculateTotalQuantityFromCart()}',
            style: CustomTextStyles().whiteBoldStyle(12),
          ),
        ),
      );
    }

    //Constrói o botão de voltar com o container de quantidade
    Widget _buildBackButton() {
      return IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () => Get.back(),
      );
    }

    // Constrói o botão de carrinho para entrar na pagina de produtos
    Widget _buildCartShoppingIcon() {
      return Stack(
        children: [
          IconButton(
            onPressed: () {
              _billFeatures.removeSupplyPumpCartShoppingList();
              Get.to(() => ProductsPage(
                    isProductFromMenu: true,
                  ));
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          Obx(() => Positioned(
                right: 0,
                top: 0,
                child: _billGet.calculateTotalQuantityFromCart() == 0
                    ? const SizedBox()
                    : _buildContainerQuantity(),
              ))
        ],
      );
    }

    // Constrói o informativo do bico
    Widget _buildIconPump() {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Row(children: [
          const Icon(
            Icons.local_gas_station,
            color: Colors.white,
            size: 30,
          ),
          Text(
            FormatNumbers.formatSingleDigit(bicoId!),
            style: CustomTextStyles().whiteBoldStyle(25),
          ),
        ]),
      );
    }

    // Constrói o valor total do carrinho
    Widget _buildTotalValue() {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Obx(() => Text(
              'R\$ ${FormatNumbers.formatNumbertoString(_billGet.getTotalValueFromCart())} ',
              style: CustomTextStyles().whiteBoldStyle(20),
            )),
      );
    }

    // Constrói o botão de fidelidade
    Widget _buildIconFidelity() {
      return IconButton(
        onPressed: () =>
            Get.dialog(barrierDismissible: false, const FidelityDialog()),
        icon: const Icon(
          Icons.fingerprint,
          color: Colors.white,
          size: 30,
        ),
      );
    }

    // Constrói o app bar
    return Container(
      height: Get.size.height * 0.12,
      width: Get.size.width,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isSupplyPump!
              ? _buildCartShoppingIcon()
              : isProductFromMenu!
                  ? _buildBackButton()
                  : const SizedBox(
                      width: 50,
                    ),
          // Constrói a logo no app bar
          CustomLogo().getLogo(6),
          isSupplyPump!
              ? _buildIconPump()
              : isProduct!
                  ? _buildTotalValue()
                  : isPayment!
                      ? _buildIconFidelity()
                      : SizedBox(
                          width: Get.size.width * 0.09,
                        ),
        ],
      ),
    );
  }
}
