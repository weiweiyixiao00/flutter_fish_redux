import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<MessageItemState> buildEffect() {
  return combineEffects(<Object, Effect<MessageItemState>>{
    MessageItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MessageItemState> ctx) {
}
