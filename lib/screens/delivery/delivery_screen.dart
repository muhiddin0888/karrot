import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp_ui/utils/color.dart';
import 'package:phone_otp_ui/utils/style.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      centerTitle: true,
      title: Text(
        "Delivery",
        style: AppTextStyle.sfProBlack.copyWith(
          color: AppColors.black,
          fontSize: 24,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: AppColors.black,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: AppColors.black,
            )),
      ],
      backgroundColor: AppColors.white,
    ));
  }
}
