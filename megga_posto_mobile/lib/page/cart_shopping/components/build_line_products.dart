// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/model/product_and_quantity_model.dart';

import '../../../common/custom_text_style.dart';
import '../../../utils/dependencies.dart';
import '../../../utils/format_numbers.dart';
import '../../../utils/format_string.dart';

class BuildLineProducts extends StatelessWidget {
  const BuildLineProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var billController = Dependencies.billController();

    // Constrói o nome do produto no carrinho
    Widget _buildNameProduct(ProductAndQuantityModel productAndQuanity) {
      return SizedBox(
        width: Get.size.width * 0.45,
        child: Text(
          FormatString.maxLengthText(productAndQuanity.product!.descricao!, 17),
          style: CustomTextStyles().whiteStyle(16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    // Constrói a quantidade do produto no carrinho
    Widget _buildQuantityProduct(ProductAndQuantityModel productAndQuanity) {
      return SizedBox(
        width: Get.size.width * 0.17,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            productAndQuanity.quantity.toString(),
            style: CustomTextStyles().whiteStyle(16),
          ),
        ),
      );
    }

    // Constrói o valor total do produto no carrinho
    Widget _buildTotalProduct(ProductAndQuantityModel productAndQuanity) {
      return SizedBox(
        width: Get.size.width * 0.32,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'R\$${FormatNumbers.formatNumbertoString(productAndQuanity.product!.valor! * productAndQuanity.quantity!)}',
            style: CustomTextStyles().whiteBoldStyle(16),
          ),
        ),
      );
    }

    // Constrói as linhas dos itens
    Widget _buildLinesProducts(ProductAndQuantityModel productAndQuanity) {
      return SizedBox(
        height: Get.size.height * 0.05,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  _buildNameProduct(productAndQuanity),
                  _buildQuantityProduct(productAndQuanity),
                  _buildTotalProduct(productAndQuanity),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Constrói os itens do carrinho
    return SizedBox(
      height: Get.size.height * 0.5,
      child: ListView.builder(
          itemCount:
              billController.cartShopping.value.productAndQuantity!.length,
          itemBuilder: (context, index) {
            ProductAndQuantityModel? productAndQuanity =
                billController.cartShopping.value.productAndQuantity![index];

            return _buildLinesProducts(productAndQuanity);
          }),
    );
  }
}
