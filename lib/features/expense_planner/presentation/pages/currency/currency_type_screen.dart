// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expense_planner/core/language/language_constants.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/currency/currency_type_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_planner/core/extentions/app_extentions.dart';

import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/app_ui_params.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/model_bottom_sheet_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/currency/add_currency_type_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/pages/drawer/drawer_widget.dart';

class CurrencyTypeScreen extends StatelessWidget {
  // static const id = 'CurrencyTypeScreen';
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
              Text(LanguageConstants.manageCurrencyTypes.t(context),
                  style: const TextStyle(fontSize: 20, color: Colors.white)),
              const SizedBox(height: 10),
              BlocBuilder<CurrencyTypeBloc, CurrencyTypeState>(
                builder: (context, state) {
                  if (state is CurrencyLoadedState) {
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
                  } else if (state is ErrorState) {
                    return MessageWidget(
                      message: state.message,
                    );
                    // print(state.message);
                    // DialogWidget.showDialogBox(
                    //     context, Colors.red, false, warningTitle, state.message);
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
