import 'package:isar/isar.dart';
import 'package:logger/web.dart';
import 'package:megga_posto_mobile/model/collections/dado_empresa.dart';
import 'package:megga_posto_mobile/model/collections/data_pix.dart';
import 'package:megga_posto_mobile/model/collections/payment_form.dart';
import 'package:megga_posto_mobile/model/collections/product.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;
  Logger logger = Logger();

  IsarService() {
    db = openDB();
  }

  //abre o banco de dados
  Future<Isar> openDB() async {
    final dir = await getApplicationSupportDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          DadoEmpresaSchema,
          ProductSchema,
          PaymentFormSchema,
          DataPixSchema,
        ],
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
