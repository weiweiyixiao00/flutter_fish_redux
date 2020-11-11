import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CategoryState> buildReducer() {
  return asReducer(
    <Object, Reducer<CategoryState>>{
      CategoryAction.action: _onAction,
    },
  );
}

CategoryState _onAction(CategoryState state, Action action) {
  final CategoryState newState = state.clone();
  return newState;
}
