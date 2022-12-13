import 'package:flutter/material.dart';
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
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Send Your packages easily",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.black),
            ),
            const SizedBox(
              height: 42,
            ),
            const Text(
              "You can easily find person to send your packages to one country to another country, search best option to send your packages your city",
              style: TextStyle(
                  fontSize: 15,
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
