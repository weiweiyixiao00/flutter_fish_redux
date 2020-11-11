import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:shopFish/store/action.dart';
import 'package:shopFish/store/state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeThemeColor: _onChangeThemeColor,
    },
  );
}

GlobalState _onChangeThemeColor(GlobalState state, Action action) {
  final Color color = state.themeColor == Colors.green ? Colors.blue : Colors.green;
  return state.clone()
    ..themeColor = color;
}