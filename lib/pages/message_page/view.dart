import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MessageState state, Dispatch dispatch, ViewService viewService) {
  print('构建列表:buildView-11111');
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
        onPressed: (){
          Navigator.of(viewService.context).pop();
        },
      ),
      title: Text('消息中心',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    body: Container(
      color: Color(0xfff5f5f5),
      child: SafeArea(
        child: SmartRefresher(
          onRefresh: () async {
            dispatch(MessageActionCreator.onGetMessages());
          },
          header: BezierCircleHeader(),
          controller: state.refreshController,
          enablePullUp: false,
          enablePullDown: true,
          child: _itemWidget(state, viewService),
        ),
      ),
    ),
  );
}

Widget _itemWidget(MessageState state, ViewService viewService) {
  if (state.items != null && state.items.length > 0) {
    ///使用列表
    return ListView.builder(
      itemBuilder: viewService.buildAdapter().itemBuilder,
      itemCount: viewService.buildAdapter().itemCount,
    );
  } else {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
