import 'package:flutter/material.dart';

import '../../../utils/color.dart';

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
          Text("Boadring Page 2"),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Create daily routine",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.black),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "In Uptodo  you can create your\n personalized routine to stay productive",
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
