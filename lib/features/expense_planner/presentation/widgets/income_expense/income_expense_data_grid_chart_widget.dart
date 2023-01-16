// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:expense_planner/core/helper/constants.dart';
import 'package:expense_planner/core/helper/currency_symbol_holder.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/income_expense/income_expense_bloc.dart';
import 'package:expense_planner/core/helper/list_map_function.dart';
import 'package:expense_planner/features/routing/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_type/income_expense_type_entity.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/app_ui_params.dart';

class IncomeExpenseDataGridChartWidget extends StatelessWidget {
  int isIncomeCat;
  List<MapEntry<String, dynamic>> filteredMap;
  double? totalIncome;
  IncomeExpenseDataGridChartWidget({
    Key? key,
    required this.isIncomeCat,
    required this.filteredMap,
    this.totalIncome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 2) - 15,
      height: (MediaQuery.of(context).size.height - AppSizes.appBarHeight - 75),
      child: GridView(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        children: filteredMap.map(
          (value) {
            // print(value);
            List<ChartData> chartData = [];
            var typeName = 'Income Type';

            final list = BlocProvider.of<IncomeExpenseBloc>(context).state.typeList;
            typeName = List<IncomeExpenseTypeEntity>.from(list)
                .where((element) => element.id == value.key)
                .first
                .typeName;

            chartData.add(ChartData(typeName, double.parse(value.value.toString())));
            // chartData.add(ChartData(value['typeName'], value['totAmount'].toDouble()));

            return Stack(
              children: [
                Card(
                  elevation: 5,
                  color:
                      isIncomeCat == isIncome ? AppColor.gradientColor01 : AppColor.gradientColor02,
                  child: SfCircularChart(
                    series: <CircularSeries>[
                      RadialBarSeries<ChartData, String>(
                        maximumValue: totalIncome ?? 0,
                        cornerStyle: CornerStyle.endCurve,
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        radius: '70%',
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 20,
                  child: Text(typeName,
                      style: const TextStyle(
                          fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                Positioned(
                  bottom: 15,
                  left: 20,
                  child: Text('${CurrencySymbolHolder.currencySymbol} ${value.value}',
                      style: const TextStyle(
                          fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      Routes.incomeExpenseDataScreen,
                      arguments: [value.key, value.value, typeName, isIncomeCat],
                    ),
                    child: const Icon(
                      Icons.more_horiz,
                      size: 35,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y,
  );
  final String x;
  final double y;
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