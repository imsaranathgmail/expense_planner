class DatesFunction {
  DatesFunction._();

  static String dateConvertor(DateTime dateTime) {
    String selectedDate = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    print(selectedDate);
    return selectedDate;
  }
}
