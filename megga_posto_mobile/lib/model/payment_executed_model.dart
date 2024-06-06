import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentExecuted {
  int? formaPagamentoId;
  int? numParcela;
  String? dataVencimento;
  double? valorParcela;
  double? valorIntegral;
  PaymentExecuted({
    this.formaPagamentoId,
    this.numParcela,
    this.dataVencimento,
    this.valorParcela,
    this.valorIntegral,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'formaPagamentoId': formaPagamentoId,
      'numParcela': numParcela,
      'dataVencimento': dataVencimento,
      'valorParcela': valorParcela,
      'valorIntegral': valorIntegral,
    };
  }

  factory PaymentExecuted.fromMap(Map<String, dynamic> map) {
    return PaymentExecuted(
      formaPagamentoId: map['formaPagamentoId'] != null ? map['formaPagamentoId'] as int : null,
      numParcela: map['numParcela'] != null ? map['numParcela'] as int : null,
      dataVencimento: map['dataVencimento'] != null ? map['dataVencimento'] as String : null,
      valorParcela: map['valorParcela'] != null ? map['valorParcela'] as double : null,
      valorIntegral: map['valorIntegral'] != null ? map['valorIntegral'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentExecuted.fromJson(String source) =>
      PaymentExecuted.fromMap(json.decode(source) as Map<String, dynamic>);
}
