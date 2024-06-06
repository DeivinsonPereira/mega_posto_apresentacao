import '../enum/response_status_qrcode.dart';

class ResponseConditions {

  static bool isCreated(String message) {
    return message == ResponseStatusQrcode.CREATED.value;
  }

  static bool isApproved(String message) {
    return message == ResponseStatusQrcode.APPROVED.value;
  }

  static bool isExpired(String message) {
    return message == ResponseStatusQrcode.EXPIRED.value;
  } 

  static bool isTimeOut(String message) {
    return message == 'TIMEOUT';
  }
}