import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/model/collections/dado_empresa.dart';
import 'package:megga_posto_mobile/repositories/isar_db/isar_service.dart';

class UpdateDadoEmpresa {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  // Atualiza os dados de configuração no banco de dados local
  Future<bool> updateUser(int idUser) async {
    final isar = await _isarService.openDB();

    try{

    var dadoEmpresa = await isar.dadoEmpresas.where().findFirst();

    if (dadoEmpresa != null) {
      dadoEmpresa.idUsuario = idUser;
      isar.writeTxn(() async => await isar.dadoEmpresas.put(dadoEmpresa));
      return true;
    } else {
      _logger.e('Erro ao buscar dados. ');
      return false;
    }
    } catch (e) {
      _logger.e('Erro ao buscar dados. $e');
      return false;
    }
  }
}
