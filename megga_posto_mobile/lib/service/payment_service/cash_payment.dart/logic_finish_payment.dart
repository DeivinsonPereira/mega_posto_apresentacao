import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/custom_cherry.dart';
import 'package:megga_posto_mobile/page/loading/loading_page.dart';
import 'package:megga_posto_mobile/page/payment/enum/modalidade_payment.dart';
import 'package:megga_posto_mobile/service/execute_sell/execute_sell.dart';
import 'package:megga_posto_mobile/service/print/teste_print_xml/print_xml.dart';
import 'package:megga_posto_mobile/utils/method_quantity_back.dart';
import 'package:megga_posto_mobile/utils/methods/payment/payment_features.dart';
import '../../../utils/is_remaining_value.dart';
import '../../../utils/methods/bill/bill_features.dart';

class LogicFinishPayment {
  final _isRemainingValue = IsRemainingValue();
  final _paymentFeatures = PaymentFeatures();
  final _billFeatures = BillFeatures();

  Future<void> confirmPayment(String modalidade) async {
    _paymentFeatures.addSelectedPayment(modalidade);

    if (_isRemainingValue.isPaymentComplete()) {
      _handlePaymentComplete();
    }

    if (_isRemainingValue.isPaymentIncomplete()) {
      _handlePaymentIncomplete();
    }

    if (_isRemainingValue.isPaymentExceedingRemainingValue()) {
      _handlePaymentExceedingRemainingValue();
    }
  }

  Future<void> _handlePaymentComplete() async {
    Get.dialog(const LoadingPage());
    String xml = await ExecuteSell().executeSell();
    if (xml == '') {
      const CustomCherryError(message: 'Erro ao efetuar o pagamento.')
          .show(Get.context!);
      _billFeatures.clearAll();
      _paymentFeatures.clearAll();
      MethodQuantityBack.back(6);
      return;
    }

    await PrintXml().printXml(xml);
    _billFeatures.clearAll();
    _paymentFeatures.clearAll();
    MethodQuantityBack.back(6);
  }

  Future<void> _handlePaymentIncomplete() async {
    _paymentFeatures.addSelectedPayment(ModalidadePaymment.DINHEIRO);
    //TODO adicionar o pagamento à lista de pagamentos
    _paymentFeatures.clearEnteredValue();
    MethodQuantityBack.back(2);
  }

  Future<void> _handlePaymentExceedingRemainingValue() async {
    _paymentFeatures.addSelectedPayment(ModalidadePaymment.DINHEIRO);
    //TODO adicionar o pagamento à lista de pagamentos
    //Posso criar um model para armazenar o troco e os pagamentos
    //Executar a venda
    MethodQuantityBack.back(2);
  }

  void backPayment() {
    _paymentFeatures.clearEnteredValue();
    _paymentFeatures.clearAll();

    MethodQuantityBack.back(2);
  }
}
