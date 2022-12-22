import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_otp_ui/utils/constants.dart';
import 'package:phone_otp_ui/utils/icon.dart';
import '../../utils/color.dart';
import '../../utils/router_constants.dart';
import '../../utils/style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr("profile"),
          style: AppTextStyle.sfProBlack.copyWith(
            color: AppColors.black,
            fontSize: 24.sp,
          ),
        ),
        elevation: 0.5,
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
                      tr("my_profile"),
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
                const Expanded(
                  child: SizedBox(),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouterConstants.profileEditScreen);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.black),
                    child: Row(children: [
                      Text(
                        tr("edit_profile"),
                        style: AppTextStyle.sfProMedium
                            .copyWith(color: AppColors.white),
                      ),
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
                  tr("settings"),
                  style: AppTextStyle.sfProBold.copyWith(fontSize: 22.sp),
                ),
                SizedBox(
                  height: 7.h,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200.h,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(tr("select_language")),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      // BlocProvider.of<LocalizationCubit>(
                                      //         context)
                                      //     .changeLanguage(Constants.uzb);
                                      setState(() {
                                        context.setLocale(Constants.uzb);
                                      });

                                      Navigator.pop(context);
                                    },
                                    child: Text(tr("uz"))),
                                ElevatedButton(
                                    onPressed: () {
                                      // BlocProvider.of<LocalizationCubit>(
                                      //         context)
                                      //     .changeLanguage(Constants.eng);
                                      setState(() {
                                        context.setLocale(Constants.eng);
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text(tr("eng"))),
                                ElevatedButton(
                                    onPressed: () {
                                      // BlocProvider.of<LocalizationCubit>(
                                      //         context)
                                      //     .changeLanguage(Constants.ru);
                                      setState(() {
                                        context.setLocale(Constants.ru);
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text(tr("rus"))),
                              ],
                            ),
                          );
                        });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.0.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.flag_circle,
                              size: 34,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Text(
                              tr("language"),
                              style: AppTextStyle.sfProRegular
                                  .copyWith(fontSize: 20.sp),
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.black,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  tr("about_us"),
                  style: AppTextStyle.sfProBold.copyWith(fontSize: 22.sp),
                ),
                SizedBox(
                  height: 7.h,
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
