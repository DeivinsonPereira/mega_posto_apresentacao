// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NfcCode {
  String pcodigo_nfc;
  
  NfcCode({
    required this.pcodigo_nfc,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pcodigo_nfc': pcodigo_nfc,
    };
  }

  factory NfcCode.fromMap(Map<String, dynamic> map) {
    return NfcCode(
      pcodigo_nfc: map['pcodigo_nfc'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NfcCode.fromJson(String source) => NfcCode.fromMap(json.decode(source) as Map<String, dynamic>);
}
