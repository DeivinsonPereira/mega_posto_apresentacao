import 'package:megga_posto_mobile/model/payment_selected_model.dart';
import 'package:megga_posto_mobile/page/payment/enum/modalidade_payment.dart';

class LogicNamePaymentCard {
  String setNamePaymentCard(PaymentSelected paymentSelected) {
    switch (paymentSelected.paymentForm.tipoDocto) {
      case ModalidadePaymment.DINHEIRO:
        return 'Dinheiro';
      case ModalidadePaymment.DEBITO:
        return 'Cartão de Debito';
      case ModalidadePaymment.CREDITO:
        return 'Cartão de Crédito';
      case ModalidadePaymment.NOTA:
        return 'Nota';
      case ModalidadePaymment.PIX:
        return 'Pix';
      default:
        return 'Dinheiro';
    }
  }
}
