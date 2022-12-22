import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_otp_ui/utils/color.dart';
import 'package:phone_otp_ui/utils/icon.dart';
import 'package:phone_otp_ui/utils/router_constants.dart';
import 'package:phone_otp_ui/utils/style.dart';
import 'package:url_launcher/url_launcher.dart';

class CarRentInfoScreen extends StatefulWidget {
  const CarRentInfoScreen({super.key});

  @override
  State<CarRentInfoScreen> createState() => _CarRentInfoScreenState();
}

class _CarRentInfoScreenState extends State<CarRentInfoScreen> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(),
          Positioned(
            child: Image.asset(AppIcon.carRent1),
          ),
          Positioned(
            top: 200,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today 12:37",
                      style: AppTextStyle.sfProRegular.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      "DOGE Chalanger SRT8 (2021)",
                      style: AppTextStyle.sfProMedium.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "300 000 USD",
                          style: AppTextStyle.sfProBold.copyWith(
                              color: AppColors.black, fontSize: 22.sp),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(
                          "Negotiable",
                          style: AppTextStyle.sfProRegular.copyWith(
                              color: AppColors.black, fontSize: 20.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.5.w, color: AppColors.grey)),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Container(
                      width: 130.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.w, color: AppColors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "Condition: New",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.5.w, color: AppColors.grey)),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      "Description",
                      style: AppTextStyle.sfProRegular
                          .copyWith(color: AppColors.black, fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      "Dodge’s pony car, the 1970 Challenger, arrived at the peak of the classic muscle-car era. Closely related to the 1970 Plymouth Barracuda.",
                      style: AppTextStyle.sfProRegular
                          .copyWith(color: AppColors.black, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.5.w, color: AppColors.grey)),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      "Publisher",
                      style: AppTextStyle.sfProRegular
                          .copyWith(color: AppColors.black, fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          size: 25,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(
                          "Jack Smith",
                          style: AppTextStyle.sfProRegular.copyWith(
                              color: AppColors.black, fontSize: 16.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.5, color: AppColors.grey)),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      "Location",
                      style: AppTextStyle.sfProRegular
                          .copyWith(color: AppColors.black, fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 25,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(
                          "Toshkent, Mirobod",
                          style: AppTextStyle.sfProRegular.copyWith(
                              color: AppColors.black, fontSize: 16.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.5.w, color: AppColors.grey)),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouterConstants.chat);
                            },
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: AppColors.defaultKarrot,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                'Chat',
                                style: AppTextStyle.sfProMedium.copyWith(
                                    fontSize: 18.sp, color: AppColors.white),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              final call = Uri.parse('tel:+998 99 999 99 99');
                              if (await canLaunchUrl(call)) {
                                launchUrl(call);
                              } else {
                                throw 'Could not launch $call';
                              }
                            },
                            child: Container(
                              width: 150.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: AppColors.defaultKarrot,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                'Call',
                                style: AppTextStyle.sfProMedium.copyWith(
                                    fontSize: 18.sp, color: AppColors.white),
                              )),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 190,
            left: 330,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.defaultKarrot),
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.red : Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
