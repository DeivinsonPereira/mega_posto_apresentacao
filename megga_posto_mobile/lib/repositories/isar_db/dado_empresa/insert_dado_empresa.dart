import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/model/collections/dado_empresa.dart';
import 'package:megga_posto_mobile/repositories/isar_db/isar_service.dart';

class InsertDadoEmpresa {
  final IsarService _isarService;
  final Logger _logger;

  InsertDadoEmpresa(this._isarService, this._logger);

  // Insere os dados de configuração no banco de dados local
  Future<bool> insertDadoEmpresa(String ip) async {
    final isar = await _isarService.openDB();

    var i = await isar.dadoEmpresas.count();
    try {
      if (i > 0) {
        isar.writeTxn(() => isar.dadoEmpresas.clear());
      }

      DadoEmpresa dadoEmpresa;
      if (ip.endsWith('/')) {
        dadoEmpresa = DadoEmpresa(ip, null);
      }else {
        dadoEmpresa = DadoEmpresa('$ip/', null);
      }

      await isar.writeTxn(() async {
        await isar.dadoEmpresas.put(dadoEmpresa);
      });
      return true;
    } catch (e) {
      _logger.e('Erro ao inserir dados. $e');
      return false;
    }
  }
}
