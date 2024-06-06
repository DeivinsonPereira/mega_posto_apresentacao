import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/io_client.dart';
import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/utils/auth.dart';
import 'package:megga_posto_mobile/repositories/isar_db/isar_service.dart';
import 'package:megga_posto_mobile/repositories/isar_db/product/insert_product.dart';

import '../../../model/collections/product.dart';
import '../../../utils/endpoints.dart';

class SearchProduct {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  // Procura os produtos na api, se encontrar chama o método para inserir no banco de dados local
  Future<void> searchProductDB(BuildContext context) async {
    Uri uri = Uri.parse(Endpoints.endpointProducts());

    HttpClient client = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

    IOClient ioClient = IOClient(client);

    try {
      var response = await ioClient.post(uri, headers: Auth.header);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          List<Product> products = [];
          products.clear();
          for (var product in data['data']) {
            products.add(Product.fromMap(product));
          }
          InsertProduct(_isarService, _logger).insertProduct(products);
        } else {
          _logger.e('Erro ao buscar produtos. ${data['message']}');
        }
      } else {
        _logger.e('Erro ao buscar produtos. ${response.statusCode}');
      }
    } catch (e) {
      _logger.e('Erro ao buscar produtos. $e');
    }
  }
}
