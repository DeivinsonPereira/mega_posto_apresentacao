// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/custom_text_style.dart';
import '../../../utils/dependencies.dart';
import '../../../utils/format_numbers.dart';

class BuildLineSupply extends StatelessWidget {
  const BuildLineSupply({super.key});

  @override
  Widget build(BuildContext context) {
    var billController = Dependencies.billController();

    // Constrói o nome do abastecimento no carrinho
    Widget _buildNameSupply() {
      return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: SizedBox(
          width: Get.size.width * 0.45,
          child: Text(
            billController.supplySelected.descricaoBico,
            style: CustomTextStyles().whiteStyle(17),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }

    // Constrói a quantidade do abastecimento no carrinho
    Widget _buildQuantitySupply() {
      return SizedBox(
        width: Get.size.width * 0.17,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            billController.supplyPumpSelected.quantidade!.toStringAsFixed(3),
            style: CustomTextStyles().whiteStyle(16),
          ),
        ),
      );
    }

    // Constrói o valor do abastecimento no carrinho
    Widget _buildTotalSupply() {
      return SizedBox(
        width: Get.size.width * 0.32,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'R\$${FormatNumbers.formatNumbertoString(billController.supplyPumpSelected.total)}',
            style: CustomTextStyles().whiteBoldStyle(16),
          ),
        ),
      );
    }

    // Constrói a linha do abastecimento no carrinho
    return billController.supplyPumpSelected.id != 0
        ? SizedBox(
            height: Get.size.height * 0.07,
            child: Row(
              children: [
                _buildNameSupply(),
                _buildQuantitySupply(),
                _buildTotalSupply(),
              ],
            ),
          )
        : Container();
  }
}
