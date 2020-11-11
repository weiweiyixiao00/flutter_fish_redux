import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<NavHeaderState> buildReducer() {
  return asReducer(
    <Object, Reducer<NavHeaderState>>{
      NavHeaderAction.saveSearchKey: _onSaveSearchKey,
    },
  );
}

NavHeaderState _onSaveSearchKey(NavHeaderState state, Action action) {
  final NavHeaderState newState = state.clone();
  newState.searchWords = action.payload;
  print(action.payload);
  return newState;
}
