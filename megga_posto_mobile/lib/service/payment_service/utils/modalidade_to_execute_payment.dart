import 'package:flutter_clisitef/model/modalidade.dart';

class ModalidadeToExecutePayment {

  ModalidadeToExecutePayment._privateConstructor();
  static final ModalidadeToExecutePayment _instance = ModalidadeToExecutePayment._privateConstructor();

  static ModalidadeToExecutePayment get instance => _instance;


  int chooseModalidadePayment(String paymentForm) {
    String paymentFormUpperCase = paymentForm.toUpperCase();

    switch (paymentFormUpperCase) {
      case 'DEBITO':
        return Modalidade.debito.value;
      case 'CREDITO':
        return Modalidade.credito.value;
      default:
        return Modalidade.debito.value;
    }
  }
}
