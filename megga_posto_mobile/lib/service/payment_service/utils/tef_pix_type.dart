import 'package:megga_posto_mobile/service/payment_service/utils/tef_type.dart';

import 'pix_type.dart';

class TefPixType {
  TefPixType._privateConstructor();

  static final TefPixType _instance = TefPixType._privateConstructor();

  factory TefPixType() => _instance;

  bool isPagamentoSemTef(int tefSelected) => TefType.PAGAMENTO_SEM_TEF.value == tefSelected;

  bool isTefSitef(int tefSelected) => TefType.SITEF.value == tefSelected;

  bool isTefMatera(int tefSelected) => TefType.MATERA.value == tefSelected;

  bool isTefElgin(int tefSelected) => TefType.ELGIN.value == tefSelected;

  bool isPixSemTef(int pixSelected) => PixType.PIX_SEM_TEF.value == pixSelected;

  bool isPixSitef(int pixSelected) => PixType.SITEF.value == pixSelected;

  bool isPixMatera(int pixSelected) => PixType.MATERA.value == pixSelected;

  bool isPixElgin(int pixSelected) => PixType.ELGIN.value == pixSelected;
}
