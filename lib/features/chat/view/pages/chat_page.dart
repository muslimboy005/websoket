import 'package:chat_app/core/extensions/num_extensions.dart';
import 'package:chat_app/core/extensions/padding_extension.dart';
import 'package:chat_app/features/chat/data/models/message.dart';
import 'package:chat_app/features/chat/data/repositories/local_datasource.dart';
import 'package:chat_app/features/chat/view/widgets/chat_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/chat_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController textEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.navigate_before,
            size: 40,
          ),
        ),
        title: SizedBox(
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://yt3.googleusercontent.com/vZsmQtvu21Expe1pF_IGob3idy1Aemxn-R47PQj-Oa85vUnDuJH30G5qCfblZKge0SCBnDPumQ=s900-c-k-c0x00ffffff-no-rj"),
                  ),
                ),
              ),
              10.width,
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      "N15 Bootcamp Flutter mobile programming",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "22 ta a'zo",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                final allData =
                    HiveLocalServices.readAllData();
                print(allData.toString());
              },
              child: Icon(
                (Icons.more_horiz),
              ),
            ),
          ),
        ],
        backgroundColor: Color(0xff2F2F2F),
      ),
      body: ChatBody(),
      bottomNavigationBar: IntrinsicHeight(
        child: ColoredBox(
          color: Color(0xff2F2F2F),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.emoji_emotions)),
              7.width,
              Expanded(
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Message",
                  ),
                ),
              ),
              textEditingController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        context.read<ChatBloc>().add(
                              ChatEvent.sendMessage(
                                Message(
                                  name: "Amirxon",
                                  message:
                                      textEditingController
                                          .text
                                          .trim(),
                                  time: DateTime.now(),
                                ),
                              ),
                            );
                        textEditingController.clear();
                      },
                      icon: Icon(
                          size: 30,
                          Icons.send,
                          color: Colors.blueAccent),
                    )
                  : Row(
                      spacing: 10,
                      children: [
                        Icon(
                          Icons.attach_file_outlined,
                          size: 30,
                        ),
                        Icon(
                          Icons.mic,
                          size: 30,
                        ),
                      ],
                    ),
            ],
          ).paddingOnly(
            bottom: kToolbarHeight,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
