import 'package:megga_posto_mobile/utils/methods/payment/payment_get.dart';

class IsRemainingValue {
  final listSelectedPayment = PaymentGet();

  bool isPaymentComplete() {
    return listSelectedPayment.getRemainingValue() == 0.0;
  }

  bool isPaymentIncomplete() {
    return listSelectedPayment.getRemainingValue() > 0.0;
  }

  bool isPaymentExceedingRemainingValue() {
    return listSelectedPayment.getRemainingValue() < 0.0;
  }
}
