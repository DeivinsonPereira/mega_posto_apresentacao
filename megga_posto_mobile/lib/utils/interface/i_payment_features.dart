import '../../model/collections/payment_form.dart';

abstract class IPaymentFeatures {
  void addSelectedPayment(String paymentFormDocto);
  void autoFillValuePayment();
  void removeNumberFromEnteredValue();
  Future<void>setPaymentForms();
  void setPaymentFormsDocto(List<PaymentForm> paymentFormList);
  void addPaymentFormsToList(int quantity, PaymentForm paymentForms, double value);
  void addValuePayment();
  void addNumberToEnteredValue(String number, String paymentFormDocto);
  void clearEnteredValue();
  void clearAll();
}
