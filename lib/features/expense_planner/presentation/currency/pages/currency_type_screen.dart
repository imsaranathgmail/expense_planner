import 'package:expense_planner/features/expense_planner/presentation/common_widgets/const.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/model_bottom_sheet_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/currency/bloc/currency_type_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/currency/widgets/add_currency_type_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyTypeScreen extends StatelessWidget {
  static const id = 'CurrencyTypeScreen';
  const CurrencyTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) {
              final state = context.watch<CurrencyTypeBloc>().state;
              if (state.currencyList.isNotEmpty) {
                return const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.add_box),
                  color: Colors.amber,
                );
              } else {
                return ModelBottomSheetWidget(
                  childWidget: AddCurrencyTypeWidget(currencyTypeEntity: null),
                  icon: const Icon(Icons.add_box),
                  iconColor: Colors.amber,
                );
              }
            },
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
              const Text('Manage Curency Types',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              const SizedBox(height: 10),
              BlocBuilder<CurrencyTypeBloc, CurrencyTypeState>(
                builder: (context, state) {
                  if (state.currencyList.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.currencyList.length,
                        itemBuilder: (context, index) {
                          final dataList = state.currencyList;
                          return Card(
                            elevation: 5,
                            color: AppColor.gradientColor01,
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading:
                                  const Icon(Icons.read_more, size: 40, color: Colors.greenAccent),
                              title: Text(
                                  '${dataList[index].currencyName} - ${dataList[index].currencySymbol}',
                                  style: const TextStyle(fontSize: 18, color: Colors.white)),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: ModelBottomSheetWidget(
                                      childWidget: AddCurrencyTypeWidget(
                                          currencyTypeEntity: dataList[index]),
                                      icon: const Icon(Icons.edit),
                                      iconColor: Colors.redAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
