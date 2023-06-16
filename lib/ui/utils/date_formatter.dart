import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

String dateFromat() {
  DateTime currentTime = DateTime.now();
  String formattedDate =
      DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(currentTime);

  return formattedDate;
}

String formatTanggal(DateTime tanggal) {
  String tanggalString = DateFormat('yyyy-MM-dd').format(tanggal);
  return tanggalString;
}

int getJumlahTanggal() {
  String formattedDate = DateFormat('yyyy-MM').format(DateTime.now());
  DateTime parsedDate = DateFormat('yyyy-MM').parse(formattedDate);
  int numberOfDays = DateTime(parsedDate.year, parsedDate.month + 1, 0).day;
  return numberOfDays;
}

List<String> getDaysOfMonth() {
  List<String> daysList = [];

  initializeDateFormatting('id_ID', null);

  DateTime now = DateTime.now();
  DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);

  for (int i = 0; i < 45; i++) {
    DateTime nextDate = firstDayOfMonth.add(Duration(days: i));
    String formattedDay = DateFormat('EEEE', 'id_ID').format(nextDate);
    daysList.add(formattedDay);
  }

  return daysList;
}
