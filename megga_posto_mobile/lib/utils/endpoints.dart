import 'package:get/get.dart';

import 'dependencies.dart';

abstract class Endpoints {
  static var configController = Dependencies.configController();
  static var ip = configController.ipServidor;
  static String postLogin() {
    if (ip.isNotEmpty) {
      return '${ip}login';
    }
    return '';
  }

  static String endpointLoginNfc() {
    if (ip.isNotEmpty) {
      return '${ip}login_nfc';
    }
    return '';
  }

  static String endpointResumeSupply() {
    if (ip.isNotEmpty) {
      return '${ip}retorna_abastecimento_atendente';
    }
    return '';
  }

  static String endpointSupplyPump() {
    if (ip.isNotEmpty) {
      return '${ip}retorna_abastecimento_por_bico_atendente';
    }
    return '';
  }

  static String endpointProducts() {
    if (ip.isNotEmpty) {
      return '${ip}retorna_produto';
    }
    return '';
  }

  static String endpointPaymentForm() {
    if (ip.isNotEmpty) {
      return '${ip}retorna_forma_pagamento';
    }
    return '';
  }

  static String endpointCredentials() {
    if (ip.isNotEmpty) {
      return '${ip}retorna_dados_credenciais_fidelidade';
    }
    return '';
  }

  static String endpointCredetialPix() {
    if (ip.isNotEmpty) {
      return '${ip}retorna_dados_smart_pos';
    }
    return '';
  }

  static String endpointVenda() {
    if (ip.isNotEmpty) {
      return '${ip}grava_venda';
    }
    return '';
  }
}
