import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return new Scaffold(
    appBar: null,
    body: Container(
      color: state.themeColor,
      child: SafeArea(
        child: Column(
          children: [
            viewService.buildComponent('nav_header'),
            Expanded(
              flex: 1,
              child: SmartRefresher(
                onRefresh: () async{ 
                  dispatch(HomeActionCreator.onChangeTheme());
                  dispatch(HomeActionCreator.onRefresh());
                },
                header: BezierCircleHeader(),
                controller: state.refreshController,
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
