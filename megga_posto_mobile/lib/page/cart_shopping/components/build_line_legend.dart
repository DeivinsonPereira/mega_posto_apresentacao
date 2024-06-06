// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/custom_text_style.dart';

class BuildLineLegend extends StatelessWidget {
  const BuildLineLegend({super.key});

  @override
  Widget build(BuildContext context) {
    // Constrói o nome da legenda
    Widget _buildNameLegend() {
      return SizedBox(
        width: Get.size.width * 0.50,
        child: Text(
          'NOME',
          style: CustomTextStyles().whiteStyle(20),
        ),
      );
    }

    // Constrói a quantidade da legenda
    Widget _buildQuantityLegend() {
      return SizedBox(
        width: Get.size.width * 0.17,
        child: Text(
          'QTDE',
          style: CustomTextStyles().whiteStyle(20),
        ),
      );
    }

    // Constrói o valor da legenda
    Widget _buildValueLegend() {
      return SizedBox(
        width: Get.size.width * 0.27,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'VALOR',
            style: CustomTextStyles().whiteStyle(20),
            textAlign: TextAlign.right,
          ),
        ),
      );
    }

    // Constrói o divisor
    Widget _buildDivider() {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        child: Divider(
          color: Color.fromARGB(90, 255, 255, 255),
          thickness: 2,
        ),
      );
    }

    //Constrói a legenda
    return SizedBox(
      width: Get.size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 8.0, 4.0, 8.0),
            child: Row(
              children: [
                _buildNameLegend(),
                _buildQuantityLegend(),
                _buildValueLegend(),
              ],
            ),
          ),
          _buildDivider(),
        ],
      ),
    );
  }
}
