import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shopFish/models/message_model.dart';
import 'package:shopFish/pages/message_page/adapter.dart';

import 'message_item_component/state.dart';

class MessageState extends MutableSource implements Cloneable<MessageState> {

  List<MessageModel> messageList;
  RefreshController refreshController;// 下拉刷新控制
  ///这地方一定要注意,List里面的泛型,需要定义为ItemState
  ///怎么更新列表数据,只需要更新这个items里面的数据,列表数据就会相应更新
  ///使用多样式,请写出  List<Object> items;
  List<MessageItemState> items; 

  @override
  MessageState clone() {
    return MessageState()
      ..messageList = messageList
      ..refreshController = refreshController
      ..items = items;
  }

  ///使用上面定义的List,继承MutableSource,就把列表和item绑定起来了
  @override
  Object getItemData(int index) {
    return items[index];
  }

  @override
  String getItemType(int index) => MessageItemAdapter.item_style;

  @override
  int get itemCount => items.length;

  @override
  void setItemData(int index, Object data) {
    items[index] = data;
  }
}

MessageState initState(Map<String, dynamic> args) {
  return MessageState()
    // ..messageList = []
    ..refreshController = RefreshController(initialRefresh: true);
    // ..items = [];
}
