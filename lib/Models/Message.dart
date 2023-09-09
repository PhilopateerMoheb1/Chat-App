import 'package:chatapp/Constants.dart';

class Message {
  final String msg;
  final DateTime time = DateTime.now();
  final String id;

  factory Message.fromJson(jsondata) {
    return Message(
      msg: jsondata[kDocument],
      id: jsondata['id'],
    );
  }

  Message({required this.msg, required this.id});
}
