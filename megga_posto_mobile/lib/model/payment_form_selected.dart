import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class PaymentFormSelected {
  int forma_pagamento_id;
  int num_parcela;
  String data_vencimento;
  double valor_parcela;
  
  PaymentFormSelected({
    required this.forma_pagamento_id,
    required this.num_parcela,
    required this.data_vencimento,
    required this.valor_parcela,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'forma_pagamento_id': forma_pagamento_id,
      'num_parcela': num_parcela,
      'data_vencimento': data_vencimento,
      'valor_parcela': valor_parcela,
    };
  }

  factory PaymentFormSelected.fromMap(Map<String, dynamic> map) {
    return PaymentFormSelected(
      forma_pagamento_id: map['forma_pagamento_id'] as int,
      num_parcela: map['num_parcela'] as int,
      data_vencimento: map['data_vencimento'] as String,
      valor_parcela: map['valor_parcela'] is int? (map['valor_parcela'] as int).toDouble() : map['valor_parcela'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentFormSelected.fromJson(String source) => PaymentFormSelected.fromMap(json.decode(source) as Map<String, dynamic>);
}

  


