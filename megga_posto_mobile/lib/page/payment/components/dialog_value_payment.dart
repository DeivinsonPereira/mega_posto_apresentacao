// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:megga_posto_mobile/common/custom_back_button.dart';
import 'package:megga_posto_mobile/common/custom_continue_button.dart';
import 'package:megga_posto_mobile/common/custom_header_dialog.dart';
import 'package:megga_posto_mobile/utils/format_numbers.dart';
import 'package:megga_posto_mobile/utils/methods/payment/payment_get.dart';

import '../../../utils/dependencies.dart';
import '../../../service/payment_service/execute_payment.dart';
import '../../../utils/methods/payment/payment_features.dart';
import 'custom_keyboard.dart';

class DialogValuePayment extends StatelessWidget {
  final String paymentDoctoForm;
  const DialogValuePayment({
    super.key,
    required this.paymentDoctoForm,
  });

  @override
  Widget build(BuildContext context) {
    final _paymentController = Dependencies.paymentController();
    final _paymentFeatures = PaymentFeatures();
    final _paymentGet = PaymentGet();

    double sizeTextButtom = Get.size.height * 0.03;

    // Constrói o cabecalho
    Widget _buildHeader() {
      return const CustomHeaderDialog(text: 'Valor do pagamento');
    }

    // Constrói o valor restante
    Widget _buildRemainingValue() {
      return CustomHeaderDialog(
        text: 'Restante R\$ ${FormatNumbers.formatNumbertoString(
          _paymentGet.getRemainingValueRestanding(),
        )}',
      );
    }

    // Constrói os botoes de voltar e confirmar
    Widget _buildButtonsBackAndConfirm() {
      return Row(children: [
        Expanded(
          child: CustomBackButton(
            function: () {
              _paymentFeatures.clearEnteredValue();
              Get.back();
            },
            text: 'Voltar',
            sizeText: sizeTextButtom,
          ),
        ),
        Expanded(
          child: CustomContinueButton(
            function: () async {
              await ExecutePayment().executePayment(context, paymentDoctoForm);
            },
            text: 'Confirmar',
            sizeText: sizeTextButtom,
          ),
        ),
      ]);
    }

    // Constrói o valor
    Widget _buildValue() {
      return SizedBox(
        height: Get.size.height * 0.15,
        child: Center(
          child: Obx(
            () => Text(
              'R\$ ${FormatNumbers.formatNumbertoString(_paymentController.enteredValue.value)}',
              style: const TextStyle(fontSize: 40),
            ),
          ),
        ),
      );
    }

    // Constrói o conteúdo
    Widget _buildContent() {
      return Column(children: [
        _buildHeader(),
        _buildRemainingValue(),
        _buildValue(),
        Expanded(
          child: CustomKeyboard(paymentFormDocto: paymentDoctoForm),
        ),
        _buildButtonsBackAndConfirm(),
      ]);
    }

    // Constrói o corpo do dialog
    Widget _buildBody() {
      return SizedBox(
        height: Get.size.height * 0.75,
        width: Get.size.width,
        child: _buildContent(),
      );
    }

    // Constrói o dialog
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: _buildBody(),
    );
  }
}
