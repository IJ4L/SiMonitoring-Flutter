import 'package:intl/intl.dart';

String dateFromat() {
  DateTime currentTime = DateTime.now();
  String formattedDate =
      DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(currentTime);

  return formattedDate;
}
