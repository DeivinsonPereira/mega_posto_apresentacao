// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:megga_posto_mobile/common/custom_header_app_bar.dart';
import 'package:megga_posto_mobile/common/custom_text_style.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';

import '../../common/custom_back_button.dart';
import '../../common/container_total/custom_container_total.dart';
import 'components/custom_card_payment_form.dart';
import 'logic/logic_back_buttom.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    var paymentController = Dependencies.paymentController();

    // Constrói o título da página
    Widget _buildTitle() {
      return Text(
        'PAGAMENTO',
        style: CustomTextStyles().blackBoldStyle(40),
      );
    }

    // Constrói os Cards de pagamento
    Widget _buildPaymentCards() {
      return ListView.builder(
          itemCount: paymentController.paymentFormsDocto.length,
          itemBuilder: (context, index) {
            String paymentFormSelected =
                paymentController.paymentFormsDocto[index];
            return CustomCardPaymentForm(
              paymentFormSelected: paymentFormSelected,
              index: index,
            );
          });
    }

    // constrói o corpo dos botões de voltar e continuar
    Widget _buildBackAndContinueButtonBody() {
      return Row(children: [
        Expanded(
          child: CustomBackButton(
            function: () => LogicBackButtom().backButtom(),
            text: 'Voltar',
          ),
        ),
      ]);
    }

    // Constrói o corpo da página
    Widget _buildBody() {
      return SizedBox(
        child: Column(
          children: [
            CustomHeaderAppBar(isPayment: true),
            _buildTitle(),
            Expanded(child: _buildPaymentCards()),
            const CustomContainerTotal(),
            _buildBackAndContinueButtonBody(),
          ],
        ),
      );
    }

    // Constrói o Scaffold
    return Scaffold(
      body: _buildBody(),
    );
  }
}
