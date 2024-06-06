import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/repositories/isar_db/isar_service.dart';

import '../../../model/collections/payment_form.dart';

class GetPaymentForm {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  Future<List<PaymentForm>> getPayment() async {
    final isar = await _isarService.openDB();

    try {
      List<PaymentForm> paymentForms =
          await isar.paymentForms.where().findAll();

      if (paymentForms.isNotEmpty) {
        return paymentForms;
      } else {
        _logger.e('Erro ao buscar formas de pagamento. Lista vazia.');
        return [];
      }
    } catch (e) {
      _logger.e('Erro ao buscar formas de pagamento. $e');
      return [];
    }
  }
}
