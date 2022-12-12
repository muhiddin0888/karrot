import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp_ui/utils/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, otp);
                },
                child: Row(
                  children: const [
                    Icon(Icons.contact_mail_rounded),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "OTP",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, map);
                },
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.map),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Map",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, payment);
                },
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.creditcard_fill),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Payment",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, chat);
                },
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.chat_bubble_2_fill),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Chat",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
