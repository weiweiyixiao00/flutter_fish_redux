import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.changeTheme: _onChangeTheme,
      HomeAction.saveSearchKey: _onSaveSearchKey,
      HomeAction.saveBanner: _onSaveBanner,
      HomeAction.saveCategory: _onSaveCategory,
    },
  );
}

HomeState _onChangeTheme(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.themeColor = action.payload;
  return newState;
}

HomeState _onSaveSearchKey(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.searchKey = action.payload;
  return newState;
}

HomeState _onSaveBanner(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.bannerList = action.payload;
  return newState;
}

HomeState _onSaveCategory(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.categoryList = action.payload;
  return newState;
}
