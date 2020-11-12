import 'package:shopFish/config/config.dart';
import 'package:shopFish/network/http_manager.dart';
import '../url.dart';

class HomeService {
  static Future getSerchWord() async {
    return HttpManager.getInstance(baseUrl: Config.SHOST).httpGet(Url.FETCH_SEARCH_KEYS, {'platform': 3});
  }

  static Future getBanner(params) async {
   return HttpManager.getInstance().httpGet(Url.FETCH_BANNER, params);
  }

  static Future getCategory() async {
    return HttpManager.getInstance().httpGet(Url.FETCH_HOME_CATEGORY, null);
  }
}