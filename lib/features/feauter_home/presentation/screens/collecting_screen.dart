import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherio/core/constrains/app_fonts.dart';
import 'package:weatherio/core/constrains/global_things.dart';
import 'package:weatherio/features/feauter_home/domain/entities/weather.dart';
import '../../../../core/constrains/app_colors.dart';
import '../../../../core/constrains/images_path.dart';
import '../bloc/home_bloc.dart';
import 'home_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

List<Weather> weather = [];

class CollectingScreen extends StatefulWidget {
  const CollectingScreen({Key? key}) : super(key: key);
  static String route = "CollectingScreen";
  @override
  State<CollectingScreen> createState() => _CollectingScreenState();
}

class _CollectingScreenState extends State<CollectingScreen> {
  int currentScreen = 0;
  List<Widget> screen = const [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen()
  ];

  Widget get buttonNav => Positioned(
      bottom: 10.h,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          currentScreen == 0
              ? selected(
                  const Icon(Icons.home, color: Colors.white),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = 0;
                    });
                  },
                  icon: const Icon(
                    Icons.home,
                    color: AppColors.white,
                  )),
          currentScreen == 1
              ? selected(SvgPicture.asset(ImagesPath.bootIcon))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = 1;
                    });
                  },
                  icon: SvgPicture.asset(ImagesPath.bootIcon)),
          currentScreen == 2
              ? selected(const Icon(
                  Icons.search,
                  color: Colors.white,
                ))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = 2;
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.white,
                  )),
          currentScreen == 3
              ? selected(SvgPicture.asset(
                  ImagesPath.accountIcon,
                ))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = 3;
                    });
                  },
                  icon: SvgPicture.asset(
                    ImagesPath.accountIcon,
                  )),
          currentScreen == 4
              ? selected(SvgPicture.asset(
                  ImagesPath.alertIcon,
                ))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = 4;
                    });
                  },
                  icon: SvgPicture.asset(
                    ImagesPath.alertIcon,
                  ))
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is GetWeatherState || state is ErrorState) {
          weather = state is GetWeatherState ? state.weather : weather;
          return Scaffold(
            body: SafeArea(
                child: Stack(
                    children: [screen.elementAt(currentScreen), buttonNav])),
          );
        } else if (state is WaitState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.purple,
            ),
          );
        } else if (state is NoDataAndInterState) {
          return _noDataAndInternet(context, state.message);
        } else {
          return const SizedBox();
        }
      },
      listener: (context, state) {
        if (state is ErrorState) {
          _errorMessage(context, state.message);
        } else if (state is GetWeatherState && state.isConnect == false) {
          _noInterMessage(context);
        }
      },
    );
  }
}

_errorMessage(BuildContext context, String message) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(message),
        backgroundColor: AppColors.white,
        icon: const Icon(Icons.dangerous_outlined, color: Colors.red),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Try later",
              style: TextStyle(color: AppColors.purple),
            ),
          )
        ],
      );
    },
  );
}

_noInterMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text("no internet connected",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
    backgroundColor: Colors.redAccent,
  ));
}

Widget _noDataAndInternet(BuildContext context, String message) {
  return Scaffold(
    body: SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message,
            style: AppFonts.poppins20W600.copyWith(color: AppColors.purple)),
        OutlinedButton(
            onPressed: () {
              BlocProvider.of<HomeBloc>(context)
                  .add(GetWeatherEvent("Damascus"));
            },
            child: Text(
              "try again please",
              style: AppFonts.poppins20W600.copyWith(color: AppColors.purple),
            ))
      ],
    )),
  );
}
