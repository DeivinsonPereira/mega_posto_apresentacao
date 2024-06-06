import '../../model/credentials_model.dart';
import '../../model/data_pos_model.dart';

abstract class IConfigFeatures {
  Future<void> setSerialDevice(String serial);
  Future<void> setDataPos(DataPos dataPos);
  Future<void> setCredential(Credentials credential);
  Future<void> updateIdUsuario(int idUser);
  Future<void> updateIpServidor();
}
