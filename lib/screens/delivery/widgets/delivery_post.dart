import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/color.dart';
import '../../../utils/style.dart';

class DeliveryPost extends StatelessWidget {
  const DeliveryPost({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 80.h,
        margin: EdgeInsets.symmetric(horizontal: 8.h, vertical: 5.w),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(width: 1.w, color: AppColors.black),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr('location'),
                  style: AppTextStyle.sfProMedium.copyWith(fontSize: 18.sp),
                ),
                Text(
                  "Oybek ${tr("street")}",
                  style: AppTextStyle.sfProRegular.copyWith(fontSize: 16.sp),
                ),
                Text(
                  "${tr("building")} 16D",
                  style: AppTextStyle.sfProRegular.copyWith(fontSize: 16.sp),
                ),
              ],
            ),
            SizedBox(
              width: 26.w,
            ),
            Column(
              children: [
                Text(
                  "2",
                  style: AppTextStyle.sfProBold.copyWith(fontSize: 32.sp),
                ),
                Text(
                  tr('km_away'),
                  style: AppTextStyle.sfProBold.copyWith(fontSize: 20.sp),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            const Icon(
              CupertinoIcons.forward,
              size: 60,
            )
          ],
        ),
      ),
    );
  }
}
