import 'package:flutter/material.dart';

import '../../../utils/color.dart';

class IntorPage1 extends StatelessWidget {
  const IntorPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text("Boadring Page 1"),
          SizedBox(
            height: 16,
          ),
          Text(
            "Manage your tasks",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.black),
          ),
          SizedBox(
            height: 42,
          ),
          Text(
            "You can easily manage all of your daily\n tasks in DoMe for free",
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
