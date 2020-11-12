import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shopFish/models/banner_model.dart';
import 'package:shopFish/models/home/category_model.dart';
import 'package:shopFish/store/state.dart';

class HomeState implements Cloneable<HomeState>, GlobalBaseState {
  
  List<String> searchKey; // 热门搜索词
  List<BannerData> bannerList; // banner
  List<CategoryData> categoryList; // 首页分类
  RefreshController refreshController;

  @override
  Color themeColor;

  @override
  HomeState clone() {
    return HomeState()
      ..searchKey = searchKey
      ..bannerList = bannerList
      ..categoryList = categoryList
      ..themeColor = themeColor
      ..refreshController = refreshController;
  }

}

HomeState initState(Map<String, dynamic> args) {
  return HomeState()
    ..searchKey = []
    ..bannerList = []
    ..categoryList = []
    ..refreshController = RefreshController(initialRefresh: false);
}
