import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MessageItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<MessageItemState>>{
      MessageItemAction.action: _onAction,
    },
  );
}

MessageItemState _onAction(MessageItemState state, Action action) {
  final MessageItemState newState = state.clone();
  return newState;
}
