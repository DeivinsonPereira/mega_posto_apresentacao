import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Login {
  String plogin;
  String psenha;

  Login({
    required this.plogin,
    required this.psenha,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'plogin': plogin,
      'psenha': psenha,
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      plogin: map['plogin'] as String,
      psenha: map['psenha'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) =>
      Login.fromMap(json.decode(source) as Map<String, dynamic>);
}
