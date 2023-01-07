// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:expense_planner/features/expense_planner/presentation/common_bloc/common_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/currency/bloc/currency_type_bloc.dart';

import 'package:expense_planner/features/expense_planner/presentation/dashboard.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/bloc/income_expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expense_planner/features/routing/app_router.dart';

import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CommonBloc>(
          create: (context) => sl<CommonBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<CurrencyTypeBloc>(),
          // child: Container(),
        ),
        BlocProvider(
          create: (context) => sl<IncomeExpenseBloc>(),
          // child: Container(),
        ),
        BlocProvider(
          create: (context) => sl<IncomeExpenseBloc>(),
          // child: Container(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DashboardScreen(),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
// / void main() => runApp(
//       DevicePreview(
//         builder: (context) => const MyApp(), // Wrap your app
//       ),
//     );

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       useInheritedMediaQuery: true,
//       locale: DevicePreview.locale(context),
//       builder: DevicePreview.appBuilder,
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const Dashboard(),
//     );
//   }
// }


