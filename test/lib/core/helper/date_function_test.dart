import 'package:expense_planner/core/helper/functions/date_function.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  late DateTime dateTime;
  late String expectDate;
  setUp(() {
    dateTime = DateTime.now();
    expectDate = DateFormat('yyyy-MM-dd').format(dateTime);
  });
  test('should return new date format as yyyy-MM-dd', () async {
    //arrange
    final result = DatesFunction.dateConvertor(dateTime);
    //act
    expect(result, expectDate);
    //assert
  });
}
