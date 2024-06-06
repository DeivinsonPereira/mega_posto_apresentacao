// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/utils/method_quantity_back.dart';
import 'package:megga_posto_mobile/utils/methods/payment/payment_features.dart';

import '../../../page/home/home_page.dart';
import '../../../page/loading/loading_page.dart';
import '../../../repositories/http/get_credentials.dart';
import '../../../repositories/http/get_data_pos.dart';
import '../../../repositories/isar_db/dado_empresa/update_dado_empresa.dart';
import '../../../repositories/isar_db/payment_form/search_payment_form.dart';
import '../../../repositories/isar_db/product/search_product.dart';
import '../../../utils/methods/config/config_features.dart';

class LoginUtils {
  final _configFeatures = ConfigFeatures.instance;
  final _paymentFeatures = PaymentFeatures();
  // Lógica para atualizar as variáveis de configuração
  Future<void> updateConfigVariables(int idUser, {bool isNfce = false}) async {
    if (isNfce) MethodQuantityBack.back(2);

    await _configFeatures.updateIdUsuario(idUser);
  }

  // Lógica para atualizar o banco de dados local
  Future<void> updateLocalDatabase(BuildContext context, int idUser) async {
    await UpdateDadoEmpresa().updateUser(idUser);
    await SearchProduct().searchProductDB(context);
    await SearchPaymentForm().search();
  }

  // Navega para a tela inicial
  void navigationToHomePage() {
    Get.to(() => const HomePage());
  }

  // adiciona formas de pagamento na variável
  Future<void> setPaymentForms() async {
    await _paymentFeatures.setPaymentForms();
  }

  // Lógica para executar o login (busca dados da pos e credenciais)
  Future<void> executeLoginPassword(BuildContext context, bool isNfce) async {
    Get.dialog(const LoadingPage());
    await _getDataPos(context);
    await _getCredentials(context);
  }

  // Busca os dados da POS
  Future<void> _getDataPos(BuildContext context) async {
    bool dataPos = await GetDataPos().getDataPos(context);
    if (!dataPos) {
      Get.back();
      return;
    }
  }

  // Busca os dados das credenciais
  Future<void> _getCredentials(BuildContext context) async {
    bool credentials = await GetCredentials().getCredentials(context);
    if (!credentials) {
      Get.back();
      return;
    }
  }
}
