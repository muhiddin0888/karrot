import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/korea_model/korea_data.dart';
import '../../../data/models/korea_model/korea_model.dart';
import '../../../data/models/uzb_model/uzb_data.dart';
import '../../../data/models/uzb_model/uzb_model.dart';
import '../../../utils/color.dart';
import '../../../utils/style.dart';

class CitySelector extends StatefulWidget {
  const CitySelector({super.key});

  @override
  State<CitySelector> createState() => _CitySelectorState();
}

class _CitySelectorState extends State<CitySelector> {
  String countryFrom = "From";
  String countryWhere = "Where";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Select sending location"),
                    content: SizedBox(
                      height: 200.h,
                      width: 200.w,
                      child: Container(
                          color: Colors.white,
                          child: FutureBuilder<UzbModel>(
                            builder: (BuildContext context,
                                AsyncSnapshot<UzbModel> snapshot) {
                              var data = UzbData.getUzbData();
                              return ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) => Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            countryFrom = data[index].cityName;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 155.w,
                                          margin: const EdgeInsets.all(5),
                                          padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w,
                                                  vertical: 10)
                                              .h,
                                          decoration: BoxDecoration(
                                            color: AppColors.defaultKarrot,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            data[index].cityName,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: 145.w,
              height: 50.h,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.w, color: AppColors.black),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text(
                countryFrom,
                style: AppTextStyle.sfProRegular.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              )),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                String temp = countryWhere;
                countryWhere = countryFrom;
                countryFrom = temp;
              });
            },
            icon: const Icon(CupertinoIcons.arrow_right_arrow_left_circle),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Select destination"),
                    content: SizedBox(
                      height: 200.h,
                      width: 200.h,
                      child: Container(
                          color: Colors.white,
                          child: FutureBuilder<KoreaModel>(
                            builder: (BuildContext context,
                                AsyncSnapshot<KoreaModel> snapshot) {
                              var data = KoreaData.getKoreaData();
                              return ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) => Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            countryWhere = data[index].cityName;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 155.w,
                                          margin: const EdgeInsets.all(5),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.h, vertical: 10.w),
                                          decoration: BoxDecoration(
                                            color: AppColors.defaultKarrot,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            data[index].cityName,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // gridDelegate:
                                //     const SliverGridDelegateWithFixedCrossAxisCount(
                                //   crossAxisCount: 1,
                                //   mainAxisSpacing: 2,
                                //   crossAxisSpacing: 2,
                                //   childAspectRatio: 8,
                                // ),
                              );
                            },
                          )),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: 145.w,
              height: 50.h,
              decoration: BoxDecoration(
                border: Border.all(width: 1.w, color: AppColors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Text(
                countryWhere,
                style: AppTextStyle.sfProRegular
                    .copyWith(fontSize: 16.sp, color: AppColors.black),
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
