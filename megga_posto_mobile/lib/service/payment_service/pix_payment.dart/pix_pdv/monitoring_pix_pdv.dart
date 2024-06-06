// ignore_for_file: use_build_context_synchronously

import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:megga_posto_mobile/common/custom_cherry.dart';
import 'package:megga_posto_mobile/page/payment/enum/modalidade_payment.dart';
import 'package:megga_posto_mobile/service/payment_service/pix_payment.dart/pix_pdv/isolate_pix_pdv_manager.dart';
import 'package:megga_posto_mobile/service/payment_service/pix_payment.dart/pix_pdv/logic/response_conditions.dart';
import 'package:megga_posto_mobile/utils/method_quantity_back.dart';
import 'package:megga_posto_mobile/utils/methods/payment/payment_features.dart';
import 'package:pixpdv_sdk/pixpdv_sdk.dart';

class MonitoringPixPdv {
  final isolatePixPdvManager = IsolatePixPdvManager.instance;

  Future<void> isolateMonitoring(
      BuildContext context, QrDinamicoResult qrdinamico, PixPdvSdk sdk) async {
    await _getStatusPix(qrdinamico, sdk);

    final receivePort = ReceivePort();
    final isolate = await Isolate.spawn(_monitoring, receivePort.sendPort);

    final sendPort = await receivePort.first as SendPort;
    final responsePort = ReceivePort();

    isolatePixPdvManager.startVariables(
        isolate, receivePort, responsePort, sendPort);

    final credentials = {
      'clientId': sdk.token.userName,
      'token': sdk.token.password,
      'secretKey': sdk.token.secretKey,
      'enviroment': sdk.token.enviroment == PixPDVEnviroment.homologacao
          ? 'homologacao'
          : 'produção'
    };

    sendPort.send([responsePort.sendPort, qrdinamico, credentials]);

    await for (var message in responsePort) {
      if (ResponseConditions.isApproved(message)) {
        _handleApproved(context);
      }

      if (ResponseConditions.isExpired(message)) {
        _handleExpired(context);
      }

      if (ResponseConditions.isTimeOut(message)) {
        _handleExpired(context);
      }
    }
  }

  Future<void> _monitoring(SendPort sendPort) async {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    final args = await receivePort.first as List;
    final responseSendPort = args[0] as SendPort;
    final qrdinamico = args[1] as QrDinamicoResult;
    final credentials = args[2] as Map<String, String>;

    final dio = Dio();

    final token = PixPDVTokenModel(
      userName: credentials['clientId']!,
      password: credentials['token']!,
      secretKey: credentials['secretKey']!,
      enviroment: credentials['enviroment'] == 'homologacao'
          ? PixPDVEnviroment.homologacao
          : PixPDVEnviroment.producao,
    );

    final sdk = PixPdvSdk(dio: dio, token: token);

    const timeout = Duration(minutes: 5);
    final endTime = DateTime.now().add(timeout);

    while (DateTime.now().isBefore(endTime)) {
      final result = await _getStatusPix(qrdinamico, sdk);
      String? status = result.qrStatusResultData?.status ?? '';
      responseSendPort.send(status);

      await Future.delayed(const Duration(seconds: 10));
    }

    responseSendPort.send("TIMEOUT");
  }

  void _handleApproved(BuildContext context) {
    final paymentFeatures = PaymentFeatures();
    paymentFeatures.addSelectedPayment(ModalidadePaymment.PIX);
    const CustomCherrySuccess(message: 'Pagamento efetuado com sucesso!')
        .show(context);
    MethodQuantityBack.back(2);
    isolatePixPdvManager.kill();
  }

  void _handleExpired(BuildContext context) {
    final paymentFeatures = PaymentFeatures();
    paymentFeatures.clearEnteredValue();
    const CustomCherryError(message: 'Pagamento expirado, tente novamente')
        .show(context);
    MethodQuantityBack.back(2);
    isolatePixPdvManager.kill();
  }

  // Monitora o status do pagamento
  Future<QrStatusResult> _getStatusPix(
      QrDinamicoResult qrdinamico, PixPdvSdk sdk) async {
    QrStatusResult qrstatus = await sdk.qrstatus(
      qrCodeId: qrdinamico.qrDinamicoResultData!.qrcodeId!,
    );
    return qrstatus;
  }
}
