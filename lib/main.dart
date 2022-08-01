import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:proj2_bmi/data/db_helper.dart';
import 'package:proj2_bmi/provider/db_provider.dart';
import 'package:proj2_bmi/view/screen/calculator_screen.dart';
import 'package:proj2_bmi/view/screen/history_screen.dart';
import 'package:proj2_bmi/view/screen/main_screen.dart';
import 'package:proj2_bmi/view/screen/splash_screen.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp( EasyLocalization(
      supportedLocales: [Locale('en'),Locale('ar'),],
      path: 'asset/langs',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<DbProvider>(create: (context)=>DbProvider())],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          '/splach_screen':(context)=>SplashScreen(),
          '/main_screen':(context)=>MainScreen(),
          '/calculator_screen':(context)=>CalculatorScreen(),
          '/history_screen':(context)=>HistoryScreen(),

        },
      ),
    );
  }
}
