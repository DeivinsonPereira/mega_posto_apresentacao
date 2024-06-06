import 'package:get/get.dart';
import '../../../utils/methods/payment/payment_features.dart';
import '../components/dialog_value_payment.dart';

class LogicAddPayment {
  final _paymentFeatures = PaymentFeatures();

  Future<void> add(String paymentDoctoForm) async {
    DialogValuePayment dialogValuePayment =
        DialogValuePayment(paymentDoctoForm: paymentDoctoForm);

    /*if (paymentDoctoForm == Modalidade.DINHEIRO) {
      Get.dialog(barrierDismissible: false, dialogValuePayment);
    } else {*/
    _paymentFeatures.autoFillValuePayment();
    Get.dialog(barrierDismissible: false, dialogValuePayment);
    //   }
  }
}
