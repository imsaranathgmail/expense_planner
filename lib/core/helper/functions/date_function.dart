import 'package:intl/intl.dart';

class DatesFunction {
  DatesFunction._();

  static String dateConvertor(DateTime dateTime) {
    // String selectedDate = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    String selectedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    // print(DateFormat('yyyy-MM-dd').format(dateTime));
    return selectedDate;
  }
}
