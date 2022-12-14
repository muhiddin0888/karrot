import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/style.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      centerTitle: true,
      title: Text(
        "Chat",
        style: AppTextStyle.sfProBlack.copyWith(
          color: AppColors.black,
          fontSize: 24,
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
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: AppColors.black,
            )),
      ],
      backgroundColor: AppColors.white,
    ));
  }
}
