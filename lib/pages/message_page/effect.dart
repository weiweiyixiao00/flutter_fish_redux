import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:shopFish/models/message_model.dart';
import 'package:shopFish/network/services/message_service.dart';
import 'package:shopFish/pages/message_page/message_item_component/state.dart';
import 'action.dart';
import 'state.dart';

Effect<MessageState> buildEffect() {
  return combineEffects(<Object, Effect<MessageState>>{
    MessageAction.getMessages: _onGetMessage,
    // Lifecycle.initState: _onGetMessage,
  });
}

void _onGetMessage(Action action, Context<MessageState> ctx) {
  const params = {
    'messageType': 3,
    'pageNo': 1,
    'pageCount': 10,
  };
  MessageService.getMessages(params).then((res){
    ctx.state.refreshController.refreshCompleted();
    if (res.data['success']) {
      List<MessageItemState> messages = [];
      res.data['data'].map((item) {
        messages.add(MessageItemState(message: MessageModel.fromJson(item)));
      });
      ctx.dispatch(MessageActionCreator.onSaveMessage(messages));
    }
  });
  
}
