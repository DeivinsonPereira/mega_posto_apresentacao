// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/custom_elevated_button.dart';
import 'package:megga_posto_mobile/common/custom_image.dart';
import 'package:megga_posto_mobile/common/custom_text_assignature.dart';
import 'package:megga_posto_mobile/common/custom_text_field.dart';
import 'package:megga_posto_mobile/service/execute_login/execute_login.dart';
import 'package:megga_posto_mobile/utils/static/custom_colors.dart';
import 'package:megga_posto_mobile/common/custom_text_style.dart';
import 'package:megga_posto_mobile/page/config/config_page.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';

import '../../common/custom_image_background.dart';
import '../loading/loading_page.dart';
import '../payment/pages/sitef_payment/teste/clisitef_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var loginController = Dependencies.loginController();
    Dependencies.configController();

    // Constrói o botão de configuração
    Widget _buildButtonConfig() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(
              onTap: () => Get.to(() => const ConfigPage(),
                  transition: Transition.rightToLeft),
              child: const SizedBox(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.settings,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    }

    // Constrói os campo de texto
    Widget _buildTextField(
        String text, IconData icon, TextEditingController controller,
        {bool? isSecret = false}) {
      return CustomTextField(
        text: text,
        controller: controller,
        icon: icon,
        radious: 25,
        colorContent: Colors.white,
        isFilled: true,
      );
    }

    // Constrói os botões de "ENTRAR" e "VIA RFID"
    Widget _buildElevatedButton(
        String text, Function() function, Color colorButton) {
      return SizedBox(
        width: Get.size.width * 0.40,
        height: 40,
        child: CustomElevatedButton(
            text: text,
            textStyle: CustomTextStyles().whiteBoldStyle(20),
            function: function,
            radious: 20,
            colorButton: colorButton),
      );
    }

    // Constrói a assinatura do aplicativo
    Widget _textAssignation() {
      return const Align(
        alignment: Alignment.bottomCenter,
        child: CustomTextAssignature(),
      );
    }

    // Constrói o conteúdo do container
    Widget _buildContainerBody() {
      return SizedBox(
        width: Get.size.width * 0.75,
        child: Column(
          children: [
            _buildTextField(
              'Usuário',
              Icons.person,
              loginController.usuarioController,
            ),
            SizedBox(
              height: Get.size.height * 0.02,
            ),
            _buildTextField(
                'Senha', Icons.lock, loginController.senhaController,
                isSecret: true),
            SizedBox(
              height: Get.size.height * 0.03,
            ),
            _buildElevatedButton('ENTRAR', () {
              Get.dialog(const LoadingPage());
              ExecuteLogin().login(context, false);
            }, CustomColors.elevatedButtonPrimary),
            SizedBox(
              height: Get.size.height * 0.02,
            ),
            _buildElevatedButton('VIA RFID', () async {
              ExecuteLogin().login(context, true);
            }, CustomColors.elevatedButtonPrimary),
          ],
        ),
      );
    }

    // Constrói o corpo da page
    Widget _buildBody() {
      return SingleChildScrollView(
        child: SizedBox(
          height: Get.size.height,
          child: Column(
            children: [
              _buildButtonConfig(),
              SizedBox(
                height: Get.size.height * 0.255,
                child: CustomImage.customLogoTransparent(2.3),
              ),
              SizedBox(height: Get.size.height * 0.15),
              Expanded(
                child: _buildContainerBody(),
              ),
              _textAssignation(),
            ],
          ),
        ),
      );
    }

    // Constrói a page
    return Scaffold(
      body: Stack(
        children: [
          CustomImageBackground(),
          _buildBody(),
        ],
      ),
    );
  }
}
