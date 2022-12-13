import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        "Profile",
        style: AppTextStyle.sfProBlack.copyWith(
          color: AppColors.black,
          fontSize: 24,
        ),
      ),
      backgroundColor: AppColors.white,
    ));
  }
}
