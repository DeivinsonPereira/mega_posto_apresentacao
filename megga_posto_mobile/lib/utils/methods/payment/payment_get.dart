import 'package:megga_posto_mobile/utils/interface/i_payment_get.dart';
import '../../../controller/payment_controller.dart';
import '../../dependencies.dart';
import '../bill/bill_get.dart';

class PaymentGet implements IGetPaymentControllerMethods {
  late final PaymentController _paymentController;
  final _billGet = BillGet();

  PaymentGet._privateConstructor() {
    _paymentController = Dependencies.paymentController();
  }

  static final PaymentGet _instance = PaymentGet._privateConstructor();

  factory PaymentGet() => _instance;

  @override
  double getTotalPaid() {
    return _paymentController.listPaymentsSelected
        .fold(0.0, (first, second) => first + second.valorIntegral!);
  }

  @override
  double getChange() {
    double totalValueCartShopping = _billGet.getTotalValueFromCart();
    double totalPaid = getTotalPaid();

    double change = totalPaid - totalValueCartShopping;

    return change > 0 ? change : 0.0;
  }

  @override
  double getDiscountValue() {
    // TODO: implement getDiscountValue
    throw UnimplementedError();
  }

  @override
  double getRemainingValue() {
    var totalValue = _billGet.getTotalValueFromCart();
    return totalValue -
        _paymentController.valuePayment.value -
        _paymentController.enteredValue.value;
  }

  @override
  double getRemainingValueRestanding() {
    var totalValue = _billGet.getTotalValueFromCart();
    return totalValue - _paymentController.valuePayment.value;
  }
}
