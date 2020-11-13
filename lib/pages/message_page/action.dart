import 'package:fish_redux/fish_redux.dart';
import 'package:shopFish/models/message_model.dart';
import 'package:shopFish/pages/message_page/message_item_component/state.dart';

enum MessageAction { getMessages, saveMessage, updateItem }

class MessageActionCreator {
  static Action onGetMessages() {
    return const Action(MessageAction.getMessages);
  }

  static Action onSaveMessage(List<MessageItemState> messages) {
    return Action(MessageAction.saveMessage, payload: messages);
  }
}
