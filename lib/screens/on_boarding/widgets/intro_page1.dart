import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:phone_otp_ui/utils/icon.dart';

import '../../../utils/color.dart';

class IntorPage1 extends StatelessWidget {
  const IntorPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(AppIcon.boarding1),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Send Your packages easily",
              style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.black),
            ),
            SizedBox(
              height: 42.h,
            ),
            Text(
              "You can easily find person to send your packages to one country to another country, search best option to send your packages your city",
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )),
    );
  }
}
