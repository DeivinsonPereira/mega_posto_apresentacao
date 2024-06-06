import 'dart:convert';
import 'dart:io';

import 'package:http/io_client.dart';
import 'package:logger/logger.dart';

import '../../../model/collections/payment_form.dart';
import '../../../utils/auth.dart';
import '../../../utils/endpoints.dart';
import 'insert_payment_form.dart';

class SearchPaymentForm {
  final Logger _logger = Logger();

  Future<List<PaymentForm>> search() async {

    Uri uri = Uri.parse(Endpoints.endpointPaymentForm());


   HttpClient client = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

    IOClient ioClient = IOClient(client);

    try {
      var response = await ioClient.post(uri, headers: Auth.header);

      if(response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if(data['success'] == true) {
          List<PaymentForm> paymentForms = [];
          for(var paymentForm in data['data']) {
            paymentForms.add(PaymentForm.fromMap(paymentForm));
          }
          InsertPaymentForm().insert(paymentForms);
          return paymentForms;
        }else {
          _logger.e('Erro ao buscar formas de pagamento. ${data['message']}');
          return [];
        }
      }else {
        _logger.e('Erro ao buscar formas de pagamento. ${response.statusCode}');
        return [];
      }
    } catch (e) {
      _logger.e('Erro ao buscar formas de pagamento. $e');
      return [];
    }
  }
}
