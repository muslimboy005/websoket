import 'package:chat_app/features/chat/view/pages/chat_page.dart';
import 'package:chat_app/features/chat/view/widgets/chat_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.more_vert),
                      SizedBox(width: 16),
                      Text(
                        'Chats',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.camera_alt_outlined),
                      SizedBox(width: 16),
                      Icon(Icons.add_circle_outline),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => ChatItem(
                  image:
                      'https://yt3.googleusercontent.com/vZsmQtvu21Expe1pF_IGob3idy1Aemxn-R47PQj-Oa85vUnDuJH30G5qCfblZKge0SCBnDPumQ=s900-c-k-c0x00ffffff-no-rj',
                  name:
                      'N15 Bootcamp Flutter mobile programmming',
                  message: "22 ta a'zo",
                  time: '12:35 PM',
                  unreadCount: index,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
