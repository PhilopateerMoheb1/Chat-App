import 'package:chatapp/Models/Message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.msg,
    Object? id,
  });
  final Message msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: kPrimaryColor,
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, bottom: 32, top: 32, right: 16),
            child: Text(
              msg.msg,
              style: const TextStyle(
                color: Colors.white,
              ),
              selectionColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ChatBubbleFriend extends StatelessWidget {
  const ChatBubbleFriend({
    super.key,
    required this.msg,
    Object? id,
  });
  final Message msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            color: Color(0xff006d84),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, bottom: 32, top: 32, right: 16),
            child: Text(
              msg.msg,
              style: const TextStyle(
                color: Colors.white,
              ),
              selectionColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
