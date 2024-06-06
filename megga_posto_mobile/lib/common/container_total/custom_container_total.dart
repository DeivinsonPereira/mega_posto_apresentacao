// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, must_be_immutable
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/container_total/logic_presentation_value.dart';

import '../../controller/payment_controller.dart';
import '../../utils/dependencies.dart';
import '../custom_text_style.dart';
import '../../utils/static/custom_colors.dart';

class CustomContainerTotal extends StatelessWidget {
  const CustomContainerTotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dependencies.paymentController();

    // Constrói o texto total
    Widget _buildTextTotal() {
      return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Text(
          'TOTAL',
          style: CustomTextStyles().whiteBoldStyle(25),
        ),
      );
    }

    // Constrói o valor total
    Widget _buildValueTotal(PaymentController _) {
      return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            LogicPresentationValue().presentationValue(_),
            style: CustomTextStyles().whiteBoldStyle(20),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }

    // Constrói a linha de conteúdo
    Widget _buildLineContent(PaymentController _) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _buildTextTotal(),
        Expanded(child: _buildValueTotal(_)),
      ]);
    }

    // Constrói o texto total
    Widget _buildLineTextTotal(PaymentController _) {
      return SizedBox(
        width: Get.size.width,
        child: _buildLineContent(_),
      );
    }

    // Constrói o corpo
    Widget _buildBody(PaymentController _) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildLineTextTotal(_),
          ),
        ],
      );
    }

    // Constrói o container total
    return GetBuilder<PaymentController>(
      builder: (_) {
        return Container(
          width: Get.size.width,
          height: Get.size.height * 0.085,
          decoration: const BoxDecoration(
            color: CustomColors.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: _buildBody(_),
        );
      },
    );
  }
}
