import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/model/sell_item_model.dart';
import 'package:megga_posto_mobile/service/execute_sell/interface/i_execute_sell.dart';
import 'package:megga_posto_mobile/utils/boolean_methods.dart';
import 'package:megga_posto_mobile/utils/endpoints.dart';
import 'package:megga_posto_mobile/utils/singletons_instances.dart';
import '../../model/payment_form_selected.dart';
import '../../model/sell_model.dart';
import '../../model/supply_model.dart';
import '../../model/supply_pump_model.dart';
import '../../utils/dependencies.dart';
import '../../utils/auth.dart';

class ExecuteSell implements IExecuteSell {
  final Logger _logger = Logger();
  final _billController = Dependencies.billController();
  final _paymentController = Dependencies.paymentController();
  final _configController = Dependencies.configController();
  final _ioClient = SingletonsInstances().ioClient;
  final _booleanMethods = SingletonsInstances().booleanMethods;
  double totalNota = 0.0;
  double totalProduct = 0.0;
  List<SellItem?> items = [];
  List<PaymentFormSelected> listPaymentsSelected = [];

  @override
  Future<String> executeSell({Supply? supply, SupplyPump? supplyPump}) async {
    try {
      _addTotalNotaAndTotalProduct();

      if (!_booleanMethods.isSupplyPumpEmpty()) {
        items.add(getSupplyItem());
      }
      if (!_booleanMethods.isProductEmpty()) {
        items.addAll(getProductItem());
      }

      listPaymentsSelected = getPaymentFormSelected();

      Sell sell = await getSell();

      Uri uri = Uri.parse(Endpoints.endpointVenda());

      var response =
          await _ioClient.post(uri, headers: Auth.header, body: sell.toJson());

      if (kDebugMode) print(sell.toJson());

      if (response.statusCode == 200) {
        var data = jsonDecode(response.headers['x-status']!);
        if (data['success'] == true) {
          String xml = response.body;
          return xml;
        } else {
          _logger
              .e('Erro ao executar a venda. ${response.headers['x-status']}');
          return '';
        }
      } else {
        _logger.e(
            'Erro ao executar a venda dados. ${response.headers['x-status']}');
        return '';
      }
    } catch (e) {
      _logger.e('Erro ao executar a venda. $e');
      return '';
    }
  }

  @override
  // Monta o objeto Sell
  Future<Sell> getSell() async {
    Sell sell;
    sell = Sell(
        valor_desconto: 0,
        cliente_id: 1,
        data_venda: DateTime.now().toIso8601String(),
        total_nota: totalNota,
        total_produtos: totalProduct,
        data_hora_venda: DateTime.now().toIso8601String(),
        caixa_id: _billController.supplyPumpSelected.caixaId,
        atendente_id: _configController.idUsuario.value,
        replicate_caixa_id:
            _billController.supplyPumpSelected.replicate_caixa_id,
        itens: items,
        parcelas: listPaymentsSelected);
    return sell;
  }

  @override
  // Monta o objeto SupplyItem
  SellItem? getSupplyItem() {
    var supplySelected = _billController.supplyPumpSelected;
    var item;

    // TODO VERIFICAR... ta indo tudo null
    if (_booleanMethods.isSupplyPumpEmpty()) return item;
    item = SellItem(
      produto_id: _billController.cartShopping.value.supplyPump!.produto_id,
      sequencia: 1,
      quantidade: supplySelected.quantidade,
      total_liquido: supplySelected.total, // desconto
      tanque_id: supplySelected.tanque_id,
      bico_id: supplySelected.bicoId,
      abastecimento_id: supplySelected.id,
      encerrante_final:
          supplySelected.encerrante_final, // verificar o que é isso
      preco_liquido: supplySelected.total, // desconto
      valor_desconto: 0, // Colocar depois,
      valor_acrescimo: 0, // verificar
      encerrante_inicial: supplySelected.encerrante_inicial, // verificar
      preco_bruto: supplySelected.unitario, // colocar valor combustivel bruto
      total_bruto: supplySelected.total, // colocar valor dos produtos bruto
    );

    if (item == null) return null;
    return item;
  }

  @override
  // Monta o objeto SellItem
  List<SellItem?> getProductItem() {
    List<SellItem> items = [];
    int count = 2;
    if (BooleanMethods().isProductEmpty()) return items;

    for (var item in _billController.cartShopping.value.productAndQuantity!) {
      items.add(SellItem(
        produto_id: item.product!.codigo,
        sequencia: count,
        quantidade: item.quantity!.toDouble(),
        total_liquido: item.product!.valor! * item.quantity!, // desconto
        tanque_id: 0,
        bico_id: 0,
        abastecimento_id: 0,
        encerrante_final: 0, // verificar o que é isso
        preco_liquido: item.product!.valor, // desconto
        valor_desconto: 0, // Colocar depois,
        valor_acrescimo: 0, // verificar
        encerrante_inicial: 0, // verificar
        preco_bruto: item.product!.valor, // colocar valor combustivel bruto
        total_bruto: item.product!.valor! *
            item.quantity!, // colocar valor dos produtos bruto
      ));

      count++;
    }

    if (items.isEmpty) return [];

    return items;
  }

  @override
  List<PaymentFormSelected> getPaymentFormSelected() {
    List<PaymentFormSelected> list = [];

    for (var item in _paymentController.listPaymentsSelected) {
      list.add(PaymentFormSelected(
          forma_pagamento_id: item.formaPagamentoId!,
          data_vencimento: _convertToIso8601(item.dataVencimento!),
          num_parcela: item.numParcela!,
          valor_parcela: item.valorIntegral!));
    }
    return list;
  }

  // Adiciona o total das notas e produtos
  void _addTotalNotaAndTotalProduct() {
    if (_booleanMethods.isProductEmpty()) return;

    for (var item in _billController.cartShopping.value.productAndQuantity!) {
      totalNota += item.quantity! * item.product!.valor!; // - desconto
      totalProduct += item.quantity! * item.product!.valor!;
    }

    if (_booleanMethods.isSupplyPumpEmpty()) return;
    totalNota +=
        _billController.cartShopping.value.supplyPump!.total!; // - desconto
    totalProduct += _billController.cartShopping.value.supplyPump!.total!;
  }

  String _convertToIso8601(String dateStr) {
    DateFormat originalFormat = DateFormat('dd/MM/yyyy');
    DateTime dateTime = originalFormat.parse(dateStr);
    return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(dateTime.toUtc());
  }
}
