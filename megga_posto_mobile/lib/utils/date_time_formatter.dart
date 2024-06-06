import 'package:intl/intl.dart';

abstract class DatetimeFormatter {
  static String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatHour(DateTime date) {
    return DateFormat('HH:mm:ss').format(date);
  }

  // Transforma o date time em data e hora assim 20/03/2024 - 19:59:00 somando quantidade de minutos definida
  static String getDataHoraOptionalPlusMinutes(DateTime date,
      {int minutes = 0}) {
    return DateFormat('dd/MM/yyyy - HH:mm:ss')
        .format(date.add(Duration(minutes: minutes)));
  }

  static String getDataPlusDays(DateTime date, int days) {
    return DateFormat('dd/MM/yyyy').format(date.add(Duration(days: days)));
  }

  static String getData(String dataHora) {
    DateTime dt = DateTime.parse(dataHora);
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
  }

  static String getHora(String dataHora) {
    DateTime dt = DateTime.parse(dataHora);
    return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}:${dt.second.toString().padLeft(2, '0')}';
  }

  // Transforma datetime para esse padrão 2024-07-01T16:15:00.000Z
  static String formatDateAndHour(DateTime time) {
    var formatter = DateFormat('yyyy-MM-ddTHH:mm:ss.SSS');
    String formatted = '${formatter.format(time)}Z';
    return formatted;
  }
}
