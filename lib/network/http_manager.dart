import 'package:dio/dio.dart';
import 'package:shopFish/config/config.dart';
import 'dart:collection';

import 'code.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/log_interceptor.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/response_interceptor.dart';
import 'interceptors/token_interceptor.dart';
import 'result_data.dart';

///http请求
class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static HttpManager _instance = HttpManager._internal();
  Dio _dio;
  factory HttpManager() => _instance;

  final TokenInterceptors _tokenInterceptors = new TokenInterceptors();

  HttpManager._internal() {
    if (null == _dio) {
      _dio = new Dio();
    }
    _dio.interceptors.add(new HeaderInterceptors());
    _dio.interceptors.add(_tokenInterceptors);
    _dio.interceptors.add(new LogsInterceptors());
    _dio.interceptors.add(new ErrorInterceptors(_dio));
    _dio.interceptors.add(new ResponseInterceptors());
    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 10000;
  }

  static HttpManager getInstance({String baseUrl}) {
    if (baseUrl == null) {
      return _instance._normal();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }

  //用于指定特定域名
  HttpManager _baseUrl(String baseUrl) {
    if (_dio != null) {
      _dio.options.baseUrl = baseUrl;
    }
    return this;
  }

  //一般请求，默认域名
  HttpManager _normal() {
    if (_dio != null) {
      if (_dio.options.baseUrl != Config.HOST) {
        _dio.options.baseUrl = Config.HOST;
      }
    }
    return this;
  }

  
  httpGet(url, params,{ Map<String, dynamic> header, Options option, noTip = false}) async {
    Map<String, dynamic> headers = new HashMap();
    headers.addAll({
      'Accept': 'application/json',
      'User-Agent':'shunguang/101 CFNetwork/902.2 Darwin/17.7.0',
    });
    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }

    resultError(DioError e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT || e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      return new ResultData(Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip), false, errorResponse.statusCode);
    }

    Response response;
    try {
      // response = await _dio.request(url, data: params, options: option);
      response = await _dio.get(url, queryParameters: params, options: option);
    } on DioError catch (e) {
      return resultError(e);
    }
    if(response.data is DioError) {
      return resultError(response.data);
    }
    return response.data;
  }


  httpPost(url, params,{ Map<String, dynamic> header, Options option, noTip = false}) async {
    Map<String, dynamic> headers = new HashMap();
    headers.addAll({
      'Accept': 'application/json',
      'User-Agent':'shunguang/101 CFNetwork/902.2 Darwin/17.7.0',
    });
    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
      option.method = 'post';
    } else {
      option = new Options(method: "post");
      option.headers = headers;
    }

    resultError(DioError e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT || e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      return new ResultData(Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip), false, errorResponse.statusCode);
    }

    Response response;
    try {
      // response = await _dio.request(url, data: params, options: option);
      response = await _dio.post(url, data: params, options: option);
    } on DioError catch (e) {
      return resultError(e);
    }
    if(response.data is DioError) {
      return resultError(response.data);
    }
    return response.data;
  }

  ///清除授权
  clearAuthorization() {
    _tokenInterceptors.clearAuthorization();
  }

  ///获取授权token
  getAuthorization() async {
    return _tokenInterceptors.getAuthorization();
  }
}

final HttpManager httpManager = new HttpManager();
