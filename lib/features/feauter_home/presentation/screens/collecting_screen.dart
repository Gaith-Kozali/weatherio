import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherio/core/constrains/global_things.dart';
import 'package:weatherio/features/feauter_home/domain/entities/weather.dart';
import '../../../../core/constrains/app_colors.dart';
import '../../../../core/constrains/images_path.dart';
import '../bloc/home_bloc.dart';
import 'details_screen.dart';
import 'home_screen.dart';

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
    HomeScreen ()
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
        }
        if (state is WaitState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.purple,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
      listener: (context, state) {
        if (state is ErrorState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(state.message),
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
      },
    );
  }
}
