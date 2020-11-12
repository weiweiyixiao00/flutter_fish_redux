
import 'package:fish_redux/fish_redux.dart';
import 'package:shopFish/models/banner_model.dart';
import 'package:shopFish/models/home/category_model.dart';

enum HomeAction { changeTheme, saveSearchKey, saveBanner, saveCategory, refresh }

class HomeActionCreator {
  static Action onChangeTheme() {
    return const Action(HomeAction.changeTheme,);
  }

  static Action onRefresh() {
    return const Action(HomeAction.refresh);
  }

  static Action onSaveSearchKey(List<String> keys) {
    return Action(HomeAction.saveSearchKey, payload: keys);
  }

  static Action onSaveBanner(List<BannerData> banners) {
    return Action(HomeAction.saveBanner, payload: banners);
  }
  static Action onSaveCategory(List<CategoryData> categorys) {
    return Action(HomeAction.saveCategory, payload: categorys);
  }

}
