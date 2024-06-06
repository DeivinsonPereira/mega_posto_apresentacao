// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../../common/custom_header_app_bar.dart';
import '../../utils/static/custom_colors.dart';
import '../../model/supply_model.dart';
import '../../utils/dependencies.dart';
import 'components/custom_card_supply_pump.dart';

class SupplyPumpPage extends StatelessWidget {
  final Supply supplySelected;
  const SupplyPumpPage({
    Key? key,
    required this.supplySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var supplyController = Dependencies.supplyController();

    // Constrói a listview e chama os cards
    Widget _buildListView() {
      return ListView.builder(
          itemCount: supplyController.supplySelectedPumpList.length,
          itemBuilder: (context, index) {
            var supplyPumpSelected = supplyController.supplySelectedPumpList[index];
            return CustomCardSupplyPump(
                supplyPumpSelected: supplyPumpSelected,
                index: index,
                supplySelected: supplySelected);
          });
    }

    // Constrói o corpo da page
    Widget _buildBody() {
      return Column(
        children: [
          CustomHeaderAppBar(
            isSupplyPump: true,
            bicoId: supplySelected.bicoId,
          ),
          Expanded(child: _buildListView()),
        ],
      );
    }

    // Constrói o Scaffold
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: _buildBody(),
    );
  }
}
