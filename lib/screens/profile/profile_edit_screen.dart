import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_otp_ui/utils/icon.dart';

import '../../utils/color.dart';
import '../../utils/style.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: AppTextStyle.sfProBlack.copyWith(
            color: AppColors.black,
            fontSize: 24.sp,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: AppColors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        AppIcon.carRent1,
                        width: 100.w,
                        height: 100.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        top: 80,
                        left: 60,
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_alt,
                            size: 34,
                            color: AppColors.defaultKarrot,
                          ),
                          onPressed: () {},
                        ))
                  ],
                ),
              ),
              Text(
                "Full Name",
                style: AppTextStyle.sfProMedium.copyWith(fontSize: 16.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Name",
                    suffixIcon: Icon(Icons.done)),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Phone Number",
                style: AppTextStyle.sfProMedium.copyWith(fontSize: 16.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "+998 99 999 99 99",
                    suffixIcon: Icon(Icons.done)),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Container(
                    width: 350.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.defaultKarrot,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Save Changes',
                        style: AppTextStyle.sfProMedium
                            .copyWith(fontSize: 18.sp, color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }
}
