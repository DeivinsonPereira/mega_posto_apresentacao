// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers, use_super_parameters
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/service/payment_service/pix_payment.dart/pix_pdv/isolate_pix_pdv_manager.dart';
import 'package:megga_posto_mobile/utils/methods/payment/payment_features.dart';
import 'package:pixpdv_sdk/pixpdv_sdk.dart';

import 'package:megga_posto_mobile/common/custom_elevated_button.dart';
import 'package:megga_posto_mobile/common/custom_header_dialog.dart';
import 'package:megga_posto_mobile/service/print/execute_print.dart';
import 'package:megga_posto_mobile/utils/method_quantity_back.dart';
import 'package:megga_posto_mobile/utils/static/custom_colors.dart';

import '../../../../common/custom_text_style.dart';
import '../../../../service/payment_service/pix_payment.dart/pix_pdv/pix_pdv.dart';

class PixPdvPaymentDialog extends StatelessWidget {
  final Uint8List imageQrCodeBase64;
  final String textPix;
  final PixPdvSdk sdk;
  final QrDinamicoResult qrdinamico;
  const PixPdvPaymentDialog({
    Key? key,
    required this.imageQrCodeBase64,
    required this.textPix,
    required this.sdk,
    required this.qrdinamico,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pixPdv = PixPdv();
    final isolatePixPdvManager = IsolatePixPdvManager.instance;
    final _paymentFeatures = PaymentFeatures();
    double sizeTextButtom = Get.size.height * 0.03;

    _pixPdv.isolateMonitoring(context, qrdinamico, sdk);

    //Constrói a imagem do QrCode
    Widget _buildImageQrCode() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.memory(imageQrCodeBase64),
      );
    }

    // Constrói o cabecalho
    Widget _buildHeader() {
      return const CustomHeaderDialog(
        text: 'PIX',
      );
    }

    // Constrói o botão de voltar
    Widget _buildButonBack() {
      return SizedBox(
        height: 40,
        child: CustomElevatedButton(
            text: 'Voltar',
            textStyle: CustomTextStyles().whiteBoldStyle(sizeTextButtom),
            function: () {
              _paymentFeatures.clearEnteredValue();
              isolatePixPdvManager.kill();
              MethodQuantityBack.back(2);
            },
            radious: 0,
            colorButton: CustomColors.elevatedButtonSecondary),
      );
    }

    // Constrói o botão de imprimir
    Widget _buildButonPrint() {
      return SizedBox(
        height: 40,
        child: CustomElevatedButton(
            text: 'Imprimir',
            textStyle: CustomTextStyles().whiteBoldStyle(sizeTextButtom),
            function: () async => await ExecutePrint()
                .printQrCodeAndText(), // TODO implementar impressão QRCODE pix
            radious: 0,
            colorButton: CustomColors.confirmButton),
      );
    }

    // Constrói o botão de voltar e imprimir
    Widget _buildButonBackAndPrint() {
      return Row(children: [
        Expanded(
          child: _buildButonBack(),
        ),
        Expanded(
          child: _buildButonPrint(),
        )
      ]);
    }

    // Constrói o conteudo do dialog
    Widget _buildContent() {
      return SizedBox(
        height: Get.size.height * 0.5,
        width: Get.size.width * 0.5,
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: _buildImageQrCode()),
            _buildButonBackAndPrint(),
          ],
        ),
      );
    }

    // retorna o dialog do pix
    return Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0.0),
        ),
      ),
      child: _buildContent(),
    );
  }
}
