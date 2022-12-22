import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/icon.dart';
import '../../cubits/user/user_cubit.dart';
import '../../data/local_data/storage.dart';
import '../../utils/color.dart';
import '../../utils/router_constants.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);
  static String verify = "";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryCode = TextEditingController();
  String phone = "";

  @override
  void initState() {
    countryCode.text = "+998";
    getInitials();
    super.initState();
  }

  void getInitials() {
    phone = StorageRepository.getString("phone_number");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                AppIcon.otp,
                width: 150.w,
                height: 150.h,
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 55.h,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 40.w,
                      child: TextField(
                        controller: countryCode,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33.sp, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: TextField(
                      onChanged: ((value) {
                        phone = value;
                      }),
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone",
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: double.infinity,
                height: 45.h,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.defaultKarrot,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      // await FirebaseAuth.instance.verifyPhoneNumber(
                      //   phoneNumber: countryCode.text + phone,
                      //   verificationCompleted:
                      //       (PhoneAuthCredential credential) {},
                      //   verificationFailed: (FirebaseAuthException e) {},
                      //   codeSent: (String? verificationId, int? resendToken) {
                      //     MyPhone.verify = verificationId!;
                      //     Navigator.pushNamedAndRemoveUntil(
                      //         context, verify, (Route<dynamic> route) => false);
                      //   },
                      //   codeAutoRetrievalTimeout: (String verificationId) {},
                      // );
                      String mobilNumber = countryCode.text + phone;
                      validateMobile(mobilNumber);
                      if (phone != "null") {
                        await StorageRepository.putString(
                            key: "phone_number", value: mobilNumber);
                        debugPrint("Mobile Number is: $mobilNumber");
                        await context.read<UserCubit>().singInWithPhoneNumber(
                            number: mobilNumber, context: context);
                        await Future.delayed(const Duration(seconds: 2));
                        await Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouterConstants.verify,
                            (Route<dynamic> route) => false);
                      }
                    },
                    child: const Text("Send the code")),
              )
            ],
          ),
        ),
      ),
    );
  }

  String validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return "null";
  }
}
