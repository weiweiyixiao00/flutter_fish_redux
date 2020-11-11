import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

class NavHeaderState implements Cloneable<NavHeaderState>{

  List<String> searchWords = [];
  Color themeColor;

  @override
  NavHeaderState clone() {
    return NavHeaderState()
      ..searchWords = searchWords
      ..themeColor = themeColor;
  }
}

NavHeaderState initState(Map<String, dynamic> args) {
  return NavHeaderState()..searchWords = [];
}

