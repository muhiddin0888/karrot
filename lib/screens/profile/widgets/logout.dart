import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/local_data/storage.dart';
import '../../../utils/color.dart';
import '../../../utils/router_constants.dart';
import '../../../utils/style.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: const Text("You really want to logout"),
                content: SizedBox(
                  height: 110.h,
                  width: 110.w,
                  child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              await StorageRepository.deleteBool("isLogged");
                              await StorageRepository.deleteString(
                                  "phone_number");
                              await StorageRepository.deleteString(
                                  "access_token");
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  RouterConstants.otp,
                                  (Route<dynamic> route) => false);
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
                                  'Yes, I am sure',
                                  style: AppTextStyle.sfProMedium.copyWith(
                                      fontSize: 18.sp, color: AppColors.white),
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
                                    width: 1, color: AppColors.defaultKarrot),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  'No, go back',
                                  style: AppTextStyle.sfProMedium.copyWith(
                                      fontSize: 18.sp, color: AppColors.black),
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
            style: AppTextStyle.sfProMedium
                .copyWith(fontSize: 18.sp, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
