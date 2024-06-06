// ignore_for_file: constant_identifier_names

enum ResponseStatusQrcode {
  CREATED('CREATED'),
  APPROVED('APPROVED'),
  EXPIRED('EXPIRED');

  final String value;

  const ResponseStatusQrcode(this.value);
}
