import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        height: 110.h,
        margin: EdgeInsets.symmetric(horizontal: 8.h, vertical: 5.w),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(width: 1.w, color: AppColors.black),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                img,
                height: 200,
                width: 150.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Doge Chalanger",
                  style: AppTextStyle.sfProMedium.copyWith(fontSize: 18.sp),
                ),
                Row(
                  children: [
                    Text(
                      "Sell",
                      style: AppTextStyle.sfProRegular
                          .copyWith(fontSize: 16.sp, color: AppColors.black),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Boosted 40s",
                      style: AppTextStyle.sfProRegular
                          .copyWith(fontSize: 16.sp, color: AppColors.black),
                    ),
                  ],
                ),
                Text(
                  "300 000 USD",
                  style: AppTextStyle.sfProBold.copyWith(fontSize: 18.sp),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 110.w,
                    ),
                    const Icon(Icons.chat_bubble_outline_outlined),
                    const Icon(Icons.favorite_border),
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
