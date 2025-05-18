import 'package:intl/intl.dart';
class DatedTime{
 static  String? formattedDate;
 static String? formattedTime;
  static void updateDateTime() {
    DateTime now = DateTime.now();

    formattedDate = DateFormat('d EEE y').format(now); // e.g., 1 Mon 2025
    formattedTime = DateFormat('hh:mm:ss a').format(now); // e.g., 02:35:00 PM
  }
}