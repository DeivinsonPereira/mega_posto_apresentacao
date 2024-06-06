import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CredentialPix {
  int id;
  int ambiente;
  int psp;
  String chavePix;
  String clientId;
  String clientSecret;
  String apiKey;
  int tipoChave;
  String pathArquivoCertificado;
  String senhaCertificado;
  String pathArquivoChavePrivada;
  String urlBaseHomologacao;
  String urlBaseProducao;
  String token;

  CredentialPix({
    required this.id,
    required this.ambiente,
    required this.psp,
    required this.chavePix,
    required this.clientId,
    required this.clientSecret,
    required this.apiKey,
    required this.tipoChave,
    required this.pathArquivoCertificado,
    required this.senhaCertificado,
    required this.pathArquivoChavePrivada,
    required this.urlBaseHomologacao,
    required this.urlBaseProducao,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ambiente': ambiente,
      'psp': psp,
      'chavePix': chavePix,
      'clientId': clientId,
      'clientSecret': clientSecret,
      'apiKey': apiKey,
      'tipoChave': tipoChave,
      'pathArquivoCertificado': pathArquivoCertificado,
      'senhaCertificado': senhaCertificado,
      'pathArquivoChavePrivada': pathArquivoChavePrivada,
      'urlBaseHomologacao': urlBaseHomologacao,
      'urlBaseProducao': urlBaseProducao,
      'token': token,
    };
  }

  factory CredentialPix.fromMap(Map<String, dynamic> map) {
    return CredentialPix(
      id: map['ID'] as int,
      ambiente: map['AMBIENTE'] as int,
      psp: map['PSP'] as int,
      chavePix: map['CHAVE_PIX'] as String,
      clientId: map['CLIENT_ID'] as String,
      clientSecret: map['CLIENT_SECRET'] as String,
      apiKey: map['API_KEY'] as String,
      tipoChave: map['TIPO_CHAVE'] as int,
      pathArquivoCertificado: map['PATH_ARQUIVO_CERTIFICADO'] as String,
      senhaCertificado: map['SENHA_CERTIFICADO'] as String,
      pathArquivoChavePrivada: map['PATH_ARQUIVO_CHAVE_PRIVADA'] as String,
      urlBaseHomologacao: map['URLBASE_HOMOLOGACAO'] as String,
      urlBaseProducao: map['URLBASE_PRODUCAO'] as String,
      token: map['TOKEN'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CredentialPix.fromJson(String source) =>
      CredentialPix.fromMap(json.decode(source) as Map<String, dynamic>);
}
