import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:megga_posto_mobile/repositories/isar_db/isar_service.dart';

import '../../../model/collections/dado_empresa.dart';

class GetDadoEmpresa {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();



  // Busca os dados no banco local
  Future<DadoEmpresa> getDadoEmpresa() async {
    final isar = await _isarService.db;
    
    try {

    var dado = await isar.dadoEmpresas.where().findFirst();

    if (dado != null) {
      return dado;
    } else {
      return DadoEmpresa('', null);
    }
    } catch (e) {
      _logger.e('Erro ao buscar dados. $e');
      return DadoEmpresa('', null);
    }
  }
}
