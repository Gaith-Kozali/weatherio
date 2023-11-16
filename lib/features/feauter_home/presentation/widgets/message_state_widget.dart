import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constrains/app_colors.dart';
import '../../../../core/constrains/app_fonts.dart';
import '../bloc/home_bloc.dart';

noInterMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text("no internet connected",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
    backgroundColor: Colors.redAccent,
  ));
}

Widget noDataAndInternet(BuildContext context, String message) {
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
              textAlign: TextAlign.center,
            ))
      ],
    )),
  );
}

errorMessage(BuildContext context, String message) {
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


Widget waitingWidget(){
  return const Center(
    child: CircularProgressIndicator(
      color: AppColors.purple,
    ),
  );

}