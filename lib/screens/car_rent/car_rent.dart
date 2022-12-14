import 'package:flutter/material.dart';
import 'package:phone_otp_ui/screens/car_rent/widgets/car_rent_post.dart';
import 'package:phone_otp_ui/utils/icon.dart';

import '../../utils/color.dart';
import '../../utils/style.dart';

class CarRentScreen extends StatelessWidget {
  const CarRentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Car Rent",
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
            ),
          ),
        ],
        backgroundColor: AppColors.white,
      ),
      body: ListView(children: [
        CarRentPost(
          onTap: () {},
          img: AppIcon.carRent1,
        ),
        CarRentPost(
          onTap: () {},
          img: AppIcon.carRent2,
        ),
        CarRentPost(
          onTap: () {},
          img: AppIcon.carRent1,
        ),
        CarRentPost(
          onTap: () {},
          img: AppIcon.carRent2,
        ),
        CarRentPost(
          onTap: () {},
          img: AppIcon.carRent1,
        ),
        CarRentPost(
          onTap: () {},
          img: AppIcon.carRent2,
        ),
        CarRentPost(
          onTap: () {},
          img: AppIcon.carRent1,
        ),
        CarRentPost(
          onTap: () {},
          img: AppIcon.carRent2,
        ),
        CarRentPost(
          onTap: () {},
          img: AppIcon.carRent1,
        ),
      ]),
    );
  }
}
