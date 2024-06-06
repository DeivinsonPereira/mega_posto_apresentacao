// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/utils/format_numbers.dart';
import 'package:megga_posto_mobile/utils/format_string.dart';

import '../../../utils/static/custom_colors.dart';
import '../../../model/supply_model.dart';
import '../../../utils/dependencies.dart';
import '../logic/logic_navigation_supply_pump.dart';

class CustomCardSupply extends StatelessWidget {
  final Supply supplySelected;
  final int index;

  const CustomCardSupply({
    super.key,
    required this.supplySelected,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var supplyController = Dependencies.supplyController();

    // Constrói o Ícone do card
    Widget _buildIcon() {
      return Icon(
        Icons.local_gas_station,
        color: CustomColors.iconPumpColor,
        size: Get.size.width * 0.25,
      );
    }

    // Constrói o numero do bico no card
    Widget _buildNumberPump() {
      return Text(
        FormatNumbers.formatSingleDigit(supplySelected.bicoId),
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      );
    }

    // Constrói a linha do ícone e numero do bico
    Widget _buildLineIconAndNumberPump() {
      return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildIcon(), _buildNumberPump()],
        ),
      );
    }

    //TODO Construir a logica para pegar a quantidade de abastecimentos
    Widget _buildContainerQuantity() {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: CustomColors.containerQuantity),
        child: Text(
          FormatNumbers.formatSingleDigit(
              supplyController.allSupplyPumpList.length),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    }

    // Constrói o tipo de bico e o ultimo valor de abastecimento do bico
    Widget _buildColumnTypeAndValue() {
      return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text(
          FormatString.splitText(supplySelected.descricaoBico, '-'),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          'R\$ ${FormatNumbers.formatNumbertoString(
            supplySelected.valorUltimoAbastecimento,
          )}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ]);
    }

    // Constrói a linha da quantidade, do tipo de bico e do valor
    Widget _buildLineInformations() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildContainerQuantity(),
            _buildColumnTypeAndValue(),
          ],
        ),
      );
    }

    // Constrói o card
    return InkWell(
      onTap: () =>
          LogiNavigationSupplyPump().navigation(context, supplySelected),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        color: Colors.white,
        child: Column(
          children: [
            _buildLineIconAndNumberPump(),
            SizedBox(height: Get.size.height * 0.02),
            _buildLineInformations(),
          ],
        ),
      ),
    );
  }
}
