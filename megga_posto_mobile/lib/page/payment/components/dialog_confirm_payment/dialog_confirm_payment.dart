// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/custom_back_button.dart';
import 'package:megga_posto_mobile/common/custom_continue_button.dart';
import 'package:megga_posto_mobile/common/custom_header_dialog.dart';
import 'package:megga_posto_mobile/page/payment/enum/modalidade_payment.dart';
import 'package:megga_posto_mobile/service/payment_service/cash_payment.dart/logic_finish_payment.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';
import 'package:megga_posto_mobile/utils/format_numbers.dart';
import '../../../../common/custom_text_style.dart';

class DialogConfirmPayment extends StatelessWidget {
  const DialogConfirmPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final _paymentController = Dependencies.paymentController();

    // Constrói o botão de confirmar
    Widget _buildConfirmButton() {
      return CustomContinueButton(
        text: 'Confirmar',
        function: () async => await LogicFinishPayment()
            .confirmPayment(ModalidadePaymment.DINHEIRO),
        sizeText: 20,
      );
    }

    // Constrói o botão de voltar
    Widget _buildBackButton() {
      return CustomBackButton(
        text: 'Voltar',
        function: () => LogicFinishPayment().backPayment(),
        sizeText: 20,
      );
    }

    // Constrói a linha dos botões de continuar e de voltar
    Widget _buildBackAndContinueButton() {
      return Row(
        children: [
          Expanded(child: _buildBackButton()),
          Expanded(child: _buildConfirmButton()),
        ],
      );
    }

    // Constrói o texto de confirmação
    Widget _buildText() {
      return Text(
        'Deseja confirmar o pagamento?',
        style: CustomTextStyles().blackBoldStyle(24),
        textAlign: TextAlign.center,
      );
    }

    // Constrói o valor do pagamento
    Widget _buildValue() {
      return SizedBox(
        height: Get.size.height * 0.3,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'R\$ ${FormatNumbers.formatNumbertoString(_paymentController.enteredValue.value)}',
            style: CustomTextStyles().blackBoldStyle(30),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    // Constrói o header do dialog
    Widget _buildHeader() {
      return const CustomHeaderDialog(text: 'Confirmar Pagamento');
    }

    // Constrói o corpo do Dialog
    Widget _buildBody() {
      return Column(
        children: [
          _buildHeader(),
          _buildValue(),
          Expanded(child: _buildText()),
          _buildBackAndContinueButton(),
        ],
      );
    }

    // Retorna o Dialog
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: SizedBox(
        width: Get.size.width * 0.5,
        height: Get.size.height * 0.75,
        child: _buildBody(),
      ),
    );
  }
}
