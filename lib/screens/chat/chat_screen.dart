import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';
import 'package:phone_otp_ui/utils/color.dart';
import '../../cubits/chats/chats_cubit.dart';
import '../../utils/style.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.usersReceiver}) : super(key: key);
  final String usersReceiver;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messagingController = TextEditingController();
  late VoidCallback onTap;
  bool isMyMessage = false;
  User? user = FirebaseAuth.instance.currentUser;
  String userReceiver = '';

  final scrollController = ScrollController();
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    userReceiver = widget.usersReceiver;
    // scrollController.jumpTo(
    //     scrollController.position.maxScrollExtent);
    super.initState();
  }

  void _scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  final Stream<QuerySnapshot> _MessageStream = FirebaseFirestore.instance
      .collection('chats')
      .orderBy('creat_at')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chat",
          style: AppTextStyle.sfProBlack.copyWith(
            color: AppColors.black,
            fontSize: 24.sp,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: AppColors.black,
            ),
          ),
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
      body: StreamBuilder<Object>(
          stream: _MessageStream,
          builder: (context, snapshot) {
            return BlocBuilder<ChatsCubit, ChatsState>(
                builder: (context, state) {
              var st = state.status;

              if (st == FormzStatus.submissionInProgress) {
                return const Center(child: CircularProgressIndicator());
              } else if (st == FormzStatus.submissionSuccess) {
                var chats = state.chats;
                return chats.isNotEmpty
                    ? Column(
                        children: [
                          Expanded(
                            flex: 9,
                            child: ListView(
                                shrinkWrap: true,
                                controller: scrollController,
                                padding: const EdgeInsets.all(20),
                                physics: const BouncingScrollPhysics(),
                                children: List.generate(
                                  chats.length,
                                  (index) {
                                    isMyMessage = chats[index].receiverId ==
                                        user!.uid.toString();
                                    return Container(
                                      margin: EdgeInsets.only(
                                        right: isMyMessage ? 50.w : 0,
                                        left: !isMyMessage ? 100.w : 0,
                                        top: 10.h,
                                      ),
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: isMyMessage
                                            ? Colors.greenAccent
                                            : Colors.lightGreen,
                                        borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(30.30),
                                          topRight:
                                              const Radius.circular(30.30),
                                          bottomLeft: isMyMessage
                                              ? const Radius.circular(0.0)
                                              : const Radius.circular(30),
                                          bottomRight: isMyMessage
                                              ? const Radius.circular(30.30)
                                              : const Radius.circular(0.0),
                                        ),
                                      ),
                                      child: Text(
                                        chats[index].text,
                                        style: AppTextStyle.sfProBold
                                            .copyWith(fontSize: 18.sp),
                                      ),
                                    );
                                  },
                                )),
                          ),
                          const Expanded(
                              child: SizedBox(
                            height: 20,
                          ))
                        ],
                      )
                    : const Center(child: Text("No Chats Available"));
              }
              return const Center(child: Text("error"));
            });
          }),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 26.0.w),
        child: TextFormField(
          style: const TextStyle(color: Colors.black),
          controller: messagingController,
          cursorColor: Colors.black,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              hoverColor: AppColors.white,
              fillColor: AppColors.white,
              filled: true,
              hintText: "Write a message ...",
              hintStyle: TextStyle(color: AppColors.black.withOpacity(0.5)),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.blue,
                  size: 28.0.sp,
                ),
                onPressed: () async {
                  var chat = BlocProvider.of<ChatsCubit>(context);
                  final now = DateTime.now();
                  if (messagingController.text.isNotEmpty) {
                    chat.updateChat(
                        fieldValue: messagingController.text, fieldKey: 'text');
                    chat.updateChat(
                        fieldValue: now.toString(), fieldKey: 'creat_at');
                    chat.updateChat(
                        fieldValue: userReceiver, fieldKey: 'receiver_id');
                    chat.updateChat(
                        fieldValue: user!.uid, fieldKey: 'sender_id');
                    chat.addChat();
                    chat.getTwoUsersConversation(
                        senderId: userReceiver, receiverId: user!.uid);
                  }
                  // onTap.call();
                  messagingController.clear();
                  //
                  Future.delayed(Duration(milliseconds: 100), () {
                    setState(() {
                      scrollController
                          .jumpTo(scrollController.position.maxScrollExtent);
                    });
                  });
                },
              )),
          onChanged: (v) {
            // context.read<ChatsCubit>().getTwoUsersConversation(
            //     senderId: userReceiver, receiverId: user!.uid);
            scrollController.jumpTo(scrollController.position.maxScrollExtent);
          },
        ),
      ),
    );
  }
}
/*
 */
