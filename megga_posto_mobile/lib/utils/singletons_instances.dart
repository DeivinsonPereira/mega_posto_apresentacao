import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/io_client.dart';
import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/repositories/isar_db/isar_service.dart';
import 'package:megga_posto_mobile/service/payment_service/utils/choose_payment.dart';
import 'package:megga_posto_mobile/utils/boolean_methods.dart';

import '../page/payment/logic/logic_generate_widget.dart';
import '../service/execute_login/shared/login_utils.dart';

/// Classe que gerencia instâncias singleton de vários serviços usados na aplicação.
class SingletonsInstances {
  SingletonsInstances._privateConstructor();
  static final SingletonsInstances _instance =
      SingletonsInstances._privateConstructor();
  factory SingletonsInstances() => _instance;

  // Logger instance
  final _logger = Logger();
  Logger get logger => _logger;

  // Dio instance
  final _dio = Dio();
  Dio get dio => _dio;

  // IsarService instance
  final _isarService = IsarService();
  IsarService get isarService => _isarService;

  // IoClient instance
  final HttpClient _client = HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

  late final IOClient _ioClient = IOClient(_client);
  IOClient get ioClient => _ioClient;

  // LoginUtils instance  
  final _loginUtils = LoginUtils();
  LoginUtils get loginUtils => _loginUtils;

  // LogicWidgets instance
  final _logicWidgets = LogicGenerateWidget();
  LogicGenerateWidget get logicWidgets => _logicWidgets;

  // ChoosePayment instance
  final _choosePayment = ChoosePayment();
  ChoosePayment get choosePayment => _choosePayment;

  final BooleanMethods _booleanMethods = BooleanMethods();
  BooleanMethods get booleanMethods => _booleanMethods;
}
