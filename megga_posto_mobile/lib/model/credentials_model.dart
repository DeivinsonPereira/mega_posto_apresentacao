import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Credentials {
  int id;
  int ambiente;
  String urlHomologacao;
  String urlProducao;
  String clientId;
  String clientSecret;
  String token;
  String apiKey;
  
  Credentials({
    required this.id,
    required this.ambiente,
    required this.urlHomologacao,
    required this.urlProducao,
    required this.clientId,
    required this.clientSecret,
    required this.token,
    required this.apiKey,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ambiente': ambiente,
      'urlHomologacao': urlHomologacao,
      'urlProducao': urlProducao,
      'clientId': clientId,
      'clientSecret': clientSecret,
      'token': token,
      'apiKey': apiKey,
    };
  }

  factory Credentials.fromMap(Map<String, dynamic> map) {
    return Credentials(
      id: map['ID'] as int,
      ambiente: map['AMBIENTE'] as int,
      urlHomologacao: map['URL_HOMOLOGACAO'] as String,
      urlProducao: map['URL_PRODUCAO'] as String,
      clientId: map['CLIENT_ID'] as String,
      clientSecret: map['CLIENT_SECRET'] as String,
      token: map['TOKEN'] as String,
      apiKey: map['API_KEY'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Credentials.fromJson(String source) => Credentials.fromMap(json.decode(source) as Map<String, dynamic>);
}
