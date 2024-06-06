// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/custom_text_style.dart';
import 'package:megga_posto_mobile/model/supply_pump_model.dart';
import 'package:megga_posto_mobile/utils/date_time_formatter.dart';
import 'package:megga_posto_mobile/utils/format_numbers.dart';
import 'package:megga_posto_mobile/utils/methods/bill/bill_features.dart';

import '../../../model/supply_model.dart';
import '../logic/logic_navigation_next_page.dart';

class CustomCardSupplyPump extends StatelessWidget {
  final SupplyPump supplyPumpSelected;
  final Supply supplySelected;
  final int index;
  const CustomCardSupplyPump({
    Key? key,
    required this.supplyPumpSelected,
    required this.supplySelected,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _billFeatures = BillFeatures();

    // Constrói o valor do card
    Widget _buildValue() {
      return Align(
        alignment: Alignment.topLeft,
        child: Text(
          'R\$ ${FormatNumbers.formatNumbertoString(supplyPumpSelected.total)}',
          style: CustomTextStyles().blackBoldStyle(20),
        ),
      );
    }

    // Constrói o ícone e a hora
    Widget _buildHour() {
      return Row(
        children: [
          const Icon(
            FontAwesomeIcons.solidClock,
            size: 30,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(DatetimeFormatter.getHora(supplyPumpSelected.dataHora!),
              style: const TextStyle(fontSize: 20)),
        ],
      );
    }

    // Constrói o ícone e quantidade
    Widget _buildQuantity() {
      return Row(
        children: [
          const Icon(
            FontAwesomeIcons.gasPump,
            size: 30,
          ),
          Text(
            'Qtde: ',
            style: CustomTextStyles().blackBoldStyle(20),
          ),
          Text(
            supplyPumpSelected.quantidade!.toStringAsFixed(3),
            style: const TextStyle(fontSize: 20),
          )
        ],
      );
    }

    // Constrói o corpo da page
    Widget _buildBody() {
      return Column(children: [
        _buildValue(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _buildHour(),
          SizedBox(
            height: Get.size.height * 0.06,
          ),
          _buildQuantity(),
        ]),
      ]);
    }

    // retorna o card
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) {
          _billFeatures.clearCartShoppingList();
          _billFeatures.clearSupplyPumpSelected();
          return;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () async {
            await LogicNavigationNextPage()
                .nextPage(supplySelected, supplyPumpSelected);
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: _buildBody(),
                )),
          ),
        ),
      ),
    );
  }
}
