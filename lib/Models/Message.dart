import 'package:chatapp/Constants.dart';

class Message {
  final String msg;
  final DateTime time = DateTime.now();

  factory Message.fromJson(jsondata) {
    return Message(
      jsondata[kDocument],
    );
  }

  Message(this.msg);
}
