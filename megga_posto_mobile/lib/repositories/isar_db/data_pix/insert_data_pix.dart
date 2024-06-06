import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/model/collections/data_pix.dart';
import 'package:megga_posto_mobile/repositories/isar_db/isar_service.dart';
import 'package:megga_posto_mobile/utils/date_time_formatter.dart';
import 'package:megga_posto_mobile/utils/methods/bill/bill_get.dart';
import 'package:pixpdv_sdk/pixpdv_sdk.dart';

class InsertDataPix {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();
  final _billGet = BillGet();

  InsertDataPix.privateConstructor();

  static final InsertDataPix _instance = InsertDataPix.privateConstructor();

  factory InsertDataPix() => _instance;

  Future<void> insert(QrDinamicoResult dataPix) async {
    final isar = await _isarService.openDB();

    DataPix data = DataPix(
        date: DatetimeFormatter.formatDate(DateTime.now()),
        hour: DatetimeFormatter.formatHour(DateTime.now()),
        value: _billGet.getTotalValueFromCart(),
        qrCode: dataPix.qrDinamicoResultData!.qrcode!,
        qrCodeBase64: dataPix.qrDinamicoResultData!.qrcodeBase64!,
        qrCodeId: dataPix.qrDinamicoResultData!.qrcodeId!);

    try {
      await isar.writeTxn(() async {
        await isar.dataPixs.put(data);
      });
    } catch (e) {
      _logger.e('Erro ao inserir pix. $e');
    }
  }
}
