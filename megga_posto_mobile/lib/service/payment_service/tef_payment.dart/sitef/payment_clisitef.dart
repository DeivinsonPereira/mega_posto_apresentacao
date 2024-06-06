// ignore_for_file: unused_field

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clisitef/model/clisitef_configuration.dart';
import 'package:flutter_clisitef/model/pinpad_information.dart';
import 'package:flutter_clisitef/model/tipo_pinpad.dart';
import 'package:flutter_clisitef/model/transaction.dart';
import 'package:flutter_clisitef/model/transaction_events.dart';
import 'package:flutter_clisitef/pdv/clisitef_pdv.dart';
import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/service/payment_service/tef_payment.dart/sitef/interface/i_clisitef.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';
import 'logic/config_clisitef_callback.dart';

class PaymentClisitef implements IClisitef {
  final _controller = Dependencies.clisitefController();
  final _clisitefCallBack = ConfigureClisitefCallBack.instance;
  final _logger = Logger();
  final _configController = Dependencies.configController();

  PaymentClisitef._privateConstructor();

  static final PaymentClisitef _instance =
      PaymentClisitef._privateConstructor();

  static PaymentClisitef get instance => _instance;

  @override
  void executePayment(
      BuildContext context, int modalidade, double value) async {
    configureClisitef(context);
    transaction(modalidade, value);
  }

  @override
  void configureClisitef(BuildContext context) async {
    CliSiTefConfiguration configuration = CliSiTefConfiguration(
      enderecoSitef:
          '177.72.163.4', //_configController.dataPos.credenciaisTef[0].ipServidorTef!,
      codigoLoja:
          '0', // _configController.dataPos.credenciaisTef[0].codFilial!,
      numeroTerminal:
          '1', // _configController.dataPos.credenciaisTef[0].codTerminal!,
      cnpjAutomacao:
          '05481336000137', // _configController.dataPos.credenciaisTef[0].codEmpresa!,
      cnpjLoja:
          '05481336000137', // _configController.dataPos.credenciaisTef[0].codEmpresa!,
      tipoPinPad: TipoPinPad.apos,
      parametrosAdicionais: '',
    );

    _controller.pdv = CliSiTefPDV(
        client: _controller.clisitefPlugin,
        configuration: configuration,
        isSimulated: _controller.isSimulated);

    callback(context);
  }

  @override
  void callback(BuildContext context) {
    //TODO IMPLEMENTAR AINDA AS RESPOSTAS QUE VEM DO SITEF
    _clisitefCallBack.callback(context, () => cancelCurrentTransaction());
  }

  @override
  void pinpad() async {
    try {
      await _controller.pdv.isPinPadPresent();

      PinPadInformation pinPad = _controller.pdv.pinPadStream.pinPadInfo;
      if (pinPad.isPresent) {
        _controller.pdv.client.setPinpadDisplayMessage('Flutter Clisitef');
      }
      _controller.pinPadInfo.value = '''
            isPresent: ${pinPad.isPresent.toString()}
            isBluetoothEnabled: ${pinPad.isBluetoothEnabled.toString()}
            isConnected: ${pinPad.isConnected.toString()}
            isReady: ${pinPad.isReady.toString()}
            event: ${pinPad.event.toString()}
          ''';
    } catch (e) {
      _logger.e('Error: $e');
    }
  }

  @override
  void transaction(int modalidade, double value) async {
    try {
      _controller.dataReceived.value = [];

      Stream<Transaction> paymentStream = await _controller.pdv.payment(
        modalidade, //Modalidade.credito.value,
        value, //100
        cupomFiscal: '1',
        dataFiscal: DateTime.now(),
        restricoes: '[27;28]',
      );

      if (_controller.isSimulated) {
        if (kDebugMode) {
          print('here is simulated');
        }
      }
      pinpad();
      paymentStream.listen((Transaction transaction) {
        _controller.transactionStatus =
            transaction.event ?? TransactionEvents.unknown;
        if (_controller.transactionStatus ==
            TransactionEvents.transactionConfirm) {
          _controller.dataReceived.add(_controller
              .pdv.cliSitetRespMap[134]!); //Map com todos os campos retornados

          //campos mapeados em propriedades
          _controller.dataReceived.add(_controller.pdv.cliSiTefResp.nsuHost);
          _controller.dataReceived.add(_controller.pdv.cliSiTefResp.viaCliente);

          _controller.dataReceived
              .add(_controller.pdv.cliSiTefResp.viaEstabelecimento);
        }
      });
    } catch (e) {
      _logger.e('Error: $e');
      _controller.transactionStatus = TransactionEvents.transactionError;

      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  void cancelCurrentTransaction() async {
    try {
      await _controller.pdv.client.abortTransaction(continua: 1);
    } catch (e) {
      _logger.e('Error: $e');
      if (kDebugMode) {
        print('Cancel!');
        print(e.toString());
      }
    }
  }

  @override
  void cancel() async {
    try {
      await _controller.pdv.cancelTransaction();

      _controller.dataReceived.value = [];
    } catch (e) {
      _logger.e('Error: $e');
      if (kDebugMode) {
        print('Cancel!');
        print(e.toString());
      }
    }
  }
}
