// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/container_total/custom_container_total.dart';
import 'package:megga_posto_mobile/common/custom_continue_button.dart';
import 'package:megga_posto_mobile/common/custom_header_app_bar.dart';
import 'package:megga_posto_mobile/utils/methods/payment/payment_features.dart';
import 'package:megga_posto_mobile/utils/static/custom_colors.dart';
import 'package:megga_posto_mobile/page/cart_shopping/components/build_line_legend.dart';
import 'package:megga_posto_mobile/page/payment/payment_page.dart';

import '../../common/custom_back_button.dart';
import 'components/build_line_products.dart';
import 'components/build_line_supply.dart';

class CartShoppingPage extends StatelessWidget {
  const CartShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _paymentFeatures = PaymentFeatures();

    // Constrói os botões de continuar e voltar
    Widget _buildButtons() {
      return Row(
        children: [
          Expanded(
            child: CustomBackButton(
              function: () {
                _paymentFeatures.clearAll();
                Get.back();
              },
              text: 'Voltar',
            ),
          ),
          Expanded(
            child: CustomContinueButton(
              text: 'Seguir',
              function: () => Get.to(
                () => const PaymentPage(),
              ),
            ),
          )
        ],
      );
    }

    // Constrói o corpo da página
    Widget _buildBody() {
      return SizedBox(
        width: Get.size.width,
        height: Get.size.height,
        child: Column(children: [
          CustomHeaderAppBar(),
          const BuildLineLegend(),
          const BuildLineSupply(),
          const SizedBox(height: 3.0),
          const Expanded(child: BuildLineProducts()),
          const CustomContainerTotal(),
          _buildButtons(),
        ]),
      );
    }

    // Constrói a page
    return Scaffold(
        backgroundColor: CustomColors.backgroundCartShopping,
        body: _buildBody());
  }
}
