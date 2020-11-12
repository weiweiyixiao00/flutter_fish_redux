import 'package:fish_redux/fish_redux.dart';
import 'package:shopFish/pages/home_page/page.dart';
import 'package:shopFish/pages/splash_page/page.dart';
import 'package:shopFish/store/state.dart';
import 'package:shopFish/store/store.dart';

class Routes {
  static final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'splash_page': SplashPage(),
      'main_page': HomePage(),
    },
    visitor: (String path, Page<Object, dynamic> page) {
      /// 满足条件 Page<T> ，T 是 GlobalBaseState 的子类。
      if (page.isTypeof<GlobalBaseState>()) {
        /// 建立 AppStore 驱动 PageStore 的单向数据连接
        /// 1. 参数1 AppStore
        /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
        page.connectExtraStore<GlobalState>(
          GlobalStore.store, (Object pagestate, GlobalState appState) {
          final GlobalBaseState p = pagestate;
          if (p.themeColor != appState.themeColor) {
            if (pagestate is Cloneable) {
              final Object copy = pagestate.clone();
              final GlobalBaseState newState = copy;
              newState.themeColor = appState.themeColor;
              return newState;
            }
          }
          return pagestate;
        });
      }
    }
  );
}