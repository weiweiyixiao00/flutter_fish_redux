import 'package:fish_redux/fish_redux.dart';

class NavHeaderState implements Cloneable<NavHeaderState> {

  List<String> searchWords = [];

  @override
  NavHeaderState clone() {
    return NavHeaderState()
      ..searchWords = searchWords;
  }
}

NavHeaderState initState(Map<String, dynamic> args) {
  return NavHeaderState()..searchWords = [];
}

