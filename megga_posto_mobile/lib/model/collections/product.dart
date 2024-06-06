// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import "package:isar/isar.dart";

part 'product.g.dart';

@Collection()
class Product {
  Id id = Isar.autoIncrement;
  int? codigo;
  String? descricao;
  String? codigoBarras;
  double? valor;

  Product({
    this.codigo,
    this.descricao,
    this.codigoBarras,
    this.valor,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'descricao': descricao,
      'codigoBarras': codigoBarras,
      'valor': valor,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      codigo: map['CODIGO'] != null ? map['CODIGO'] as int : null,
      descricao: map['DESCRICAO'] != null ? map['DESCRICAO'] as String : null,
      codigoBarras:
          map['CORIDO_BARRAS'] != null ? map['CORIDO_BARRAS'] as String : null,
      valor: map['VALOR'] != null
          ? (map['VALOR'] is int
              ? (map['VALOR'] as int).toDouble()
              : map['VALOR'] is double
                  ? map['VALOR'] as double
                  : null)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
