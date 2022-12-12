import 'package:flutter/material.dart';

import '../../../utils/color.dart';

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
          Text("Boadring Page 2"),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Orgonaize your tasks",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.black),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "You can organize your daily tasks by\n adding your tasks into separate categories",
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
