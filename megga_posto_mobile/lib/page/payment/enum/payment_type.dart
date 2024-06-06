import 'package:megga_posto_mobile/page/payment/enum/modalidade_payment.dart';

class PaymentType {
  String doctoToPaymentType(String docto) {
    switch (docto) {
      case ModalidadePaymment.CREDITO:
        return 'CREDITO';
      case ModalidadePaymment.DEBITO:
        return 'DEBITO';
      case ModalidadePaymment.DINHEIRO:
        return 'DINHEIRO';
      case ModalidadePaymment.PIX:
        return 'PIX';
      default:
        return 'NOTA';
    }
  }
}
