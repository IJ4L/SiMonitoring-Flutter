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
