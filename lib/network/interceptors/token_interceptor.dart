import 'dart:collection';

import 'package:dio/dio.dart';
import 'dart:math';

import 'package:shopFish/config/config.dart';
import 'package:shopFish/local_storage/index.dart';

import '../url.dart';

/// Token拦截器
class TokenInterceptors extends InterceptorsWrapper {

  String _token;

  @override
  onRequest(RequestOptions options) async {
    _token = await LocalStorage.get(Config.TOKEN_KEY);
    print('token==${_token}');
    if (_token == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    // options.headers["TokenAuthorization"] = _token;
    options.headers["TokenAuthorization"] = 'Bearer1000002132571690-1604995823585550#7B7/lXjiJEUIjReMgztI3L7ecGdXuZqbCr3dUtjez/InbQbr350t56iuNRoiiwis';
    return options;
  }


  @override
  onResponse(Response response) async{
    try {
      var responseJson = response.data;
      if (response.statusCode == 201 && responseJson["token"] != null) {
        _token = 'token ' + responseJson["token"];
        // await LocalStorage.save(Config.TOKEN_KEY, _token);
      }
    } catch (e) {
      print(e);
    }
    return response;
  }

  ///清除授权
  clearAuthorization() {
    this._token = null;
    LocalStorage.remove(Config.TOKEN_KEY);
  }

  ///获取授权token
  getAuthorization() async {
    String token = await LocalStorage.get(Config.TOKEN_KEY);
    var dio = new Dio();
    if (token == null) {
      Map<String, dynamic> headers = new HashMap();
      headers.addAll({
        'Accept': 'application/json',
        'User-Agent':'shunguang/101 CFNetwork/902.2 Darwin/17.7.0',
      });
      Options options = new Options();
      options.headers = headers;

      var res = await dio.post(Config.HOST + Url.GET_TOKEN, options: options);

      if (res.data['success']) {
        token = 'Bearer' + res.data['data'];
        await LocalStorage.saveString(Config.TOKEN_KEY, token);
      } else {
        token = 'Bearer' + generateRandomUUID();
        await LocalStorage.saveString(Config.TOKEN_KEY, token);
      }
      return token;
    } else {
      this._token = token;
      return token;
    }
  }

  // 随机生成UUID
  generateRandomUUID() {
    int d = new DateTime.now().millisecondsSinceEpoch;
    var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replaceAllMapped(new RegExp('/[xy]/g'), (match) {
        int r = (d + Random().nextInt(10) * 16) % 16 | 0;
        return (match.group(0) == 'x' ? r : (r & 0x7 | 0x8)).toString();
    });
    return uuid;
  }
}
