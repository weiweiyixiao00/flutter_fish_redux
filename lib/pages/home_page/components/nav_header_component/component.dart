import 'package:fish_redux/fish_redux.dart';
import 'package:shopFish/pages/home_page/state.dart';

import '../../state.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class NavHeaderComponent extends Component<NavHeaderState> {
  NavHeaderComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<NavHeaderState>(
                adapter: null,
                slots: <String, Dependent<NavHeaderState>>{
                }),);

}

class NavHeaderConnector extends ConnOp<HomeState, NavHeaderState> 
  with ReselectMixin<HomeState, NavHeaderState> {

  @override
  void set(HomeState state, NavHeaderState subState) {
    state.searchKey = subState.searchWords;
  }

  @override
  NavHeaderState computed(HomeState state) {
    return NavHeaderState()
      ..searchWords = state.searchKey;
  }

  
}
