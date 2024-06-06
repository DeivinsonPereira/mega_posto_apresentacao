import 'package:get/get.dart';
import 'package:megga_posto_mobile/controller/bill_controller.dart';
import 'package:megga_posto_mobile/controller/config_controller.dart';
import 'package:megga_posto_mobile/controller/payment_controller.dart';
import 'package:megga_posto_mobile/controller/supply_controller.dart';
import 'package:megga_posto_mobile/controller/text_field_controller.dart';
import 'package:megga_posto_mobile/service/payment_service/tef_payment.dart/sitef/controller/clisitef_controller.dart';

import '../controller/login_controller.dart';
import '../controller/splash_controller.dart';

abstract class Dependencies {
  static SplashController splashController() {
    if (Get.isRegistered<SplashController>()) {
      return Get.find<SplashController>();
    } else {
      return Get.put(SplashController());
    }
  }

  static LoginController loginController() {
    if (Get.isRegistered<LoginController>()) {
      return Get.find<LoginController>();
    } else {
      return Get.put(LoginController());
    }
  }

  static TextFieldController textFieldController() {
    if (Get.isRegistered<TextFieldController>()) {
      return Get.find<TextFieldController>();
    } else {
      return Get.put(TextFieldController());
    }
  }

  static ConfigController configController() {
    if (Get.isRegistered<ConfigController>()) {
      return Get.find<ConfigController>();
    } else {
      return Get.put(ConfigController(), permanent: true);
    }
  }

  static SupplyController supplyController() {
    if (Get.isRegistered<SupplyController>()) {
      return Get.find<SupplyController>();
    } else {
      return Get.put(SupplyController(), permanent: true);
    }
  }

  static BillController billController() {
    if (Get.isRegistered<BillController>()) {
      return Get.find<BillController>();
    } else {
      return Get.put(BillController(), permanent: true);
    }
  }

  static PaymentController paymentController() {
    if (Get.isRegistered<PaymentController>()) {
      return Get.find<PaymentController>();
    } else {
      return Get.put(PaymentController(), permanent: true);
    }
  }

  static ClisitefController clisitefController() {
    if (Get.isRegistered<ClisitefController>()) {
      return Get.find<ClisitefController>();
    } else {
      return Get.put(ClisitefController(), permanent: true);
    }
  }
}
