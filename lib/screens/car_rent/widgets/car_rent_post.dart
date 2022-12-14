import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp_ui/utils/icon.dart';

import '../../../utils/color.dart';
import '../../../utils/style.dart';

class CarRentPost extends StatelessWidget {
  const CarRentPost({super.key, required this.onTap, required this.img});
  final VoidCallback onTap;
  final String img;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 110,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.black),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                img,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Doge Chalanger",
                  style: AppTextStyle.sfProMedium.copyWith(fontSize: 18),
                ),
                Row(
                  children: [
                    Text(
                      "Sell",
                      style: AppTextStyle.sfProRegular
                          .copyWith(fontSize: 16, color: AppColors.black),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Boosted 40s",
                      style: AppTextStyle.sfProRegular
                          .copyWith(fontSize: 16, color: AppColors.black),
                    ),
                  ],
                ),
                Text(
                  "300 000 USD",
                  style: AppTextStyle.sfProBold.copyWith(fontSize: 18),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    SizedBox(
                      width: 130,
                    ),
                    Icon(Icons.chat_bubble_outline_outlined),
                    Icon(Icons.favorite_border),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
