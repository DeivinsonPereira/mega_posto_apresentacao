// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import "package:isar/isar.dart";

part 'dado_empresa.g.dart';

@Collection()
class DadoEmpresa {
  Id id = Isar.autoIncrement;
  String ipEmpresa;
  int? idUsuario;

  DadoEmpresa(
    this.ipEmpresa,
    this.idUsuario,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ipEmpresa': ipEmpresa,
      'idUsuario': idUsuario
    };
  }

  factory DadoEmpresa.fromMap(Map<String, dynamic> map) {
    return DadoEmpresa(
      map['ipEmpresa'] as String,
      map['idUsuario'] as int?
    );
  }

  String toJson() => json.encode(toMap());

  factory DadoEmpresa.fromJson(String source) =>
      DadoEmpresa.fromMap(json.decode(source) as Map<String, dynamic>);
}
