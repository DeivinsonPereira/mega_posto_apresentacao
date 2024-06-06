// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters
import 'package:flutter/material.dart';

import 'package:megga_posto_mobile/model/payment_selected_model.dart';

import '../utils/format_numbers.dart';
import '../utils/format_string.dart';
import 'container_total/logic_name_payment_card.dart';
import 'custom_text_style.dart';

class CustomNameAndValuePayment extends StatelessWidget {
  final PaymentSelected paymentSelected;
  const CustomNameAndValuePayment({
    Key? key,
    required this.paymentSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LogicNamePaymentCard().setNamePaymentCard(paymentSelected),
                style: CustomTextStyles().blackBoldStyle(20),
              ),
              Text(
                FormatString.maxLengthText(
                    'R\$${FormatNumbers.formatNumbertoString(paymentSelected.value)}',
                    18),
                style: CustomTextStyles().blackBoldStyle(20),
              ),
            ],
          );
  }
}
