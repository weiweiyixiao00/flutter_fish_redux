import 'package:shopFish/config/config.dart';
import 'package:shopFish/network/http_manager.dart';
import '../url.dart';

class MessageService {
  static Future getMessages(params) async {
    return HttpManager.getInstance().httpPost(Url.FETCH_MESSAGE_LIST, {});
  }

}