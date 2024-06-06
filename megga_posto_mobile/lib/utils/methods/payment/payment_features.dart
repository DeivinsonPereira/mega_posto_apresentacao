import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';
import 'package:megga_posto_mobile/utils/interface/i_payment_features.dart';
import 'package:megga_posto_mobile/utils/methods/payment/payment_get.dart';

import '../../../model/collections/payment_form.dart';
import '../../../model/payment_executed_model.dart';
import '../../../page/payment/enum/modalidade_payment.dart';
import '../../../repositories/isar_db/payment_form/get_payment_form.dart';
import '../../date_time_formatter.dart';
import '../bill/bill_get.dart';

class PaymentFeatures implements IPaymentFeatures {
  final _paymentController = Dependencies.paymentController();
  final _paymentGet = PaymentGet();
  final _billGet = BillGet();
  final _logger = Logger();

  @override
  // Adiciona o valor na variável enteredValue
  void addNumberToEnteredValue(String number, String paymentFormDocto) {
    var totalValue = _billGet.getTotalValueFromCart();
    double maxValue = totalValue - _paymentController.valuePayment.value;
    double newValue = double.parse(number) / 100;
    double valueTest = (_paymentController.enteredValue.value * 10) + newValue;
    if (paymentFormDocto != ModalidadePaymment.DINHEIRO) {
      if (valueTest <= maxValue) {
        _paymentController.enteredValue.value =
            num.parse(valueTest.toStringAsFixed(2)).toDouble();
        _paymentController.update();
      }
    } else {
      _paymentController.enteredValue.value =
          num.parse(valueTest.toStringAsFixed(2)).toDouble();
      _paymentController.update();
    }
  }

  @override
  //Adiciona formas de pagamento à lista
  void addSelectedPayment(String paymentFormDocto) {
    if (_paymentController.enteredValue.value > 0.0) {
      PaymentForm paymentForm = _paymentController.paymentForms
          .firstWhere((element) => element.tipoDocto == paymentFormDocto);
      PaymentExecuted paymentSelected = PaymentExecuted(
        formaPagamentoId: paymentForm.codigo,
        dataVencimento: DatetimeFormatter.formatDate(DateTime.now()),
        numParcela: 1,
        valorParcela: 0,
        valorIntegral: _paymentController.enteredValue.value,
        //TODO Ajustar aqui (verificar os campos)
      );
      _paymentController.valuePayment.value +=
          _paymentController.enteredValue.value;
      _paymentController.listPaymentsSelected.add(paymentSelected);
      _paymentController.update();
    }

    clearEnteredValue();
  }

  @override
  //Adiciona parcelas a lista
  void addPaymentFormsToList(
      int quantity, PaymentForm paymentForms, double value) {
    if (paymentForms.tipoAvista!.toUpperCase() == 'N') {
      PaymentExecuted installment = PaymentExecuted(
        formaPagamentoId: paymentForms.codigo!,
        numParcela: 1,
        dataVencimento: DateTime.now().toString(),
        valorParcela: value,
      );

      _paymentController.listPaymentsSelected.add(installment);
    } else {
      PaymentExecuted installment = PaymentExecuted(
          formaPagamentoId: paymentForms.codigo!,
          numParcela: quantity,
          dataVencimento: DatetimeFormatter.getDataPlusDays(DateTime.now(), 30),
          valorParcela: value / quantity);
      _paymentController.listPaymentsSelected.add(installment);
    }
  }

  @override
  //Adiciona o valor na variável valuePayment
  void addValuePayment() {
    var totalValue = _billGet.getTotalValueFromCart();
    var remaining = totalValue -
        _paymentController.valuePayment.value -
        _paymentController.enteredValue.value;
    if (remaining > _paymentController.enteredValue.value) {
      _paymentController.valuePayment.value +=
          _paymentController.enteredValue.value;
      _paymentController.update();
    }
  }

  @override
  //Adiciona o valor na variável enteredValue
  void autoFillValuePayment() {
    _paymentController.enteredValue.value = _paymentGet.getRemainingValue();
    _paymentController.update();
  }

  @override
  //Limpa todas as variáveis
  void clearAll() {
    _paymentController.valuePayment.value = 0;
    _paymentController.enteredValue.value = 0;
    _paymentController.listPaymentsSelected.clear();
  }

  @override
  //Limpa a variável enteredValue
  void clearEnteredValue() {
    _paymentController.enteredValue.value = 0;
    _paymentController.update();
  }

  @override
  //Remove o valor na variável enteredValue
  void removeNumberFromEnteredValue() {
    if (_paymentController.enteredValue.value > 0) {
      String valueString =
          _paymentController.enteredValue.value.toStringAsFixed(2);
      if (valueString.length > 1) {
        String newValue = valueString.substring(0, valueString.length - 1);
        double newValueDouble = double.parse(newValue) / 10;
        _paymentController.enteredValue.value = newValueDouble;
      } else {
        _paymentController.enteredValue.value = 0;
      }
      _paymentController.update();
    }
  }

  @override
  //Define as formas de pagamento
  Future<void> setPaymentForms() async {
    List<PaymentForm> paymentFormList = await GetPaymentForm().getPayment();
    _paymentController.paymentForms.assignAll(paymentFormList);
    if (_paymentController.paymentForms.isNotEmpty) {
      setPaymentFormsDocto(paymentFormList);
    } else {
      _logger.e('Nenhum pagamento encontrado');
    }
    _paymentController.update();
  }

  @override
  //Define as formas de pagamento do tipo docto
  void setPaymentFormsDocto(List<PaymentForm> paymentFormList) {
    _paymentController.paymentFormsDocto.clear();
    for (var paymentForm in paymentFormList) {
      if (!_paymentController.paymentFormsDocto
              .contains(paymentForm.tipoDocto) &&
          paymentForm.tipoDocto != null &&
          paymentForm.tipoDocto!.isNotEmpty) {
        _paymentController.paymentFormsDocto.add(paymentForm.tipoDocto!);
      }
    }
    _paymentController.paymentFormsDocto.sort();
  }
}
