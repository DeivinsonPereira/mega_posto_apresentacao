// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/custom_elevated_button.dart';

import 'package:megga_posto_mobile/common/custom_header_dialog.dart';
import 'package:megga_posto_mobile/common/custom_logo.dart';
import 'package:megga_posto_mobile/service/payment_service/tef_payment.dart/sitef/payment_clisitef.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';
import 'package:megga_posto_mobile/utils/format_numbers.dart';
import 'package:megga_posto_mobile/utils/static/custom_colors.dart';

import '../../../../common/custom_text_style.dart';

class SitefPaymentDialog extends StatelessWidget {
  final String paymentType;
  const SitefPaymentDialog({
    super.key,
    required this.paymentType,
  });

  @override
  Widget build(BuildContext context) {
    final _paymentController = Dependencies.paymentController();
    final _clisitefController = Dependencies.clisitefController();
    final _paymentClisitef = PaymentClisitef.instance;

    Widget _buildButtonBack() {
      return Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: CustomElevatedButton(
                  text: 'Voltar',
                  textStyle: CustomTextStyles().whiteBoldStyle(20),
                  function: () {
                    _clisitefController.pdv.client.continueTransaction('1');
                    _paymentClisitef.cancelCurrentTransaction();
                    _paymentClisitef.cancel();
                    Get.back();
                  },
                  radious: 0,
                  colorButton: CustomColors.elevatedButtonSecondary),
            ),
          ),
        ],
      );
    }

    Widget _buildBufferText() {
      return Obx(() => Text(
            _clisitefController.lastMsgCashierCustomer.value,
            style: CustomTextStyles().blackBoldStyle(20),
          ));
    }

    Widget _buildTextTitle() {
      return Text(
        'R\$ ${FormatNumbers.formatNumbertoString(_paymentController.enteredValue.value)} - $paymentType',
        style: CustomTextStyles().blackBoldStyle(20),
      );
    }

    Widget _buildLogo() {
      return CustomLogo().getLogo(0.5);
    }

    Widget _buildHeader() {
      return const CustomHeaderDialog(text: 'Pagamento');
    }

    Widget _buildBody() {
      return Container(
        color: Colors.white,
        height: Get.size.height,
        width: Get.size.width,
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(
              height: 10,
            ),
            _buildLogo(),
            SizedBox(
              height: Get.size.height * 0.1,
            ),
            _buildTextTitle(),
            SizedBox(
              height: Get.size.height * 0.05,
            ),
            Expanded(child: _buildBufferText()),
            _buildButtonBack(),
          ],
        ),
      );
    }

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: _buildBody(),
    );
  }
}
