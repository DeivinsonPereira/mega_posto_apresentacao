// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/custom_arrow_back_icon.dart';
import 'package:megga_posto_mobile/common/custom_elevated_button.dart';
import 'package:megga_posto_mobile/common/custom_text_assignature.dart';
import 'package:megga_posto_mobile/common/custom_text_field.dart';
import 'package:megga_posto_mobile/service/print/execute_print.dart';
import 'package:megga_posto_mobile/utils/methods/config/config_features.dart';
import 'package:megga_posto_mobile/utils/static/custom_colors.dart';
import 'package:megga_posto_mobile/repositories/http/get_credentials.dart';
import 'package:megga_posto_mobile/utils/check_connection.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';

import '../../common/custom_image.dart';
import '../../common/custom_image_background.dart';
import '../../common/custom_text_style.dart';
import '../../repositories/http/get_data_pos.dart';
import '../loading/loading_page.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _configController = Dependencies.configController();
    final _configFeatures = ConfigFeatures.instance;
    const double _heigthButton = 40;
    double _widthButton = Get.size.width * 0.43;

    final _executePrint = ExecutePrint();

    // Constrói o botão de voltar
    Widget _buildArrowBack() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: Get.size.width * 0.1,
            height: Get.size.height * 0.07,
            child: CustomArrowBackButton(
              function: () => Get.back(),
            ),
          ),
        ],
      );
    }

    Widget _buildPrintTest() {
      return SizedBox(
        width: _widthButton,
        height: _heigthButton,
        child: CustomElevatedButton(
            text: 'Imprimir teste',
            textStyle: CustomTextStyles().whiteBoldStyle(18),
            function: () => _executePrint.printTeste(),
            radious: 20,
            colorButton: CustomColors.secondaryColor),
      );
    }

    // Constrói o botão de confirmar
    Widget _buildConfirmButton() {
      return SizedBox(
        width: Get.size.width * 0.43,
        height: 40,
        child: CustomElevatedButton(
            text: 'CONFIRMAR',
            textStyle: CustomTextStyles().whiteBoldStyle(18),
            function: () async {
              Get.dialog(const LoadingPage());
              _configFeatures.updateIpServidor();
              bool dataPos = await GetDataPos().getDataPos(context);
              if (!dataPos) {
                Get.back();
                return;
              }
              bool credentials = await GetCredentials().getCredentials(context);
              if (!credentials) {
                Get.back();
                return;
              }
              await CheckConnection().checkConnectionAndPersistData(context);

              Get.back();
              Get.back();
            },
            radious: 20,
            colorButton: CustomColors.elevatedButtonPrimary),
      );
    }

    // Constrói o campo de ip
    Widget _buildTextField() {
      return CustomTextField(
        text: 'Digite o ip do servidor',
        controller: _configController.ipServidorController,
        icon: Icons.wifi,
        radious: 25,
        colorContent: Colors.white,
        isFilled: true,
      );
    }

    // Constrói a assinatura
    Widget _buildAssignature() {
      return const Align(
          alignment: Alignment.bottomCenter, child: CustomTextAssignature());
    }

    // Constrói o conteúdo de dentro do container transparente
    Widget _buildContainerBody() {
      return SizedBox(
        width: Get.size.width * 0.75,
        child: Column(
          children: [
            _buildTextField(),
            SizedBox(height: Get.size.height * 0.03),
            _buildConfirmButton(),
            SizedBox(height: Get.size.height * 0.03),
            _buildPrintTest(),
            Expanded(child: _buildAssignature()),
          ],
        ),
      );
    }

    // Constrói o corpo do conteúdo
    Widget _buildBody() {
      return SingleChildScrollView(
        child: SizedBox(
          height: Get.size.height,
          child: Column(
            children: [
              _buildArrowBack(),
              SizedBox(
                height: Get.size.height * 0.255,
                child: CustomImage.customLogoTransparent(2.3),
              ),
              SizedBox(height: Get.size.height * 0.15),
              Expanded(
                child: _buildContainerBody(),
              ),
            ],
          ),
        ),
      );
    }

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
