import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import '../../cubits/chats/chats_cubit.dart';
import '../../cubits/user/user_cubit.dart';
import '../../data/models/chat_mode/user_item.dart';
import '../../utils/color.dart';
import '../../utils/style.dart';
import 'chat_screen.dart';

class ChatHomePage extends StatefulWidget {
  const ChatHomePage({Key? key}) : super(key: key);

  @override
  State<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  List<UserItem> users = [];
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    context.read<UserCubit>().listenUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          tr("chat"),
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
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: AppColors.black,
            ),
          ),
        ],
        backgroundColor: AppColors.white,
      ),
      body: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        debugPrint(state.users.toString());
        if (state.status == FormzStatus.submissionInProgress) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (state.status == FormzStatus.submissionSuccess) {
          users = state.users;
          return CustomScrollView(
            scrollDirection: Axis.vertical,
            reverse: false,
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  if (users[index].userId != user!.uid) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 0, top: 10, bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                  usersReceiver: users[index].userId,
                                ),
                              ));
                          context.read<ChatsCubit>().getTwoUsersConversation(
                              senderId: users[index].userId,
                              receiverId: user!.uid.toString());
                          debugPrint("my uid:  ${user!.uid.toString()}");
                          debugPrint(
                              "reserver user uid: ${users[index].userId}");
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: const Icon(
                                        Icons.person_pin,
                                        size: 80,
                                      )),
                                ),
                                Text(
                                  users[index].userName,
                                  style: AppTextStyle.sfProBold
                                      .copyWith(color: AppColors.black),
                                ),
                              ],
                            ),
                            Container(
                              width: 330,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.2, color: AppColors.black)),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }, childCount: users.length),
              ),
            ],
          );
        }
        return const Center(
          child: Text("EMPTY"),
        );
      }),
    );
  }
}
