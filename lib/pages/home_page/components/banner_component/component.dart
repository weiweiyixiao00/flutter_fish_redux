import 'package:fish_redux/fish_redux.dart';
import 'package:shopFish/pages/home_page/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class BannerComponent extends Component<BannerState> {
  BannerComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<BannerState>(
                adapter: null,
                slots: <String, Dependent<BannerState>>{
                }),);

}

class BannerConnector extends ConnOp<HomeState, BannerState> with ReselectMixin<HomeState, BannerState> {
  @override
  BannerState computed(HomeState state) {
    return BannerState()
      ..bannerList = state.bannerList;
  }

  @override
  void set(HomeState state, BannerState subState) {
    state.bannerList = subState.bannerList;
  }
  
}
