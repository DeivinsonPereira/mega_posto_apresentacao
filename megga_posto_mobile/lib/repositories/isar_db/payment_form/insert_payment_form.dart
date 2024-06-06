import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/repositories/isar_db/isar_service.dart';

import '../../../model/collections/payment_form.dart';

class InsertPaymentForm {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  Future<void> insert(List<PaymentForm> paymentForms) async {
    final isar = await _isarService.openDB();

    var i = await isar.paymentForms.count();

    try {
      if (i > 0) {
        isar.writeTxn(() async => await isar.paymentForms.clear());
      }

      await isar
          .writeTxn(() async => await isar.paymentForms.putAll(paymentForms));
    } catch (e) {
      _logger.e('Erro ao limpar formas de pagamento. $e');
    }
  }
}
