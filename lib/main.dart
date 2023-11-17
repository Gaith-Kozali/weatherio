// Gaith kozali

// build feature home and collecting screen and details screen
// and home screen  and feature splash screen
// and check connection of internet and store data
// in cache memory to get it if no internet connection
// and tell the user if have error in connection or don't have internet
// and handle the api and dependency injection and core folder
// make button to choose the user city in any location in the world and show the information
// and the clean architecture

// bakri

// make the feature_ai_system and feature_search and feature_daysforcast

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherio/features/feauter_home/presentation/bloc/home_bloc.dart';
import 'package:weatherio/features/feauter_splash/splash_screen.dart';
import 'core/initialize_object/initialize_home.dart';
import 'features/feature_daysforcast/presentation/screens/home_dayforcast.dart';
import 'features/feauter_home/presentation/screens/collecting_screen.dart';
import 'features/feauter_home/presentation/screens/details_screen.dart';
import 'features/feauter_home/presentation/widgets/home/home_appbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitializeHome().injection();
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
        return BlocProvider(
          create: (context) => sl<HomeBloc>()..add(GetWeatherEvent(cityName)),
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              routes: {
                DetailsScreen.route: (context) => const DetailsScreen(),
                CollectingScreen.route: (context) => const CollectingScreen(),
                HomeDayForCast.route: (context) => const HomeDayForCast()
              },
              home: const SplashScreen()),
        );
      },
    );
  }
}
