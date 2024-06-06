import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:megga_posto_mobile/common/custom_text_style.dart';

import '../enum/modalidade_payment.dart';

class LogicGenerateWidget {
  Color colorIcon = Colors.white;
  double sizeIcon = 30;

  // Constrói o texto do card
  Widget buildText(String paymentFormSelected) {
    switch (paymentFormSelected) {
      case ModalidadePaymment.NOTA:
        return _buildText('NOTA');

      case ModalidadePaymment.DINHEIRO:
        return _buildText('DINHEIRO');

      case ModalidadePaymment.CREDITO:
        return _buildText('CREDITO');

      case ModalidadePaymment.DEBITO:
        return _buildText('DEBITO');

      case ModalidadePaymment.PIX:
        return _buildText('PIX');

      default:
        return _buildText('DINHEIRO');
    }
  }

  // Constrói o icone do card
  Widget buildIcon(String paymentFormSelected) {
    switch (paymentFormSelected) {
      case ModalidadePaymment.NOTA:
        return _buildIcon(Icons.receipt_long);

      case ModalidadePaymment.DINHEIRO:
        return _buildIcon(Icons.monetization_on);

      case ModalidadePaymment.CREDITO:
        return _buildIcon(FontAwesomeIcons.creditCard);

      case ModalidadePaymment.DEBITO:
        return _buildIcon(FontAwesomeIcons.solidCreditCard);

      case ModalidadePaymment.PIX:
        return _buildIcon(Icons.pix);

      default:
        return _buildIcon(Icons.monetization_on);
    }
  }

  // Constrói os textps de legenda dos pagamentos
  Widget _buildText(String paymentFormSelected) {
    return Text(paymentFormSelected,
        style: CustomTextStyles().whiteBoldStyle(20));
  }

  // Constrói os ícones dos pagamentos
  Widget _buildIcon(IconData icon) {
    return Icon(
      icon,
      color: colorIcon,
      size: sizeIcon,
    );
  }
}
