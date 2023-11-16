import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherio/features/feauter_home/presentation/bloc/home_bloc.dart';
import '../../../../../core/constrains/app_colors.dart';
import '../../../../../core/constrains/app_fonts.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  int dayDisplay = 0;
  int nextDay = 8 - DateTime.now().hour ~/ 3;
  Widget selected(Widget item) {
    return Container(
        width: 122.w,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: item);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292.w,
      height: 61,
      decoration: BoxDecoration(
          color: const Color(0xFF836CAA),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          dayDisplay == 0
              ? selected(
                  Center(
                    child: Text(
                      'Today',
                      style: AppFonts.poppins20W600
                          .copyWith(color: AppColors.purple),
                    ),
                  ),
                )
              : GestureDetector(
                  child: Text(
                    'Today',
                    style: AppFonts.poppins20W600,
                  ),
                  onTap: () {
                    setState(() {
                      dayDisplay = 0;
                      BlocProvider.of<HomeBloc>(context)
                          .add(TomoTodayEvent(dayDisplay));
                    });
                  },
                ),
          dayDisplay == 8
              ? selected(
                  Center(
                    child: Text(
                      'Tomorrow',
                      style: AppFonts.poppins20W600
                          .copyWith(color: AppColors.purple),
                    ),
                  ),
                )
              : GestureDetector(
                  child: Text(
                    'Tomorrow',
                    style: AppFonts.poppins20W600,
                  ),
                  onTap: () {
                    setState(() {
                      dayDisplay = nextDay;
                      BlocProvider.of<HomeBloc>(context)
                          .add(TomoTodayEvent(dayDisplay));
                    });
                  },
                ),
        ],
      ),
    );
  }
}
