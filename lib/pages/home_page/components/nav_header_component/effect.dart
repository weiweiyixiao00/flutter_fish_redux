import 'package:fish_redux/fish_redux.dart';
import 'package:shopFish/network/services/home_service.dart';
import 'action.dart';
import 'state.dart';

Effect<NavHeaderState> buildEffect() {
  return combineEffects(<Object, Effect<NavHeaderState>>{
    // Lifecycle.initState: _onInit,
  });
}

void _onInit(Action action, Context<NavHeaderState> ctx){
  HomeService.getSerchWord().then((data) {
    if (data.data['data'] != null) {
      List<String> keyList = [];
      for (var item in data.data['data']) {
        keyList.add(item);
      }
      ctx.dispatch(NavHeaderActionCreator.onSaveSearchKey(keyList));
    }
  });
  // const params = {
  //   "itemsId": 100,
  //   "provinceId": 16,
  //   "cityId": 173,
  //   "regionId": 2450,
  //   "street": 12036596,
  // };
  // HomeService.getBanner(params).then((data){

  // });
}

