// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:megga_posto_mobile/service/payment_service/pix_payment.dart/pix_pdv/payment_pix_pdv.dart';
import 'package:pixpdv_sdk/pixpdv_sdk.dart';

import '../interface/i_pix_pdv.dart';
import 'monitoring_pix_pdv.dart';

class PixPdv implements IPixPdv {
  final MonitoringPixPdv _monitoring = MonitoringPixPdv();
  // Executa a forma de pagamento Pix
  @override
  Future<void> payment() async {
    PaymentPixPdv _paymentPixPdv = await PaymentPixPdv.create();
    await _paymentPixPdv.payment();
  }

  // Cria uma nova isolate e fica buscando o status do pagamento
  @override
  Future<void> isolateMonitoring(BuildContext context,
      QrDinamicoResult qrdinamico, PixPdvSdk sdk) async {
    _monitoring.isolateMonitoring(context ,qrdinamico, sdk);
  }
}
