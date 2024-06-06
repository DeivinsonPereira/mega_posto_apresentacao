import 'package:get/get.dart';

abstract class MethodQuantityBack {
  static void back(int quantity) {
    for (var i = 0; i < quantity; i++) {
      Get.back();
    }
  }
}
