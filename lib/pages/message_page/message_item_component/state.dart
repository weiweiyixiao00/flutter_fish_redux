import 'package:fish_redux/fish_redux.dart';
import 'package:shopFish/models/message_model.dart';

class MessageItemState implements Cloneable<MessageItemState> {

  MessageModel message;

  MessageItemState({this.message});

  @override
  MessageItemState clone() {
    return MessageItemState()
      ..message = message;
  }
}

MessageItemState initState(Map<String, dynamic> args) {
  return MessageItemState();
}
