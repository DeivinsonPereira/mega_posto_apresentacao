import 'package:flutter/material.dart';
import 'package:pixpdv_sdk/pixpdv_sdk.dart';

import 'i_pix_payment.dart';

abstract class IPixPdv implements IPixPayment{
  Future<void> isolateMonitoring(BuildContext context, QrDinamicoResult qrdinamico, PixPdvSdk sdk);
}
