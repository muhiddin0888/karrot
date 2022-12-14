import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp_ui/screens/car_rent/car_rent.dart';
import 'package:phone_otp_ui/screens/chat/chat_home_page.dart';
import 'package:phone_otp_ui/screens/delivery/delivery_screen.dart';
import 'package:phone_otp_ui/screens/profile/profile_screen.dart';
import 'package:phone_otp_ui/utils/color.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int currentIndex = 0;
  int categorySelectedIndex = -1;

//-----------------Date selecting------------------

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  List<Widget> screens = [
    const DeliveryScreen(),
    const CarRentScreen(),
    const ChatHomePage(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      // IndexedStack(
      //   index: currentIndex,
      //   children: screens,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        iconSize: 30,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(255, 182, 181, 181),
        items: [
          getItem(icon: Icons.home_filled, labelText: tr("home")),
          getItem(icon: Icons.car_rental, labelText: tr("car")),
          getItem(icon: Icons.chat, labelText: tr("chat")),
          getItem(icon: Icons.perm_identity_rounded, labelText: tr("profile"))
        ],
      ),
    );
  }

  BottomNavigationBarItem getItem(
      {required IconData icon, required String labelText}) {
    return BottomNavigationBarItem(
      label: labelText,
      icon: Icon(
        icon,
        size: 26,
        color: const Color.fromARGB(255, 177, 175, 175),
      ),
      activeIcon: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
