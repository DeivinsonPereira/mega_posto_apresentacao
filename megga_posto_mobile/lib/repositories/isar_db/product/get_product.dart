import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/repositories/isar_db/isar_service.dart';

import '../../../model/collections/product.dart';

class GetProduct {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  Future<List<Product>> getProduct() async {
    final isar = await _isarService.openDB();

    try {
      var products = await isar.products.where().findAll();

      if (products.isNotEmpty) {
        return products;
      } else {
        _logger.e('Erro ao buscar produtos. Lista vazia.');
        return [];
      }
    } catch (e) {
      _logger.e('Erro ao buscar produtos. $e');
      return [];
    }
  }
}
