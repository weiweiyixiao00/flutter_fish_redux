import 'package:fish_redux/fish_redux.dart';
import 'package:shopFish/pages/message_page/state.dart';

import 'message_item_component/component.dart';

class MessageItemAdapter extends SourceFlowAdapter<MessageState> {
  static const String item_style = "message_item";

  MessageItemAdapter()
    : super(
      pool: <String, Component<Object>>{
         ///定义item的样式
        item_style: MessageItemComponent(),
      }
    );
}