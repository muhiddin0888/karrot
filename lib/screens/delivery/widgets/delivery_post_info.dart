import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/color.dart';
import '../../../utils/style.dart';

class DeliveryPostInfo extends StatelessWidget {
  const DeliveryPostInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Deliveries info",
          style: AppTextStyle.sfProBlack.copyWith(
            color: AppColors.black,
            fontSize: 24,
          ),
        ),
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Full Name",
              style: AppTextStyle.sfProMedium.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: AppColors.defaultKarrot,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Micheal Sam",
                    style: AppTextStyle.sfProRegular.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Phone Number",
              style: AppTextStyle.sfProMedium.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: AppColors.defaultKarrot,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "+998 99 999 99 99",
                    style: AppTextStyle.sfProRegular.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "City / Province",
              style: AppTextStyle.sfProMedium.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_downward_rounded,
                    color: AppColors.defaultKarrot,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Tashkent, Mirobod district",
                    style: AppTextStyle.sfProMedium.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppColors.defaultKarrot,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Korea, Seul",
                    style: AppTextStyle.sfProMedium.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Detail Location",
              style: AppTextStyle.sfProMedium.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Tashkent, Mirobod district, Oybek Building 16D, Green House with big tree",
                style: AppTextStyle.sfProRegular.copyWith(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.defaultKarrot,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                      'Chat',
                      style: AppTextStyle.sfProMedium
                          .copyWith(fontSize: 18, color: AppColors.white),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 20,
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
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.defaultKarrot,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        'Call',
                        style: AppTextStyle.sfProMedium
                            .copyWith(fontSize: 18, color: AppColors.white),
                      )),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
