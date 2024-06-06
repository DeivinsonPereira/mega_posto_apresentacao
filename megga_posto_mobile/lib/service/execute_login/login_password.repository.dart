// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/service/execute_login/interface/i_execute_login.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';
import 'package:megga_posto_mobile/utils/singletons_instances.dart';

import '../../common/custom_cherry.dart';
import '../../model/login_model.dart';
import '../../utils/auth.dart';
import '../../utils/endpoints.dart';

class LoginPasswordRepository implements IExecuteLogin {
  final _singletonsInstances = SingletonsInstances();
  final _loginController = Dependencies.loginController();

  late final _ioClient = _singletonsInstances.ioClient;
  late final _logger = _singletonsInstances.logger;
  late final _loginUtils = _singletonsInstances.loginUtils;

  @override
  Future<void> login(BuildContext context, {String? cardId}) async {
    if (!_isValidCredentials()) return _showError(context, '');

    Uri uri = Uri.parse(Endpoints.postLogin());

    try {
      Login login = Login(
          plogin: _loginController.usuarioController.text,
          psenha: _loginController.senhaController.text);

      var response = await _ioClient
          .post(uri, body: login.toJson(), headers: Auth.header)
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          var idUser = data['data']['ID'];
          _handleSuccessfulLogin(context, idUser);
        } else {
          _showError(context, data['message']);
        }
      } else {
        _showError(context, 'Erro: ${response.statusCode}');
      }
    } catch (e) {
      _showError(context, e.toString());
    }
  }

  // Caso o login seja bem-sucedido
  Future<void> _handleSuccessfulLogin(BuildContext context, int idUser) async {
    await _loginUtils.updateConfigVariables(idUser);
    await _loginUtils.updateLocalDatabase(context, idUser);
    await Future.delayed(const Duration(seconds: 2));
    await _loginUtils.setPaymentForms();
    _updateLoginVariables();
    Get.back();
    _loginUtils.navigationToHomePage();
  }

  // Limpa os campos de login e senha
  void _updateLoginVariables() {
    _loginController.usuarioController.text = '';
    _loginController.senhaController.text = '';
  }

  // Mostra mensagem de erro em caso de erro
  void _showError(BuildContext context, String message) {
    _logger.e('Login ou senha inválidos. Tente novamente! $message');
    Get.back();
    const CustomCherryError(
            message: 'Login ou senha inválidos. Tente novamente! ')
        .show(context);
  }

  // Verifica se os campos de login e senha foram preenchidos
  bool _isValidCredentials() {
    return _loginController.senhaController.text.isNotEmpty &&
        _loginController.usuarioController.text.isNotEmpty;
  }
}
