import 'dart:math';

import 'package:chat_app/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/chat_bloc.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ColoredBox(
        color: Color(0xff121212),
        child: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            return state.when(
              loading: () => Center(
                  child: CircularProgressIndicator()),
              success: (chat) {
                return ListView.separated(
                  padding: EdgeInsets.only(bottom: 10),
                  clipBehavior: Clip.none,
                  reverse: true,
                  itemBuilder: (context, index) {
                    final data = chat[index];
                    final isMe = data.name == "Amirxon";
                    return Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.end,
                      mainAxisAlignment: isMe
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        if (!isMe) 12.width,
                        if (!isMe)
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://randomuser.me/api/portraits/men/${Random().nextInt(10)}.jpg"),
                                ),
                              ),
                            ),
                          ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 280,
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 12),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: isMe
                                ? Color.fromARGB(
                                    255, 149, 92, 255)
                                : Color(0xff2F2F2F),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomLeft: isMe
                                  ? Radius.circular(12)
                                  : Radius.circular(0),
                              bottomRight: isMe
                                  ? Radius.circular(0)
                                  : Radius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment:
                                CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                  children: [
                                    isMe
                                        ? SizedBox()
                                        : Text(
                                            data.name,
                                            style:
                                                TextStyle(
                                              fontSize: 16,
                                              fontWeight:
                                                  FontWeight
                                                      .bold,
                                              color: Colors
                                                  .blueAccent,
                                            ),
                                          ),
                                    Text(
                                      data.message,
                                      style: TextStyle(
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              10.width,
                              Text(
                                "${data.time.hour.toString().padLeft(2, '0')}:${data.time.minute.toString().padLeft(2, '0')}",
                                style:
                                    TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      8.height,
                  itemCount: chat.length,
                );
              },
              failure: (failure) =>
                  Center(child: Text(failure)),
            );
          },
        ),
      ),
    );
  }
}
