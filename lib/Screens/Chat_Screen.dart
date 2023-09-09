import 'package:chatapp/Constants.dart';
import 'package:chatapp/Models/CustomTitle.dart';
import 'package:chatapp/Models/Message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Models/ChatBubble.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'ChatPage';

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference msgs = FirebaseFirestore.instance.collection(kcollection);

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: msgs.orderBy('time').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messageList = [];
            for (var i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: kPrimaryColor,
                  title: const CustomTitle(
                    text: "Chat",
                    urlImage: kimageLogo,
                  )),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: messageList.length,
                        itemBuilder: (context, index) {
                          return ChatBubble(msg: messageList[index]);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: textEditingController,
                      onSubmitted: (value) {
                        msgs.add({
                          kDocument: value,
                          'time': DateTime.now(),
                        });
                        textEditingController.clear();
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.send,
                            color: kPrimaryColor,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(15),
                        alignLabelWithHint: true,
                        hintText: "Enter your message",
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text("data");
          }
        });
  }
}
