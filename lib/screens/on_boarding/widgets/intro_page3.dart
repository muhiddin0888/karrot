import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/color.dart';
import '../../../utils/icon.dart';

class IntorPage3 extends StatelessWidget {
  const IntorPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(AppIcon.boarding3),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Chat with clients",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.black),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "You can chat with clients and with your consumer",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.black),
            textAlign: TextAlign.center,
          ),
        ],
      )),
    );
  }
}
