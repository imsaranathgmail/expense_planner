import 'package:expense_planner/features/expense_planner/presentation/common_widgets/const.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/model_bottom_sheet_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/widget_function.dart';
import 'package:expense_planner/features/expense_planner/presentation/drawer/drawer_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/bloc/income_expense_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/widgets/add_income_expense_type_widget.dart';
import 'package:expense_planner/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeExpenseTypeScreen extends StatelessWidget {
  static const id = 'IncomeSourceScreen';
  const IncomeExpenseTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        actions: [
          ModelBottomSheetWidget(
            childWidget: AddIncomeExpenseTypeWidget(
              incomeExpenseTypeEntity: null,
              isIncomeType: true,
            ),
            icon: const Icon(Icons.add_box),
            iconColor: Colors.greenAccent,
          ),
          ModelBottomSheetWidget(
            childWidget: AddIncomeExpenseTypeWidget(
              isIncomeType: false,
            ),
            icon: const Icon(Icons.add_box),
            iconColor: Colors.redAccent,
          ),
        ],
        iconTheme: const IconThemeData(color: AppColor.appBarIconThemeColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColor.gradientColor01,
              AppColor.gradientColor02,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: AppSizes.appBarHeight, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              BlocBuilder<IncomeExpenseBloc, IncomeExpenseState>(
                builder: (context, state) {
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Income Category',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        incomeExpenseListView(state.typeList, isIncome),
                        const SizedBox(height: 10),
                        const Text(
                          'Expense Category',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        incomeExpenseListView(state.typeList, isExpense),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}










// import 'package:expense_planner/features/expense_planner/presentation/common_widgets/const.dart';
// import 'package:expense_planner/features/expense_planner/presentation/common_widgets/model_bottom_sheet_widget.dart';
// import 'package:expense_planner/features/expense_planner/presentation/common_widgets/widget_function.dart';
// import 'package:expense_planner/features/expense_planner/presentation/drawer/drawer_widget.dart';
// import 'package:expense_planner/features/expense_planner/presentation/income_expense/bloc/income_expense_type/income_expense_type_bloc.dart';
// import 'package:expense_planner/features/expense_planner/presentation/income_expense/widgets/add_income_expense_type_widget.dart';
// import 'package:expense_planner/helper/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class IncomeExpenseTypeScreen extends StatelessWidget {
//   static const id = 'IncomeSourceScreen';
//   const IncomeExpenseTypeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       drawer: const DrawerWidget(),
//       appBar: AppBar(
//         actions: [
//           ModelBottomSheetWidget(
//             childWidget: AddIncomeExpenseTypeWidget(
//               incomeExpenseTypeEntity: null,
//               isIncomeType: true,
//             ),
//             icon: const Icon(Icons.add_box),
//             iconColor: Colors.greenAccent,
//           ),
//           ModelBottomSheetWidget(
//             childWidget: AddIncomeExpenseTypeWidget(
//               isIncomeType: false,
//             ),
//             icon: const Icon(Icons.add_box),
//             iconColor: Colors.redAccent,
//           ),
//         ],
//         iconTheme: const IconThemeData(color: AppColor.appBarIconThemeColor),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//             colors: [
//               AppColor.gradientColor01,
//               AppColor.gradientColor02,
//             ],
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.only(top: AppSizes.appBarHeight, left: 10, right: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 10),
//               BlocBuilder<IncomeExpenseTypeBloc, IncomeExpenseTypeState>(
//                 builder: (context, state) {
//                   if (state is IncomeExpenseTypeInitialState) {
//                     context.read<IncomeExpenseTypeBloc>().add(FetchIncomeExpenseTypeEvent());
//                   } else if (state is LoadingState) {
//                     return const CircularProgressIndicator();
//                   } else if (state is LoadedState) {
//                     final dataList = state.dataList;
//                     return Expanded(
//                       child: Column(
//                         children: [
//                           const Text('Manage Income Category',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               )),
//                           const SizedBox(height: 10),
//                           incomeExpenseListView(dataList, isIncome),
//                           const SizedBox(height: 10),
//                           const Text('Manage Expense Category',
//                               style: TextStyle(
//                                   fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
//                           const SizedBox(height: 10),
//                           incomeExpenseListView(dataList, isExpense),
//                         ],
//                       ),
//                     );
//                   }
//                   return Container();
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
