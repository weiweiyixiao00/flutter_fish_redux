import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MessageItemAction { action }

class MessageItemActionCreator {
  static Action onAction() {
    return const Action(MessageItemAction.action);
  }
}
