// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/custom_header_app_bar.dart';
import 'package:megga_posto_mobile/utils/static/custom_colors.dart';
import 'package:megga_posto_mobile/controller/supply_controller.dart';
import 'package:megga_posto_mobile/model/supply_model.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';

import 'components/custom_card_supply.dart';

class SupplyPage extends StatelessWidget {
  const SupplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    Dependencies.supplyController();

    Widget _buildBody() {
      return GetBuilder<SupplyController>(builder: (_) {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemCount: _.supplyList.length,
            itemBuilder: (context, index) {
              Supply supplySelected = _.supplyList[index];
              return CustomCardSupply(
                supplySelected: supplySelected,
                index: index,
              );
            });
      });
    }

    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Column(children: [
        CustomHeaderAppBar(),
        Expanded(child: _buildBody()),
      ]),
    );
  }
}
