import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:shopFish/models/banner_model.dart';
import 'package:shopFish/models/home/category_model.dart';
import 'package:shopFish/store/state.dart';

class HomeState implements Cloneable<HomeState>, GlobalBaseState {
  
  List<String> searchKey; // 热门搜索词
  List<BannerData> bannerList; // banner
  List<CategoryData> categoryList; // 首页分类

  @override
  Color themeColor;

  @override
  HomeState clone() {
    return HomeState()
      ..searchKey = searchKey
      ..bannerList = bannerList
      ..categoryList = categoryList
      ..themeColor = themeColor;
  }

}

HomeState initState(Map<String, dynamic> args) {
  return HomeState()
    ..searchKey = []
    ..bannerList = []
    ..categoryList = [];
}
