// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:megga_posto_mobile/utils/static/custom_colors.dart';
import 'package:megga_posto_mobile/utils/static/custom_grid_view.dart';

import '../../common/custom_header_app_bar.dart';
import '../../common/custom_text_assignature.dart';
import 'components/custom_card_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Constrói os Cards
    Widget _buildCard(int index) {
      return CustomCardHomePage(
        color: CustomGridView.colorsGridView[index],
        icon: CustomGridView.iconsGridView[index],
        title: CustomGridView.titlesGridView[index],
        function: CustomGridView.functionsGridView[index],
      );
    }

    // Constrói o body
    Widget _buildBody() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 2,
          itemBuilder: (context, index) {
            return _buildCard(index);
          },
        ),
      );
    }

    Widget _buildAssignation() {
      return const CustomTextAssignature();
    }

    // Constrói a página
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Column(
        children: [
          CustomHeaderAppBar(),
          Expanded(
            child: _buildBody(),
          ),
          _buildAssignation(),
        ],
      ),
    );
  }
}
