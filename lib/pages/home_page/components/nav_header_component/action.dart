import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum NavHeaderAction { saveSearchKey }

class NavHeaderActionCreator {
  static Action onSaveSearchKey(List<String> keys) {
    return Action(NavHeaderAction.saveSearchKey, payload: keys);
  }
}
