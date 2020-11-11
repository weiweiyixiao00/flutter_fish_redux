import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:shopFish/models/home/category_model.dart';

class CategoryState implements Cloneable<CategoryState> {
  List<CategoryData> categoryList;
  Color themeColor;

  @override
  CategoryState clone() {
    return CategoryState()
      ..categoryList = categoryList
      ..themeColor = themeColor;
  }

}

CategoryState initState(Map<String, dynamic> args) {
  return CategoryState()
    ..categoryList = [];
}
