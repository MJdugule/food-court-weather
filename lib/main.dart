import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_weather/app/app.locator.dart';
import 'package:food_weather/app/app.router.dart';
import 'package:food_weather/core/constants/app_colors.dart';
import 'package:food_weather/core/models/weather.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
   Hive.registerAdapter(WeatherModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 884),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: kAppName,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.kGrey,
          primarySwatch: Colors.red,
        ),
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
      ),
    );
  }
}
