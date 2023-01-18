// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:expense_planner/core/language/languages_list.dart';
import 'package:expense_planner/features/expense_planner/presentation/app_localization/app_localization.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/common_bloc/common_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/currency/currency_type_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/income_expense/income_expense_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/language/language_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/pages/dashboard/dashboard.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expense_planner/features/routing/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/helper/di/injection_container.dart' as di;
import 'core/helper/di/injection_container.dart';

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
        BlocProvider(
          create: (context) => sl<LanguageBloc>(),
          // child: Container(),
        ),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              supportedLocales: LanguagesList.languages.map((e) => Locale(e.code)).toList(),
              locale: state.locale,
              localizationsDelegates: const [
                AppLocalization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              home: const DashboardScreen(),
              onGenerateRoute: appRouter.onGenerateRoute,
            );
          }
          return const SizedBox.shrink();
        },
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


