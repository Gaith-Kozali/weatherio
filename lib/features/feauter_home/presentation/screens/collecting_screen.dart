import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherio/core/constrains/global_things.dart';
import 'package:weatherio/features/feauter_home/domain/entities/weather.dart';
import '../../../../core/constrains/app_colors.dart';
import '../../../../core/constrains/images_path.dart';
import '../../../feauter_ai_system/presentation/screens/ai_system.dart';
import '../../../feauter_search/presentation/screens/search_screens.dart';
import 'home_screen.dart';

List<Weather> weather = [];
int dayDisplay = 0;

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
    AiSystemScreen(),
    SearchScreens(),
    HomeScreen(),
    HomeScreen()
  ];

  Widget get _buttonNav => Positioned(
      bottom: 10.h,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          currentScreen == 0
              ? selectedBottomNavigation(
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
              ? selectedBottomNavigation(SvgPicture.asset(ImagesPath.bootIcon))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = 1;
                    });
                  },
                  icon: SvgPicture.asset(ImagesPath.bootIcon)),
          currentScreen == 2
              ? selectedBottomNavigation(const Icon(
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
              ? selectedBottomNavigation(SvgPicture.asset(
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
              ? selectedBottomNavigation(SvgPicture.asset(
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
    return Scaffold(
      body: SafeArea(
          child:
              Stack(children: [screen.elementAt(currentScreen), _buttonNav])),
    );
  }
}
