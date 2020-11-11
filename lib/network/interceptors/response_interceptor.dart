import 'package:dio/dio.dart';

import '../code.dart';
import '../result_data.dart';


/// response拦截器
class ResponseInterceptors extends InterceptorsWrapper {

  
  @override
  onResponse(Response response) async{
    RequestOptions option = response.request;
    try {
      if (option.contentType != null && option.contentType == "text") {
        return new ResultData(response.data, true, Code.SUCCESS);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return new ResultData(response.data, true, Code.SUCCESS, headers: response.headers);
      }
    } catch (e) {
      print(e.toString() + option.path);
      return new ResultData(response.data, false, response.statusCode, headers: response.headers);
    }
  }
}
