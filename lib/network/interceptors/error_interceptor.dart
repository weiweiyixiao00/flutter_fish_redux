import 'package:dio/dio.dart';

///是否需要弹提示
const NOT_TIP_KEY = "noTip";

/// 错误拦截器
class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    //没有网络
    
    return options;
  }
}
