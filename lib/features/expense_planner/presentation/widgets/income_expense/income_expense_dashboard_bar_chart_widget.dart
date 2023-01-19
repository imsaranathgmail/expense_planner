// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:collection/collection.dart';
import 'package:expense_planner/core/extentions/app_extentions.dart';
import 'package:expense_planner/core/language/language_constants.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/income_expense/income_expense_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/chart_data/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/app_ui_params.dart';

class IncomeExpenseDashboardBarChartWidget extends StatelessWidget {
  // int isIncomeCat;
  // List<MapEntry<String, dynamic>> filteredMap;
  // double? totalIncome;

  const IncomeExpenseDashboardBarChartWidget({
    Key? key,
    // required this.isIncomeCat,
    // required this.filteredMap,
    // this.totalIncome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (MediaQuery.of(context).size.height - AppSizes.appBarHeight) / 3,
      child: BlocBuilder<IncomeExpenseBloc, IncomeExpenseState>(
        builder: (context, state) {
          List<ColumnChartData> chartData = [];
          double maxAmount = 0.0;
          final dateTime = DateTime.now();
          final dataList = state.dataList;
          List.generate(7, (index) {
            final weekDay =
                DateFormat('yyyy-MM-dd').format(dateTime.subtract(Duration(days: index)));
            final data = dataList.where((element) => element.addDate.contains(weekDay)).toList();

            final dataMap = data.groupFoldBy<String, double>(
                (element) => '${element.isIncome}',
                (previous, element) => (previous != null
                    ? previous += double.parse(element.amount)
                    : double.parse(element.amount)));
            final dayString = DateFormat('EEEE').format(DateTime.parse(weekDay)).substring(0, 3);
            // print(data.reversed);
            // print('------------------------------------------------------------------------------');
            // print(dataMap);
            // print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
            chartData.add(ColumnChartData(dayString, dataMap['1'] ?? 0, dataMap['0'] ?? 0));

            // if (dataMap['1'] != null && dataMap['0'] != null) {
            //   maxAmount = (dataMap['1']!.toDouble() > dataMap['0']!.toDouble())
            //       ? dataMap['1']!.toDouble()
            //       : dataMap['0']!.toDouble();
            // } else if (dataMap['1'] != null) {
            //   maxAmount = dataMap['1']!.toDouble();
            // } else if (dataMap['0'] != null) {
            //   maxAmount = dataMap['0']!.toDouble();
            // }

            if (dataMap['1'] != null) {
              if (dataMap['1']! > maxAmount) {
                maxAmount = dataMap['1']!;
              }
            } else if (dataMap['0'] != null) {
              if (dataMap['0']! > maxAmount) {
                maxAmount = dataMap['1']!;
              }
            }
          });

          return Stack(
            children: [
              Card(
                elevation: 5,
                color: AppColor.gradientColor01,
                child: SfCartesianChart(
                  legend: Legend(isVisible: true, position: LegendPosition.bottom),
                  plotAreaBackgroundColor: Colors.red.withOpacity(0.3),
                  backgroundColor: Colors.white.withOpacity(0.7),
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis: NumericAxis(minimum: 0, maximum: maxAmount, interval: 2000),
                  series: <ChartSeries<ColumnChartData, String>>[
                    ColumnSeries<ColumnChartData, String>(
                      dataSource: chartData.reversed.toList(),
                      xValueMapper: (ColumnChartData data, _) => data.day,
                      yValueMapper: (ColumnChartData data, _) => data.income,
                      name: LanguageConstants.income.t(context),
                      color: AppColor.gradientColor01,
                      isVisibleInLegend: true,
                    ),
                    ColumnSeries<ColumnChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ColumnChartData data, _) => data.day,
                      yValueMapper: (ColumnChartData data, _) => data.expense,
                      name: LanguageConstants.expense.t(context),
                      color: AppColor.gradientColor02,
                      isVisibleInLegend: true,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


























// GridView.builder(
//         padding: EdgeInsets.zero,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemCount: filteredMap.length,
//         itemBuilder: (context, index) {
//           List<ChartData> chartData = [];
//           return Stack(
//             children: [
//               Card(
//                 elevation: 5,
//                 color: AppColor.gradientColor01,
//                 child: SfCircularChart(
//                   series: <CircularSeries>[
//                     RadialBarSeries<ChartData, String>(
//                       maximumValue: 250,
//                       cornerStyle: CornerStyle.endCurve,
//                       dataSource: chartData,
//                       xValueMapper: (ChartData data, _) => data.x,
//                       yValueMapper: (ChartData data, _) => data.y,
//                       radius: '70%',
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: 15,
//                 left: 20,
//                 child: Text('', style: TextStyle(fontSize: 13, color: Colors.white)),
//               ),
//               const Positioned(
//                 bottom: 15,
//                 left: 20,
//                 child: Text('', style: TextStyle(fontSize: 13, color: Colors.white)),
//               ),
//               Positioned(
//                 right: 5,
//                 bottom: 5,
//                 child: GestureDetector(
//                   onTap: () => Navigator.of(context).pushReplacementNamed(IncomeDetialsScreen.id),
//                   child: const Icon(
//                     Icons.more_horiz,
//                     size: 35,
//                     color: Colors.amber,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),