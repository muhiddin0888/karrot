import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/color.dart';
import '../../../utils/icon.dart';

class IntorPage2 extends StatelessWidget {
  const IntorPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(AppIcon.boarding2),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Find your own car",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.black),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Now it is easy to find car, you ca also post to sell your car gan give a rent",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      )),
    );
  }
}
