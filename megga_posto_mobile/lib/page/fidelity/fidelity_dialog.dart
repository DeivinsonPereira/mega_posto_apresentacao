// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
//import 'package:pinput/pinput.dart';

import '../../common/custom_elevated_button.dart';
import '../../common/custom_header_dialog.dart';
import '../../utils/static/custom_colors.dart';
import '../../common/custom_text_style.dart';
import '../../utils/dependencies.dart';
import 'logic/logic_fidelity.dart';

class FidelityDialog extends StatelessWidget {
  const FidelityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var paymentFormController = Dependencies.paymentController();

    // Constrói o botão de voltar
    Widget _buildBackButton() {
      return SizedBox(
        width: Get.size.width * 0.43,
        height: 40,
        child: CustomElevatedButton(
            text: 'Voltar',
            textStyle: CustomTextStyles().whiteBoldStyle(20),
            function: () {
              paymentFormController.codeFidelityController.clear();
              Get.back();
            },
            radious: 0,
            colorButton: CustomColors.elevatedButtonSecondary),
      );
    }

    // Constrói o botão de confirmar
    Widget _buildConfirmButton() {
      return SizedBox(
        width: Get.size.width * 0.43,
        height: 40,
        child: CustomElevatedButton(
            text: 'Confirmar',
            textStyle: CustomTextStyles().blackBoldStyle(20),
            function: () async => await LogicFidelity().getFidelity(),
            radious: 0,
            colorButton: CustomColors.confirmButton),
      );
    }

    // Constrói a linha dos botões de voltar e de confirmar
    Widget _buildBackAndConfirmButton() {
      return Row(
        children: [
          Expanded(child: _buildBackButton()),
          Expanded(child: _buildConfirmButton()),
        ],
      );
    }

    // Constrói o texto
    Widget _buildText() {
      return SizedBox(
        height: Get.size.height * 0.1,
        child: Center(
          child: Text(
            'Digite o código',
            style: CustomTextStyles().blackBoldStyle(20),
          ),
        ),
      );
    }

    // Constrói o pinput
    Widget _buildPinput() {
      return Padding(
        padding: EdgeInsets.only(
          bottom: Get.size.height * 0.1,
          left: Get.size.width * 0.05,
          right: Get.size.width * 0.05,
        ),
        child: PinInputTextField(
          controller: paymentFormController.codeFidelityController,
          pinLength: 4,
          autoFocus: true,
          cursor: Cursor(
            color: Colors.black,
            enabled: true,
            width: 1,
          ),
          keyboardType: TextInputType.text,
          decoration: BoxLooseDecoration(
            strokeColorBuilder: const FixedColorBuilder(Colors.black),
          ),
        ),
      );
    }

    // Constrói o corpo do dialog
    Widget _buildBody() {
      return Column(children: [
        const CustomHeaderDialog(
          text: 'Fidelidade',
        ),
        _buildText(),
        Expanded(
          child: _buildPinput(),
        ),
        _buildBackAndConfirmButton(),
      ]);
    }

    // Constrói o dialog
    return Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Container(
          width: Get.size.width * 0.5,
          height: Get.size.height * 0.45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: _buildBody(),
        ));
  }
}
