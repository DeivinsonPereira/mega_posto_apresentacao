// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'collections/payment_form.dart';

class PaymentSelected {
  PaymentForm paymentForm;
  double value;

  PaymentSelected({
    required this.paymentForm,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'paymentForm': paymentForm.toMap(),
      'value': value,
    };
  }

  factory PaymentSelected.fromMap(Map<String, dynamic> map) {
    return PaymentSelected(
      paymentForm:
          PaymentForm.fromMap(map['paymentForm'] as Map<String, dynamic>),
      value: map['value'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentSelected.fromJson(String source) =>
      PaymentSelected.fromMap(json.decode(source) as Map<String, dynamic>);
}
