import 'package:flutter/material.dart';

abstract class IClisitef {
  void executePayment(BuildContext context, int modalidade, double value);
  void configureClisitef(BuildContext context);
  void callback(BuildContext context);
  void pinpad();
  void transaction(int modalidade, double value);
  void cancelCurrentTransaction();
  void cancel();
}
