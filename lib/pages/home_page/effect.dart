import 'package:fish_redux/fish_redux.dart';
import 'package:shopFish/models/banner_model.dart';
import 'package:shopFish/models/home/category_model.dart';
import 'package:shopFish/network/services/home_service.dart';
import 'package:shopFish/store/action.dart';
import 'package:shopFish/store/store.dart';
// import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.changeTheme: _onChangeTheme,
    Lifecycle.initState: _init,
  });
}

void _onChangeTheme(Action action, Context<HomeState> ctx) {
  // ctx.dispatch(HomeActionCreator.onChangeTheme(action.payload));
  GlobalStore.store.dispatch(GlobalActionCreator.onChangeThemeColor());
}

void _init(Action action, Context<HomeState> ctx) {
  HomeService.getSerchWord().then((data) {
    if (data.data['data'] != null) {
      List<String> keyList = [];
      for (var item in data.data['data']) {
        keyList.add(item);
      }
      ctx.dispatch(HomeActionCreator.onSaveSearchKey(keyList));
    }
  });

  const params = {
    "itemsId": 100,
    "provinceId": 16,
    "cityId": 173,
    "regionId": 2450,
    "street": 12036596,
  };
  HomeService.getBanner(params).then((data){
    if (data.data['data'] != null) {
      List<BannerData> banners = [];
      for (var item in data.data['data']) {
        banners.add(BannerData.fromJson(item));
      }
      ctx.dispatch(HomeActionCreator.onSaveBanner(banners));
    }
  });

  HomeService.getCategory().then((data){
    if (data.data['data'] != null) {
      List<CategoryData> categorys = [];
      for (var item in data.data['data']) {
        categorys.add(CategoryData.fromJson(item));
      }
      ctx.dispatch(HomeActionCreator.onSaveCategory(categorys));
    }
  });
}
