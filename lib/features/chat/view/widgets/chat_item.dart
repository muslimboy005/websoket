import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String image;
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final Function onTap;
  const ChatItem({
    super.key,
    required this.image,
    required this.name,
    required this.message,
    required this.time,
    this.unreadCount = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            onTap();
          },
          child: ListTile(
            leading: InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundImage: NetworkImage(image),
              ),
            ),
            title: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(time, style: TextStyle(fontSize: 12)),
                if (unreadCount > 0)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    padding: EdgeInsets.symmetric(
                        horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: Text(
                      unreadCount.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10),
                    ),
                  )
              ],
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}
