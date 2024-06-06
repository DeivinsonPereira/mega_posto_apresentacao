import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class SellItem {

  int? produto_id;
  int? sequencia;
  double? quantidade;
  double? total_liquido;
  int? tanque_id;
  int? bico_id;
  int? abastecimento_id;
  double? encerrante_final;
  double? preco_liquido;
  double? valor_desconto;
  double? valor_acrescimo;
  double? encerrante_inicial;
  double? preco_bruto;
  double? total_bruto;
  
  SellItem({
    this.produto_id,
    this.sequencia,
    this.quantidade,
    this.total_liquido,
    this.tanque_id,
    this.bico_id,
    this.abastecimento_id,
    this.encerrante_final,
    this.preco_liquido,
    this.valor_desconto,
    this.valor_acrescimo,
    this.encerrante_inicial,
    this.preco_bruto,
    this.total_bruto,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'produto_id': produto_id,
      'sequencia': sequencia,
      'quantidade': quantidade,
      'total_liquido': total_liquido,
      'tanque_id': tanque_id,
      'bico_id': bico_id,
      'abastecimento_id': abastecimento_id,
      'encerrante_final': encerrante_final,
      'preco_liquido': preco_liquido,
      'valor_desconto': valor_desconto,
      'valor_acrescimo': valor_acrescimo,
      'encerrante_inicial': encerrante_inicial,
      'preco_bruto': preco_bruto,
      'total_bruto': total_bruto,
    };
  }

  factory SellItem.fromMap(Map<String, dynamic> map) {
    return SellItem(
      produto_id: map['produto_id'] != null ? map['produto_id'] as int : null,
      sequencia: map['sequencia'] != null ? map['sequencia'] as int : null,
      quantidade: map['quantidade'] != null ? map['quantidade'] is int  ? (map['quantidade'] as int).toDouble() : map['quantidade'] as double : null,
      total_liquido: map['total_liquido'] != null ? map['total_liquido'] is int ? (map['total_liquido'] as int).toDouble() : map['total_liquido'] as double : null,
      tanque_id: map['tanque_id'] != null ? map['tanque_id'] as int : null,
      bico_id: map['bico_id'] != null ? map['bico_id'] as int : null,
      abastecimento_id: map['abastecimento_id'] != null ? map['abastecimento_id'] as int : null,
      encerrante_final: map['encerrante_final'] != null ? map['encerrante_final'] is int ? (map['encerrante_final'] as int).toDouble() : map['encerrante_final'] as double : null,
      preco_liquido: map['preco_liquido'] != null ? map['preco_liquido'] is int ? (map['preco_liquido'] as int).toDouble() : map['preco_liquido'] as double : null,
      valor_desconto:  map['valor_desconto'] != null ? map['valor_desconto'] is int ? (map['valor_desconto'] as int).toDouble() : map['valor_desconto'] as double : null,
      valor_acrescimo:  map['valor_acrescimo'] != null ? map['valor_acrescimo'] is int ? (map['valor_acrescimo'] as int).toDouble() : map['valor_acrescimo'] as double : null,
      encerrante_inicial:  map['encerrante_inicial'] != null ? map['encerrante_inicial'] is int ? (map['encerrante_inicial'] as int).toDouble() : map['encerrante_inicial'] as double : null,
      preco_bruto:  map['preco_bruto'] != null ? map['preco_bruto'] is int ? (map['preco_bruto'] as int).toDouble() : map['preco_bruto'] as double : null,
      total_bruto:  map['total_bruto'] != null ? map['total_bruto'] is int ? (map['total_bruto'] as int).toDouble() : map['total_bruto'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SellItem.fromJson(String source) => SellItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
