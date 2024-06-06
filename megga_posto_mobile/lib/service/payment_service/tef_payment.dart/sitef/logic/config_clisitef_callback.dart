import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clisitef/model/clisitef_data.dart';
import 'package:flutter_clisitef/model/data_events.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/custom_cherry.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';

class ConfigureClisitefCallBack {
  final _clisitefController = Dependencies.clisitefController();

  ConfigureClisitefCallBack._privateConstructor();

  static final ConfigureClisitefCallBack _instance =
      ConfigureClisitefCallBack._privateConstructor();

  static ConfigureClisitefCallBack get instance => _instance;

  void callback(BuildContext context, void Function() cancel) {
    _clisitefController.pdv.dataStream.stream.listen((CliSiTefData event) {
      if (kDebugMode) {
        print(event.buffer);
        print(event.event);
      }

      if (event.event == DataEvents.menuTitle) {
        _clisitefController.lastTitle.value = event.buffer;
      }

      if (event.event == DataEvents.messageCashier) {
        _clisitefController.lastMsgCashier.value = event.buffer;
      }

      if (event.event == DataEvents.messageCustomer) {
        _clisitefController.lastMsgCustomer.value = event.buffer;
      }

      if (event.event == DataEvents.messageCashierCustomer) {
        _clisitefController.lastMsgCashierCustomer.value = event.buffer;
      }

      if (event.event == DataEvents.messageQrCode) {
        _clisitefController.lastMsgCashierCustomer.value = event.buffer;
      }

      if ((event.event == DataEvents.showQrCodeField) ||
          (event.event == DataEvents.removeQrCodeField)) {
        _clisitefController.lastMsgCashierCustomer.value = event.buffer;
      }

      if (event.event == DataEvents.confirmation) {
        //TODO implementar esses dialogs

        Widget cancelButton = ElevatedButton(
          child: const Text("Cancelar"),
          onPressed: () {
            _clisitefController.pdv.client.continueTransaction('0');
            Navigator.of(context).pop();
          },
        );
        Widget continueButton = ElevatedButton(
          child: const Text("Continuar"),
          onPressed: () {
            _clisitefController.pdv.client.continueTransaction('1');
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
        //TODO implementar esses dialogs

        Widget backButton = ElevatedButton(
          child: const Text("Voltar"),
          onPressed: () {
            _clisitefController.pdv.client.continueTransaction('1');
            Navigator.of(context).pop();
          },
        );
        Widget confirmeButton = ElevatedButton(
          child: const Text("Confirmar"),
          onPressed: () {
            _clisitefController.pdv.client.continueTransaction('0');
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
        CustomCherryError(message: event.buffer).show(context);
        _clisitefController.pdv.client.continueTransaction('1');
        Get.back();
      }

      if (event.event == DataEvents.abortRequest) {
        //TODO verificar essa condição aqui

        _clisitefController.showAbortButton.value = true;
        if (_clisitefController.abortTransaction.value) {
          cancel(); //cancelCurrentTransaction();
          _clisitefController.showAbortButton.value = false;
          _clisitefController.abortTransaction.value = false;
        } else {
          _clisitefController.pdv.continueTransaction('1');
        }
      } else {
        _clisitefController.showAbortButton.value = false;
      }
      if (event.event == DataEvents.getFieldInternal ||
          event.event == DataEvents.getField ||
          event.event == DataEvents.getFieldBarCode ||
          event.event == DataEvents.getFieldCurrency) {
        CustomCherryError(message: event.buffer).show(context);
        _clisitefController.pdv.continueTransaction('-1');
        Get.back();
      /* 
        showDialog(
            context: context,
            builder: (context) {
              return SimulatedPinPadWidget(
                title: _clisitefController.lastTitle.value,
                options: event.buffer,
                submit: _clisitefController.pdv.continueTransaction,
                cancel: () async {
                  _clisitefController.pdv.continueTransaction('-1');
                },
              );
            });*/
      }
      if (event.event == DataEvents.menuOptions) {
        //TODO implementar esse dialog

        showDialog(
            context: context,
            builder: (context) {
              List<String> options = event.buffer.split(';');
              return Scaffold(
                appBar: AppBar(
                  title: Text(_clisitefController.lastTitle.value),
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
                        _clisitefController.pdv.continueTransaction(opcao);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              );
            });
      }
    });
  }
}
