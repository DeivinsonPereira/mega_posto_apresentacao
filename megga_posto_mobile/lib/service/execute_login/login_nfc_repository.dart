// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/service/execute_login/interface/i_execute_login.dart';
import 'package:megga_posto_mobile/utils/methods/bill/bill_features.dart';
import 'package:megga_posto_mobile/utils/singletons_instances.dart';

import '../../common/custom_cherry.dart';
import '../../model/nfc_code.dart';
import '../../utils/auth.dart';
import '../../utils/endpoints.dart';
import '../../utils/native_channel.dart';
import 'shared/login_utils.dart';

class LoginNfcRepository implements IExecuteLogin {
  final _singletonsInstances = SingletonsInstances();
  final _billFeatures = BillFeatures();
  late final _logger = _singletonsInstances.logger;
  late final _ioClient = _singletonsInstances.ioClient;
  late final _loginUtils = _singletonsInstances.loginUtils;

  @override
  Future<bool> login(BuildContext context) async {
    String cardId = await _readRfidByNfc(context);

    if (_cardIdIsEmpty(cardId)) {
      return _showError(context, 'cartão com id vazio');
    }

    Uri uri = Uri.parse(Endpoints.endpointLoginNfc());

    try {
      final nfcCode = NfcCode(pcodigo_nfc: cardId);

      var response = await _ioClient.post(uri,
          body: nfcCode.toJson(), headers: Auth.header);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          var idUser = data['data']['ID'];
          return _handleSuccessfulLogin(context, idUser);
        } else {
          return _showError(context, data['message']);
        }
      } else {
        return _showError(context, 'Erro: ${response.statusCode}');
      }
    } catch (e) {
      return _showServerError(context, e.toString());
    }
  }

  // Lógica para ler o cartão pelo NFC
  Future<String> _readRfidByNfc(BuildContext context) async {
    try {
      _logger.d("Iniciando chamada do método readNfc");

      String cardId = await NativeChannel.platform.invokeMethod('lernfcid');

      if (cardId.isNotEmpty) {
        _logger.d("Método readNfc chamado com sucesso, resultado: $cardId");

        if (cardId.isNotEmpty) {
          await LoginUtils().executeLoginPassword(context, true);
          return cardId;
        } else {
          return _showReadNfcError(context, '');
        }
      } else {
        return _showReadNfcError(context, '');
      }
    } on PlatformException catch (e) {
      return _showReadNfcError(context, e.toString());
    } catch (e) {
      return _showReadNfcError(context, e.toString());
    }
  }

  // Lógica caso login seja bem sucedido
  Future<bool> _handleSuccessfulLogin(BuildContext context, int idUser) async {
    await _loginUtils.updateConfigVariables(idUser);
    await _loginUtils.updateLocalDatabase(context, idUser);
    await Future.delayed(const Duration(seconds: 2));
    await _loginUtils.setPaymentForms();
    _billFeatures.addProduct();
    Get.back();
    _loginUtils.navigationToHomePage();
    return true;
  }

  // Verifica se o id do card é nulo ou está em branco
  bool _cardIdIsEmpty(String? cardId) {
    return cardId == null || cardId.isEmpty;
  }

  // Caso ocorra erro na leitura do nfc
  String _showReadNfcError(BuildContext context, String message) {
    _logger.e("Erro ao ler NFC: $message");
    const CustomCherryError(message: 'Erro ao ler o cartão.').show(context);
    return '';
  }

  // Caso entre no catch
  bool _showServerError(BuildContext context, String message) {
    _logger.e('Erro ao efetuar login. $message');
    const CustomCherryError(message: 'Erro ao contectar com o servidor!')
        .show(context);
    Get.back();
    return false;
  }

  // Caso ocorra algum erro nas credenciais do login
  bool _showError(BuildContext context, String message) {
    _logger.e('Erro ao efetuar login. $message');
    const CustomCherryError(message: 'id inválido. Tente novamente!')
        .show(context);
    Get.back();
    return false;
  }
}
