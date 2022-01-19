import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String userName;
  final String userImage;
  final bool isMe;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.userName,
    required this.userImage,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.grey[300] : Colors.grey[500],
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: !isMe ? const Radius.circular(0) : const Radius.circular(12),
                  bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(12),
                ),
              ),
              width: 140,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          // isMe ? Colors.black : Colors.grey,
                          Colors.black,
                    ),
                  ),
                  Text(
                    message,
                    style: const TextStyle(
                      color:
                          // isMe ? Colors.black : Colors.grey,
                          Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Positioned(
          top: 0,
          left: isMe ? null : 120,
          right: isMe ? 120 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              userImage,
            ),
          ),
        ),
      ],
      clipBehavior: Clip.none,
    );
  }
}
