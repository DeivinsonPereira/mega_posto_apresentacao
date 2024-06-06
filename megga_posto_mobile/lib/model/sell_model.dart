// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:megga_posto_mobile/model/payment_form_selected.dart';
import 'sell_item_model.dart';

class Sell {
  double? valor_desconto;
  int? cliente_id;
  String? data_venda;
  double? total_nota;
  double? total_produtos;
  String? data_hora_venda;
  int? caixa_id;
  int? atendente_id;
  String? replicate_caixa_id;
  List<SellItem?>? itens;
  List<PaymentFormSelected?>? parcelas;

  Sell({
    this.valor_desconto,
    this.cliente_id,
    this.data_venda,
    this.total_nota,
    this.total_produtos,
    this.data_hora_venda,
    this.caixa_id,
    this.atendente_id,
    this.replicate_caixa_id,
    this.itens,
    this.parcelas,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'valor_desconto': valor_desconto,
      'cliente_id': cliente_id,
      'data_venda': data_venda,
      'total_nota': total_nota,
      'total_produtos': total_produtos,
      'data_hora_venda': data_hora_venda,
      'caixa_id': caixa_id,
      'atendente_id': atendente_id,
      'replicate_caixa_id': replicate_caixa_id,
      'itens': itens?.map((x) => x?.toMap()).toList(),
      'parcelas': parcelas?.map((x) => x?.toMap()).toList(),
    };
  }

  factory Sell.fromMap(Map<String, dynamic> map) {
    return Sell(
      valor_desconto: map['valor_desconto'] != null ? map['valor_desconto'] as double : null,
      cliente_id: map['cliente_id'] != null ? map['cliente_id'] as int : null,
      data_venda: map['data_venda'] != null ? map['data_venda'] as String : null,
      total_nota: map['total_nota'] != null ? map['total_nota'] as double : null,
      total_produtos: map['total_produtos'] != null ? map['total_produtos'] as double : null,
      data_hora_venda: map['data_hora_venda'] != null ? map['data_hora_venda'] as String : null,
      caixa_id: map['caixa_id'] != null ? map['caixa_id'] as int : null,
      atendente_id: map['atendente_id'] != null ? map['atendente_id'] as int : null,
      replicate_caixa_id: map['replicate_caixa_id'] != null ? map['replicate_caixa_id'] as String : null,
      itens: map['itens'] != null ? List<SellItem?>.from((map['itens'] as List<int>).map<SellItem?>((x) => SellItem?.fromMap(x as Map<String,dynamic>),),) : null,
      parcelas: map['parcelas'] != null ? List<PaymentFormSelected?>.from((map['parcelas'] as List<int>).map<PaymentFormSelected?>((x) => PaymentFormSelected?.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sell.fromJson(String source) =>
      Sell.fromMap(json.decode(source) as Map<String, dynamic>);
}
