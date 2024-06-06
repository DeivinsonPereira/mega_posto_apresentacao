import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clisitef/model/clisitef_configuration.dart';
import 'package:flutter_clisitef/model/clisitef_data.dart';
import 'package:flutter_clisitef/model/data_events.dart';
import 'package:flutter_clisitef/model/modalidade.dart';
import 'package:flutter_clisitef/model/pinpad_information.dart';
import 'package:flutter_clisitef/model/tipo_pinpad.dart';
import 'package:flutter_clisitef/model/transaction.dart';
import 'package:flutter_clisitef/model/transaction_events.dart';
import 'package:flutter_clisitef/pdv/clisitef_pdv.dart';
import 'package:flutter_clisitef/pdv/simulated_pin_pad_widget.dart';

import 'clisitef_controller.dart';

class ClisitefView extends StatefulWidget {
  const ClisitefView({super.key});

  @override
  State<ClisitefView> createState() => _ClisitefViewState();
}

class _ClisitefViewState extends State<ClisitefView> {
  MainController controller = MainController();

  @override
  void initState() {
    super.initState();

    CliSiTefConfiguration configuration = CliSiTefConfiguration(
      enderecoSitef: '177.72.163.4',
      codigoLoja: '0',
      numeroTerminal: '1',
      cnpjAutomacao: '05481336000137',
      cnpjLoja: '05481336000137',
      tipoPinPad: TipoPinPad.apos,
      parametrosAdicionais: '',
    );

    controller.pdv = CliSiTefPDV(
        client: controller.clisitefPlugin,
        configuration: configuration,
        isSimulated: controller.isSimulated);

    configureCliSitefCallbacks();
  }

  void configureCliSitefCallbacks() {
    controller.pdv.pinPadStream.stream.listen((PinPadInformation event) {
      setState(() {
        PinPadInformation pinPad = event;
        controller.pinPadInfo =
            'isPresent: ${pinPad.isPresent.toString()} \n isBluetoothEnabled: ${pinPad.isBluetoothEnabled.toString()} \n isConnected: ${pinPad.isConnected.toString()} \n isReady: ${pinPad.isReady.toString()} \n event: ${pinPad.event.toString()} ';
      });
    });

    controller.pdv.dataStream.stream.listen((CliSiTefData event) {
      if (kDebugMode) {
        print(event.buffer);
        print(event.event);
      }

      if (event.event == DataEvents.menuTitle) {
        controller.lastTitle = event.buffer;
      }

      if (event.event == DataEvents.messageCashier) {
        controller.lastMsgCashier = event.buffer;
      }

      if (event.event == DataEvents.messageCustomer) {
        controller.lastMsgCustomer = event.buffer;
      }

      if (event.event == DataEvents.messageCashierCustomer) {
        controller.lastMsgCashierCustomer = event.buffer;
      }

      if (event.event == DataEvents.messageQrCode) {
        controller.lastMsgCashierCustomer = event.buffer;
      }

      if ((event.event == DataEvents.showQrCodeField) ||
          (event.event == DataEvents.removeQrCodeField)) {
        controller.lastMsgCashierCustomer = event.buffer;
      }

      if (event.event == DataEvents.confirmation) {
        Widget cancelButton = ElevatedButton(
          child: const Text("Cancelar"),
          onPressed: () {
            controller.pdv.client.continueTransaction('0');
            Navigator.of(context).pop();
          },
        );
        Widget continueButton = ElevatedButton(
          child: const Text("Continuar"),
          onPressed: () {
            controller.pdv.client.continueTransaction('1');
            Navigator.of(context).pop();
          },
        );

        AlertDialog alert = AlertDialog(
          title: Text(event.buffer),
          actions: [
            cancelButton,
            continueButton,
          ],
        );

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }

      if (event.event == DataEvents.confirmGoBack) {
        Widget backButton = ElevatedButton(
          child: const Text("Voltar"),
          onPressed: () {
            controller.pdv.client.continueTransaction('1');
            Navigator.of(context).pop();
          },
        );
        Widget confirmeButton = ElevatedButton(
          child: const Text("Confirmar"),
          onPressed: () {
            controller.pdv.client.continueTransaction('0');
            Navigator.of(context).pop();
          },
        );

        AlertDialog alert = AlertDialog(
          title: Text(event.buffer),
          actions: [
            backButton,
            confirmeButton,
          ],
        );

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }

      if (event.event == DataEvents.pressAnyKey) {
        Widget continueButton = ElevatedButton(
          child: const Text("Continuar"),
          onPressed: () {
            controller.pdv.client.continueTransaction('1');
            Navigator.of(context).pop();
          },
        );

        AlertDialog alert = AlertDialog(
          title: Text(event.buffer),
          actions: [
            continueButton,
          ],
        );

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }

      if (event.event == DataEvents.abortRequest) {
        setState(() {
          controller.showAbortButton = true;
          if (controller.abortTransaction) {
            cancelCurrentTransaction();
            controller.showAbortButton = false;
            controller.abortTransaction = false;
          } else {
            controller.pdv.continueTransaction('1');
          }
        });
      } else {
        controller.showAbortButton = false;
      }

      if (event.event == DataEvents.getFieldInternal ||
          event.event == DataEvents.getField ||
          event.event == DataEvents.getFieldBarCode ||
          event.event == DataEvents.getFieldCurrency) {
        showDialog(
            context: context,
            builder: (context) {
              return SimulatedPinPadWidget(
                title: controller.lastTitle,
                options: event.buffer,
                submit: controller.pdv.continueTransaction,
                cancel: () async {
                  controller.pdv.continueTransaction('-1');
                },
              );
            });
      }

      if (event.event == DataEvents.menuOptions) {
        showDialog(
            context: context,
            builder: (context) {
              List<String> options = event.buffer.split(';');
              return Scaffold(
                appBar: AppBar(
                  title: Text(controller.lastTitle),
                  automaticallyImplyLeading: false,
                ),
                body: ListView.builder(
                  itemCount: options.length - 1,
                  itemBuilder: (context, index) {
                    final item = options[index].split(':');
                    final opcao = item[0];
                    final descricao = item[1];

                    return ListTile(
                      title: Text(descricao),
                      subtitle: Text(opcao),
                      onTap: () {
                        controller.pdv.continueTransaction(opcao);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              );
            });
      }

      setState(() {});
    });
  }

  void pinpad() async {
    try {
      await controller.pdv.isPinPadPresent();

      setState(() {
        PinPadInformation pinPad = controller.pdv.pinPadStream.pinPadInfo;
        if (pinPad.isPresent) {
          controller.pdv.client.setPinpadDisplayMessage('Flutter Clisitef');
        }
        controller.pinPadInfo = '''
             isPresent: ${pinPad.isPresent.toString()}
             isBluetoothEnabled: ${pinPad.isBluetoothEnabled.toString()}
             isConnected: ${pinPad.isConnected.toString()}
             isReady: ${pinPad.isReady.toString()}
             event: ${pinPad.event.toString()}
            ''';
      });
    } on Exception {
      if (kDebugMode) {
        print('Failed!');
      }
    }
  }

  void transaction() async {
    try {
      setState(() {
        controller.dataReceived = [];
      });
      Stream<Transaction> paymentStream = await controller.pdv.payment(
        Modalidade.credito.value,
        100,
        cupomFiscal: '1',
        dataFiscal: DateTime.now(),
        restricoes: '[27;28]',
      );

      if (controller.isSimulated) {
        if (kDebugMode) {
          print('here is simulated');
        }
      }

      paymentStream.listen((Transaction transaction) {
        setState(() {
          controller.transactionStatus =
              transaction.event ?? TransactionEvents.unknown;
          if (controller.transactionStatus ==
              TransactionEvents.transactionConfirm) {
            controller.dataReceived.add(controller.pdv
                .cliSitetRespMap[134]!); //Map com todos os campos retornados

            //campos mapeados em propriedades
            controller.dataReceived.add(controller.pdv.cliSiTefResp.nsuHost);
            controller.dataReceived.add(controller.pdv.cliSiTefResp.viaCliente);

            controller.dataReceived
                .add(controller.pdv.cliSiTefResp.viaEstabelecimento);
          }
        });
      });
    } on Exception catch (e) {
      setState(() {
        controller.transactionStatus = TransactionEvents.transactionError;
      });
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void cancelCurrentTransaction() async {
    try {
      await controller.pdv.client.abortTransaction(continua: 1);
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Cancel!');
        print(e.toString());
      }
    }
  }

  void cancel() async {
    try {
      await controller.pdv.cancelTransaction();
      setState(() {
        controller.dataReceived = [];
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Cancel!');
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () => pinpad(),
                    child: const Text('Verificar presenca pinpad')),
                ElevatedButton(
                    onPressed: () => transaction(),
                    child: const Text('Iniciar transacao')),
                Visibility(
                  visible: controller.showAbortButton,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.abortTransaction = true;
                      },
                      child: const Text('Cancelar transacao atual')),
                ),
                ElevatedButton(
                    onPressed: () => cancel(),
                    child: const Text('Cancela ultima transacao')),
                const Text("PinPadInfo:"),
                Text(controller.pinPadInfo),
                const Text("\n\nTransaction Status:"),
                Text(controller.transactionStatus.name),
                const Text("Mensagem Operador:"),
                Text(controller.lastMsgCashier),
                const Text("Mensagem Cliente:"),
                Text(controller.lastMsgCustomer),
                const Text("Mensagem Operador e Cliente:"),
                Text(controller.lastMsgCashierCustomer),
                const Text("\n\nData Received:"),
                Text(controller.dataReceived.join('\n')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
