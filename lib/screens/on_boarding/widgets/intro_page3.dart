import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          SizedBox(
            height: 16.h,
          ),
          const Text(
            "Chat with clients",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.black),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            "You can chat with clients and with your consumer",
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.black),
            textAlign: TextAlign.center,
          ),
        ],
      )),
    );
  }
}
