import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CategoryAction { action }

class CategoryActionCreator {
  static Action onAction() {
    return const Action(CategoryAction.action);
  }
}
