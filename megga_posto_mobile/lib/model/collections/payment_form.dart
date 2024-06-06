// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import "package:isar/isar.dart";

part 'payment_form.g.dart';

@Collection()
class PaymentForm {
  Id id = Isar.autoIncrement;
  int? codigo;
  String? descricao;
  String? tipoAvista;
  String? tipoDocto;
  PaymentForm({
    this.codigo,
    this.descricao,
    this.tipoAvista,
    this.tipoDocto,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'descricao': descricao,
      'tipoAvista': tipoAvista,
      'tipoDocto': tipoDocto,
    };
  }

  factory PaymentForm.fromMap(Map<String, dynamic> map) {
    return PaymentForm(
      codigo: map['CODIGO'] != null ? map['CODIGO'] as int : null,
      descricao: map['DESCRICAO'] != null ? map['DESCRICAO'] as String : null,
      tipoAvista:
          map['TIPO_AVISTA'] != null ? map['TIPO_AVISTA'] as String : null,
      tipoDocto: map['TIPO_DOCTO'] != null ? map['TIPO_DOCTO'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentForm.fromJson(String source) =>
      PaymentForm.fromMap(json.decode(source) as Map<String, dynamic>);
}
