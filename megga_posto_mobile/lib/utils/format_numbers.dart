import 'package:intl/intl.dart';

abstract class FormatNumbers {
  static String formatNumbertoString(double? number) {
    return NumberFormat('###,###,###,##0.00', 'pt_BR').format(number);
  }

  static double formatStringToDouble(String number) {
    return double.parse(number.replaceAll('.', '').replaceAll(',', '.'));
  }

  static String formatSingleDigit(int number) {
    return number < 10 ? "0$number" : number.toString();
  }
}
