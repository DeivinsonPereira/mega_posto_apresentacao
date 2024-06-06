// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:megga_posto_mobile/page/payment/enum/modalidade_payment.dart';

class ClisitefTransactionModel {
  ModalidadePaymment modalidade;
  double value;
  String cupomFiscal;
  DateTime dataFiscal;
  String restricoes;

  ClisitefTransactionModel({
    required this.modalidade,
    required this.value,
    required this.cupomFiscal,
    required this.dataFiscal,
    required this.restricoes,
  });
}
