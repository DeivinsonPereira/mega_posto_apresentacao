import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/model/credentials_model.dart';
import '../model/data_pos_model.dart';

class ConfigController extends GetxController {
  TextEditingController ipServidorController = TextEditingController();
  var ipServidor = ''.obs;
  var idUsuario = 0.obs;
  var serialDevice = '';
  late Credentials credential;
  late DataPos dataPos;

 
}
