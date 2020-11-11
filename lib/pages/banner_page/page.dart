import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class BannerPage extends Page<BannerState, Map<String, dynamic>> {
  BannerPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<BannerState>(
                adapter: null,
                slots: <String, Dependent<BannerState>>{
                }),
            middleware: <Middleware<BannerState>>[
            ],);

}
