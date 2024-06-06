import 'package:flutter/material.dart';
import 'package:megga_posto_mobile/service/execute_login/interface/i_execute_login.dart';
import 'package:megga_posto_mobile/service/execute_login/login_nfc_repository.dart';

import 'login_password.repository.dart';

class ExecuteLogin {
  void login(BuildContext context, bool isNfce) {
    IExecuteLogin? executeLogin;

    if (isNfce) executeLogin = LoginNfcRepository();
    if (!isNfce) executeLogin = LoginPasswordRepository();

    if (executeLogin == null) return;

    executeLogin.login(context);
  }
}
