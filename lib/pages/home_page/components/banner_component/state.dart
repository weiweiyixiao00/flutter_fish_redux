import 'package:fish_redux/fish_redux.dart';
import 'package:shopFish/models/banner_model.dart';

class BannerState implements Cloneable<BannerState> {

  List<BannerData> bannerList = [];

  @override
  BannerState clone() {
    return BannerState()
      ..bannerList = bannerList;
  }
}

BannerState initState(Map<String, dynamic> args) {
  return BannerState()
    ..bannerList = [];
}
