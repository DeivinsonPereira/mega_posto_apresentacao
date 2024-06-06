// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import 'package:megga_posto_mobile/common/custom_text_style.dart';
import 'package:megga_posto_mobile/utils/methods/payment/payment_features.dart';


class CustomKeyboard extends StatelessWidget {
  final String paymentFormDocto;
  const CustomKeyboard({
    super.key,
    required this.paymentFormDocto,
  });

  @override
  Widget build(BuildContext context) {
    final _paymentFeatures = PaymentFeatures();

    // Constrói os botões do teclado
    Widget _buildThreeKeyboardNumbers(List<String> number) {
      List<Widget> list = [];

      for (var i = 0; i < 3; i++) {
        list.add(
          Expanded(
            child: InkWell(
              onTap: () {
                _paymentFeatures.addNumberToEnteredValue(
                    number[i], paymentFormDocto);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Center(
                  child: Text(
                    number[i],
                    style: CustomTextStyles().blackBoldStyle(16),
                  ),
                ),
              ),
            ),
          ),
        );
      }

      return Row(mainAxisAlignment: MainAxisAlignment.center, children: list);
    }

    // Constrói o botão 0 e o botão de apagar
    Widget _buildOneKeyboardCharacter() {
      List<Widget> listReturn = [];

      for (var i = 0; i < 2; i++) {
        listReturn.add(
          Expanded(
            child: InkWell(
              onTap: () {
                if (i == 0) {
                  _paymentFeatures.addNumberToEnteredValue(
                      '0', paymentFormDocto);
                } else {
                  _paymentFeatures.removeNumberFromEnteredValue();
                }
              },
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: ListWidgets.listWidgets[i]),
            ),
          ),
        );
      }

      return Row(
          mainAxisAlignment: MainAxisAlignment.center, children: listReturn);
    }

    // Constrói o teclado
    return Column(
      children: [
        Expanded(child: _buildThreeKeyboardNumbers(['1', '2', '3'])),
        Expanded(child: _buildThreeKeyboardNumbers(['4', '5', '6'])),
        Expanded(child: _buildThreeKeyboardNumbers(['7', '8', '9'])),
        Expanded(child: _buildOneKeyboardCharacter()),
      ],
    );
  }
}

// lista de widgets
abstract class ListWidgets {
  static List<Widget> listWidgets = [
    Center(
      child: Text(
        '0',
        style: CustomTextStyles().blackBoldStyle(16),
      ),
    ),
    const Center(
      child: Icon(
        Icons.backspace,
        color: Colors.black,
      ),
    ),
  ];
}
