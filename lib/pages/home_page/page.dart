import 'package:fish_redux/fish_redux.dart';
import 'package:shopFish/pages/home_page/components/banner_component/component.dart';
import 'package:shopFish/pages/home_page/components/category_component/component.dart';
import 'components/nav_header_component/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeState>(
                adapter: null,
                slots: <String, Dependent<HomeState>>{
                  'nav_header': NavHeaderConnector() + NavHeaderComponent(),
                  'banner': BannerConnector() + BannerComponent(),
                  'category': CategoryConnector() + CategoryComponent(),
                }),
            middleware: <Middleware<HomeState>>[
            ],);

}
