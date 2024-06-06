import 'package:flutter_clisitef/clisitef.dart';
import 'package:flutter_clisitef/model/transaction_events.dart';
import 'package:flutter_clisitef/pdv/clisitef_pdv.dart';
import 'package:get/get.dart';

class ClisitefController extends GetxController{
  ClisitefController._privateConstructor();

  static final ClisitefController _instance = ClisitefController._privateConstructor();

  factory ClisitefController() => _instance;

  final clisitefPlugin = CliSitef.instance;
  final bool isSimulated = false;

  late CliSiTefPDV pdv;

  TransactionEvents transactionStatus = TransactionEvents.unknown;
  RxList<String> dataReceived = <String>[].obs;

  RxString pinPadInfo = ''.obs;
  RxString lastTitle = ''.obs;
  RxString lastMsgCustomer = ''.obs;
  RxString lastMsgCashier = ''.obs;
  RxString lastMsgCashierCustomer = ''.obs;

  RxBool showAbortButton = false.obs;
  RxBool abortTransaction = false.obs;
}
