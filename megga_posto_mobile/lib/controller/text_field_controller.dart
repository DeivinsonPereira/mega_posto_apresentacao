import 'package:get/get.dart';

class TextFieldController extends GetxController {
  var isObscure = true.obs;

  void toggleObscure() {
    isObscure.value = !isObscure.value;
    update();
    isObscure.refresh();
  }
}
