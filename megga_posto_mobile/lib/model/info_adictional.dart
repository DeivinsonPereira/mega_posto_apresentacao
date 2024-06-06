import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class InfoAdictional {
  final String? frentista;
  final String? tribFederais;
  final String? tribEstaduais;
  final String? fonte;
  final String? chave;

  InfoAdictional({
    this.frentista,
    this.tribFederais,
    this.tribEstaduais,
    this.fonte,
    this.chave,
  });

 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'frentista': frentista,
      'tribFederais': tribFederais,
      'tribEstaduais': tribEstaduais,
      'fonte': fonte,
      'chave': chave,
    };
  }

  factory InfoAdictional.fromMap(Map<String, dynamic> map) {
    return InfoAdictional(
      frentista: map['frentista'] != null ? map['frentista'] as String : null,
      tribFederais: map['tribFederais'] != null ? map['tribFederais'] as String : null,
      tribEstaduais: map['tribEstaduais'] != null ? map['tribEstaduais'] as String : null,
      fonte: map['fonte'] != null ? map['fonte'] as String : null,
      chave: map['chave'] != null ? map['chave'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoAdictional.fromJson(String source) => InfoAdictional.fromMap(json.decode(source) as Map<String, dynamic>);
}
