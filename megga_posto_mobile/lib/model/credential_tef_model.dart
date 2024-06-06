import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CredentialTef {

  int? id;
  int? ativo;
  int? ambiente;
  int? gerenciadorTef;
  String? codEmpresa;
  String? codFilial;
  String? codTerminal;
  String? ipServidorTef;
  String? portaPinpad;
  String? msgPinpad1;
  String? msgPinpad2;
  int? imprimir;
  int? qrcode;
  
  CredentialTef({
    this.id,
    this.ativo,
    this.ambiente,
    this.gerenciadorTef,
    this.codEmpresa,
    this.codFilial,
    this.codTerminal,
    this.ipServidorTef,
    this.portaPinpad,
    this.msgPinpad1,
    this.msgPinpad2,
    this.imprimir,
    this.qrcode,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ativo': ativo,
      'ambiente': ambiente,
      'gerenciadorTef': gerenciadorTef,
      'codEmpresa': codEmpresa,
      'codFilial': codFilial,
      'codTerminal': codTerminal,
      'ipServidorTef': ipServidorTef,
      'portaPinpad': portaPinpad,
      'msgPinpad1': msgPinpad1,
      'msgPinpad2': msgPinpad2,
      'imprimir': imprimir,
      'qrcode': qrcode,
    };
  }

  factory CredentialTef.fromMap(Map<String, dynamic> map) {
    return CredentialTef(
      id: map['ID'] != null ? map['ID'] as int : null,
      ativo: map['ATIVO'] != null ? map['ATIVO'] as int : null,
      ambiente: map['AMBIENTE'] != null ? map['AMBIENTE'] as int : null,
      gerenciadorTef: map['GERENCIADOR_TEF'] != null ? map['GERENCIADOR_TEF'] as int : null,
      codEmpresa: map['COD_EMPRESA'] != null ? map['COD_EMPRESA'] as String : null,
      codFilial: map['COD_FILIAL'] != null ? map['COD_FILIAL'] as String : null,
      codTerminal: map['COD_TERMINAL'] != null ? map['COD_TERMINAL'] as String : null,
      ipServidorTef: map['IP_SERVIDOR_TEF'] != null ? map['IP_SERVIDOR_TEF'] as String : null,
      portaPinpad: map['PORTA_PINPAD'] != null ? map['PORTA_PINPAD'] as String : null,
      msgPinpad1: map['MSG_PINPAD_1'] != null ? map['MSG_PINPAD_1'] as String : null,
      msgPinpad2: map['MSG_PINPAD_2'] != null ? map['MSG_PINPAD_2'] as String : null,
      imprimir: map['IMPRIMIR'] != null ? map['IMPRIMIR'] as int : null,
      qrcode: map['QRCODE'] != null ? map['QRCODE'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CredentialTef.fromJson(String source) => CredentialTef.fromMap(json.decode(source) as Map<String, dynamic>);
}
