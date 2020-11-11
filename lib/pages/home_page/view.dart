import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'action.dart';
import 'state.dart';
RefreshController refreshController =
      RefreshController(initialRefresh: false);

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  // print('主题颜色:${state.themeColor == Colors.green ? "绿色" : '蓝色'}');
  return new Scaffold(
    appBar: null,
    body: SafeArea(
      child: Container(
        color: state.themeColor,
        child: Column(
          children: [
            viewService.buildComponent('nav_header'),
            Expanded(
              flex: 1,
              child: SmartRefresher(
                onRefresh: () async{ 
                  dispatch(HomeActionCreator.onChangeTheme());
                  refreshController.refreshCompleted();
                },
                header: BezierCircleHeader(),
                controller: refreshController,
                enablePullUp: false,
                enablePullDown: true,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: <Widget>[
                      viewService.buildComponent('banner'),
                      viewService.buildComponent('category'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
