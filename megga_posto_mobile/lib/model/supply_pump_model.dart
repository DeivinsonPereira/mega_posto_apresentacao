// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SupplyPump {
  int? id;
  int? caixaId;
  int? bicoId;
  int? tanque_id;
  int? produto_id;
  String? replicate_caixa_id;
  int? notaFiscalId;
  String? dataHora;
  double? unitario;
  double? quantidade;
  double? total;
  double? encerrante_inicial;
  double? encerrante_final;

  SupplyPump({
    this.id,
    this.caixaId,
    this.bicoId,
    this.tanque_id,
    this.produto_id,
    this.replicate_caixa_id,
    this.notaFiscalId,
    this.dataHora,
    this.unitario,
    this.quantidade,
    this.total,
    this.encerrante_inicial,
    this.encerrante_final,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'caixaId': caixaId,
      'bicoId': bicoId,
      'tanque_id': tanque_id,
      'produto_id': produto_id,
      'replicate_caixa_id': replicate_caixa_id,
      'notaFiscalId': notaFiscalId,
      'dataHora': dataHora,
      'unitario': unitario,
      'quantidade': quantidade,
      'total': total,
      'encerrante_inicial': encerrante_inicial,
      'encerrante_final': encerrante_final,
    };
  }

  factory SupplyPump.fromMap(Map<String, dynamic> map) {
    return SupplyPump(
      id: map['ID'] != null ? map['ID'] as int : null,
      caixaId: map['CAIXA_ID'] != null ? map['CAIXA_ID'] as int : null,
      bicoId: map['BICO_ID'] != null ? map['BICO_ID'] as int : null,
      tanque_id: map['TANQUE_ID'] != null ? map['TANQUE_ID'] as int : null,
      produto_id: map['PRODUTO_ID'] != null ? map['PRODUTO_ID'] as int : null,
      replicate_caixa_id: map['REPLICATE_CAIXA_ID'] != null
          ? map['REPLICATE_CAIXA_ID'] as String
          : null,
      notaFiscalId:
          map['NOTA_FISCAL_ID'] != null ? map['NOTA_FISCAL_ID'] as int : null,
      dataHora: map['DATA_HORA'] != null ? map['DATA_HORA'] as String : null,
      unitario: map['UNITARIO'] != null
          ? map['UNITARIO'] is int
              ? (map['UNITARIO'] as int).toDouble()
              : map['UNITARIO'] as double
          : null,
      quantidade: map['QUANTIDADE'] != null
          ? map['QUANTIDADE'] is int
              ? (map['QUANTIDADE'] as int).toDouble()
              : map['QUANTIDADE'] as double
          : null,
      total: map['TOTAL'] != null
          ? map['TOTAL'] is int
              ? (map['TOTAL'] as int).toDouble()
              : map['TOTAL'] as double
          : null,
      encerrante_inicial: map['ENCERRANTE_INICIAL'] != null
          ? map['ENCERRANTE_INICIAL'] is int
              ? (map['ENCERRANTE_INICIAL'] as int).toDouble()
              : map['ENCERRANTE_INICIAL'] as double
          : null,
      encerrante_final: map['ENCERRANTE_FINAL'] != null
          ? map['ENCERRANTE_FINAL'] is int
              ? (map['ENCERRANTE_FINAL'] as int).toDouble()
              : map['ENCERRANTE_FINAL'] as double
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplyPump.fromJson(String source) =>
      SupplyPump.fromMap(json.decode(source) as Map<String, dynamic>);
}
