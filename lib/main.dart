import 'package:flutter/material.dart';
import 'package:weatherio/feauters/feauter_splash/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherio/feauters/feauter_home/presentation/widgets/details/details_button.dart';
import 'feauters/feauter_home/presentation/screens/collecting_screen.dart';
import 'feauters/feauter_home/presentation/screens/details_screen.dart';
import 'feauters/feauter_home/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              DetailsScreen.route: (context) => const DetailsScreen(),
              CollectingScreen.route:(context) => const CollectingScreen()
            },
            home:  const SplashScreen());
      },
    );
  }
}
