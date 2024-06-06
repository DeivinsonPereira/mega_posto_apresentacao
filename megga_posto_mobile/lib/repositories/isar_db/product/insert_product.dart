import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/repositories/isar_db/isar_service.dart';

import '../../../model/collections/product.dart';

class InsertProduct {
  final IsarService _isarService;
  final Logger _logger;

  InsertProduct(this._isarService, this._logger);

  // insere os produtos no banco de dados local
  Future<void> insertProduct(List<Product> products) async {
    final isar = await _isarService.openDB();

    var i = await isar.products.count();
    if (i > 0) {
      isar.writeTxn(() => isar.products.clear());
    }

    try {
      if (products.isNotEmpty) {
        await isar.writeTxn(() async {
          await isar.products.putAll(products);
        });
      } else {
        _logger.e('Erro ao inserir produtos. Lista vazia');
      }
    } catch (e) {
      _logger.e('Erro ao inserir produtos. $e');
    }
  }
}
