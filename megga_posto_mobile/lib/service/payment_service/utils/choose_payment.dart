import '../../../page/payment/enum/modalidade_payment.dart';

class ChoosePayment {

  bool isPixPayment(String paymentDoctoForm) {
    return paymentDoctoForm == ModalidadePaymment.PIX;
  }

  bool isCashPayment(String paymentDoctoForm) {
    return paymentDoctoForm == ModalidadePaymment.DINHEIRO;
  }

  bool isCreditPayment(String paymentDoctoForm) {
    return paymentDoctoForm == ModalidadePaymment.CREDITO;
  }

  bool isDebitPayment(String paymentDoctoForm) {
    return paymentDoctoForm == ModalidadePaymment.DEBITO;
  }

  bool isNota(String paymentDoctoForm) {
    return paymentDoctoForm == ModalidadePaymment.NOTA;
  }

  String chooseDescription(String paymentDocto) {
    switch (paymentDocto) {
      case ModalidadePaymment.PIX:
        return 'Pix';
      case ModalidadePaymment.DINHEIRO:
        return 'Dinheiro';
      case ModalidadePaymment.CREDITO:
        return 'Credito';
      case ModalidadePaymment.DEBITO:
        return 'Debito';
      case ModalidadePaymment.NOTA:
        return 'Nota';
      default:
        return 'Dinheiro';
    }
  }

}
