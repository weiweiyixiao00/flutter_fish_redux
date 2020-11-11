import 'package:fish_redux/fish_redux.dart';
import 'package:shopFish/pages/home_page/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CategoryComponent extends Component<CategoryState> {
  CategoryComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CategoryState>(
                adapter: null,
                slots: <String, Dependent<CategoryState>>{
                }),);

}

class CategoryConnector extends ConnOp<HomeState, CategoryState> {
  @override
  CategoryState get(HomeState state) {
    return CategoryState().clone()
      ..categoryList = state.categoryList
      ..themeColor = state.themeColor;
  }

  @override
  void set(HomeState state, CategoryState subState) {
    state.categoryList = subState.categoryList;
  }
}
