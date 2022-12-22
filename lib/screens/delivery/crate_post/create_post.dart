import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_otp_ui/screens/delivery/widgets/city_selector.dart';
import 'package:phone_otp_ui/screens/global/done.dart';
import 'package:phone_otp_ui/utils/router_constants.dart';
import '../../../utils/color.dart';
import '../../../utils/style.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  int _currentIntValue = 0;
  Map<String, bool> values = {
    'Smart Phone': false,
    'Laptop': false,
    'Grocery': false,
    'Pharmacy': false,
    'Documents': false,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Order Details",
          style: AppTextStyle.sfProBlack.copyWith(
            color: AppColors.black,
            fontSize: 24.sp,
          ),
        ),
        backgroundColor: AppColors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          const CitySelector(),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  "Full Name",
                  style: AppTextStyle.sfProMedium.copyWith(fontSize: 18.sp),
                ),
                SizedBox(
                  height: 10.w,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Enter your Name",
                      label: const Text("Enter your name")),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Row(
                  children: [
                    Text(
                      "Packge type",
                      style: AppTextStyle.sfProMedium.copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(
                      width: 80.w,
                    ),
                    Text(
                      "Weight",
                      style: AppTextStyle.sfProMedium.copyWith(fontSize: 18.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(CupertinoIcons.cube_box),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Enter package type",
                          style: AppTextStyle.sfProRegular
                              .copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    TextButton(
                      onPressed: () {
                        showPickerNumber(context);
                      },
                      child: Text(
                        "$_currentIntValue",
                        style:
                            AppTextStyle.sfProRegular.copyWith(fontSize: 18.sp),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "Kg",
                      style: AppTextStyle.sfProMedium.copyWith(fontSize: 18.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            "I can't take with me",
            style: AppTextStyle.sfProMedium.copyWith(fontSize: 18.sp),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: values.keys.map((String key) {
                // ignore: unnecessary_new
                return new CheckboxListTile(
                  title: Text(key),
                  value: values[key],
                  onChanged: (value) {
                    setState(() {
                      values[key] = value!;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const DoneScreen(
                            navigation: RouterConstants.navBar,
                          ))));
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
                  'Post',
                  style: AppTextStyle.sfProMedium
                      .copyWith(fontSize: 18.sp, color: AppColors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showPickerNumber(BuildContext context) {
    Picker(
        adapter: NumberPickerAdapter(
          data: [
            const NumberPickerColumn(
              begin: 0,
              end: 40,
            ),
          ],
        ),
        hideHeader: true,
        title: const Text("Please Select Package Measure"),
        selectedTextStyle: const TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          setState(() {
            List asd = value;
            _currentIntValue = asd[0];
          });
          print(value.toString());
          print(picker.getSelectedValues());
        }).showDialog(context);
  }
}
