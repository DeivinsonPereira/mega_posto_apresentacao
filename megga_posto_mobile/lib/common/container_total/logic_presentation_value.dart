// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:megga_posto_mobile/utils/methods/payment/payment_get.dart';

import '../../controller/payment_controller.dart';
import '../../utils/format_numbers.dart';

class LogicPresentationValue {
  String presentationValue(PaymentController paymentController) {
    final _paymentGet = PaymentGet();
    // se o valor for negativo, mostrar o valor positivo
    if (_paymentGet.getRemainingValue() < 0.0) {
      return 'Troco: R\$ ${FormatNumbers.formatNumbertoString(_paymentGet.getRemainingValue().abs())}';
    } else {
      return 'R\$ ${FormatNumbers.formatNumbertoString(_paymentGet.getRemainingValue())}';
    }
  }
}
