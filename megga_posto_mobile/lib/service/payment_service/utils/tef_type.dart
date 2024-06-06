// ignore_for_file: constant_identifier_names

enum TefType {
  PAGAMENTO_SEM_TEF(0),
  SITEF(1),
  MATERA(2),
  ELGIN(3);

  final int value;

  const TefType(this.value);
}