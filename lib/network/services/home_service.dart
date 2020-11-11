import 'package:shopFish/config/config.dart';
import 'package:shopFish/network/http_manager.dart';
import '../url.dart';

class HomeService {
  static getSerchWord(){
    return HttpManager.getInstance(baseUrl: Config.SHOST).httpGet(Url.FETCH_SEARCH_KEYS, {'platform': 3});
  }

  static getBanner(params){
   return HttpManager.getInstance().httpGet(Url.FETCH_BANNER, params);
  }

  static getCategory() {
    return HttpManager.getInstance().httpGet(Url.FETCH_HOME_CATEGORY, null);
  }
}