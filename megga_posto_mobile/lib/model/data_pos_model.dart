// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:megga_posto_mobile/model/credential_tef_model.dart';

import 'credential_pix_model.dart';

class DataPos {
  int id;
  int pdvPrincipalId;
  String serial;
  String nomeDispositivo;
  int clientePadraoId;
  int atendentePadraoId;
  List<CredentialPix> credenciaisPix;
  List<CredentialTef> credenciaisTef;

  DataPos({
    required this.id,
    required this.pdvPrincipalId,
    required this.serial,
    required this.nomeDispositivo,
    required this.clientePadraoId,
    required this.atendentePadraoId,
    required this.credenciaisPix,
    required this.credenciaisTef,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'pdvPrincipalId': pdvPrincipalId,
      'serial': serial,
      'nomeDispositivo': nomeDispositivo,
      'clientePadraoId': clientePadraoId,
      'atendentePadraoId': atendentePadraoId,
      'credenciaisPix': credenciaisPix.map((x) => x.toMap()).toList(),
      'credenciaisTef': credenciaisTef.map((x) => x.toMap()).toList(),
    };
  }

  factory DataPos.fromMap(Map<String, dynamic> map) {
    return DataPos(
      id: map['ID'] as int,
      pdvPrincipalId: map['PDV_PRINCIPAL_ID'] as int,
      serial: map['SERIAL'] as String,
      nomeDispositivo: map['NOME_DISPOSITIVO'] as String,
      clientePadraoId: map['CLIENTE_PADRAO_ID'] as int,
      atendentePadraoId: map['ATENDENTE_PADRAO_ID'] as int,
      credenciaisPix: List<CredentialPix>.from((map['credenciais_pix'] as List<dynamic>).map<CredentialPix>((x) => CredentialPix.fromMap(x as Map<String,dynamic>),),),
      credenciaisTef: List<CredentialTef>.from((map['credenciais_tef'] as List<dynamic>).map<CredentialTef>((x) => CredentialTef.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataPos.fromJson(String source) =>
      DataPos.fromMap(json.decode(source) as Map<String, dynamic>);
}
