import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_otp_ui/utils/constants.dart';
import 'package:phone_otp_ui/utils/icon.dart';
import '../../data/local_data/storage.dart';
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
            fontSize: 24.sp,
          ),
        ),
        backgroundColor: AppColors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    AppIcon.carRent2,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Profile",
                      style: AppTextStyle.sfProMedium.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      "+998 99 999 99 99",
                      style: AppTextStyle.sfProRegular.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20.w,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.black),
                    child: Row(children: [
                      Text(
                        "Edit Profile",
                        style: AppTextStyle.sfProMedium
                            .copyWith(color: AppColors.white),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      const Icon(
                        CupertinoIcons.slider_horizontal_3,
                        color: AppColors.white,
                        size: 24,
                      )
                    ]),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Settings",
                  style: AppTextStyle.sfProBold.copyWith(fontSize: 20.sp),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        children: [
                          Icon(CupertinoIcons.flag_circle),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "Language",
                            style: AppTextStyle.sfProRegular
                                .copyWith(fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  "About Us",
                  style: AppTextStyle.sfProBold.copyWith(fontSize: 20.sp),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.question_mark_outlined),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "FAQ",
                            style: AppTextStyle.sfProRegular
                                .copyWith(fontSize: 16.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        children: [
                          Icon(Icons.privacy_tip),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "Privacy Policy",
                            style: AppTextStyle.sfProRegular
                                .copyWith(fontSize: 16.sp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.people),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "Contact Us",
                            style: AppTextStyle.sfProRegular
                                .copyWith(fontSize: 16.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      GestureDetector(
                        onTap: () async {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title:
                                      const Text("You really want to logout"),
                                  content: SizedBox(
                                    height: 110.h,
                                    width: 110.w,
                                    child: Container(
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                await StorageRepository
                                                    .deleteBool("isLogged");
                                                await StorageRepository
                                                    .deleteString(
                                                        "phone_number");
                                                await StorageRepository
                                                    .deleteString(
                                                        "access_token");
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        otp,
                                                        (Route<dynamic>
                                                                route) =>
                                                            false);
                                              },
                                              child: Container(
                                                width: 250.w,
                                                height: 50.h,
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColors.defaultKarrot,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Yes, I am sure',
                                                    style: AppTextStyle
                                                        .sfProMedium
                                                        .copyWith(
                                                            fontSize: 18.sp,
                                                            color: AppColors
                                                                .white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                width: 250.w,
                                                height: 50.h,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: AppColors
                                                          .defaultKarrot),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'No, go back',
                                                    style: AppTextStyle
                                                        .sfProMedium
                                                        .copyWith(
                                                            fontSize: 18.sp,
                                                            color: AppColors
                                                                .black),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ));
                            },
                          );
                        },
                        child: Container(
                          width: 250.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: AppColors.defaultKarrot,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'Log Out',
                              style: AppTextStyle.sfProMedium.copyWith(
                                  fontSize: 18.sp, color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     String accessToken =
      //         await StorageRepository.getString("access_token");
      //     await context.read<UserCubit>().getUserInfo(accessToken: accessToken);
      //   },
      //   backgroundColor: AppColors.defaultKarrot,
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
