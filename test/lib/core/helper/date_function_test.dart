import 'package:expense_planner/core/helper/date_function.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DateTime dateTime;
  late String expectDate;
  setUp(() {
    dateTime = DateTime.now();
    expectDate = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  });
  test('should return new date format as d/m/YYYY', () async {
    //arrange
    final result = DatesFunction.dateConvertor(dateTime);
    //act
    expect(result, expectDate);
    //assert
  });
}
