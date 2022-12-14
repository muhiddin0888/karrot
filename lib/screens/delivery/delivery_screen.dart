import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:phone_otp_ui/screens/delivery/widgets/city_selector.dart';
import 'package:phone_otp_ui/screens/delivery/widgets/delivery_post.dart';
import 'package:phone_otp_ui/utils/color.dart';
import 'package:phone_otp_ui/utils/constants.dart';
import 'package:phone_otp_ui/utils/icon.dart';
import 'package:phone_otp_ui/utils/style.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: Text(
          "Delivery",
          style: AppTextStyle.sfProBlack.copyWith(
            color: AppColors.black,
            fontSize: 24.sp,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.black,
              )),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, notification);
              },
              icon: const Icon(
                Icons.notifications,
                color: AppColors.black,
              )),
        ],
        backgroundColor: AppColors.white,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 15.h,
          ),
          const CitySelector(),
          Lottie.asset(AppIcon.deliveryGuy),
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) => DeliveryPost(onTap: () {
              Navigator.pushNamed(context, deliverInfo);
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, createPost);
        },
        backgroundColor: AppColors.defaultKarrot,
        child: const Icon(Icons.add),
      ),
    );
  }
}
