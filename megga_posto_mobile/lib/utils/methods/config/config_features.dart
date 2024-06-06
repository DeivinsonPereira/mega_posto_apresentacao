import 'package:megga_posto_mobile/utils/dependencies.dart';
import 'package:megga_posto_mobile/utils/interface/i_config_features.dart';
import '../../../controller/config_controller.dart';
import '../../../model/collections/dado_empresa.dart';
import '../../../model/credentials_model.dart';
import '../../../model/data_pos_model.dart';
import '../../../repositories/isar_db/dado_empresa/get_dado_empresa.dart';

class ConfigFeatures implements IConfigFeatures {
  late ConfigController _configController;

  ConfigFeatures._privateConstructor() {
    _configController = Dependencies.configController();
  }

  static final ConfigFeatures _instance = ConfigFeatures._privateConstructor();

  static ConfigFeatures get instance => _instance;

  @override
  // adiciona a credencial na variável
  Future<void> setSerialDevice(String serial) async {
    _configController.serialDevice = serial;
  }

  @override
  // adiciona a credencial na variável
  Future<void> setDataPos(DataPos dataPos) async {
    _configController.dataPos = dataPos;
  }

  @override
  // adiciona a credencial na variável
  Future<void> setCredential(Credentials credential) async {
    _configController.credential = credential;
  }

  @override
  // Atualiza a variável ipServidor
  Future<void> updateIpServidor() async {
    if (_configController.ipServidorController.text.isNotEmpty) {
      _configController.ipServidor.value =
          _configController.ipServidorController.text.endsWith('/')
              ? _configController.ipServidorController.text
              : '${_configController.ipServidorController.text}/';
      ;
    } else {
      DadoEmpresa data = await GetDadoEmpresa().getDadoEmpresa();
      if (data.ipEmpresa.isNotEmpty) {
        _configController.ipServidor.value = data.ipEmpresa;
        _configController.ipServidorController.text = data.ipEmpresa;
      }
    }
  }

  @override
  // Atualiza a variável idUsuario
  Future<void> updateIdUsuario(int idUser) async {
    DadoEmpresa data = await GetDadoEmpresa().getDadoEmpresa();

    if (idUser != -1) {
      _configController.idUsuario.value = idUser;
    } else if (data.idUsuario == null) {
      _configController.idUsuario.value = -1;
    } else {
      _configController.idUsuario.value = data.idUsuario!;
    }
  }
}
