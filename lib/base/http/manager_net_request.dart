import 'package:dio/dio.dart';

class NetRequestManager {
// 工厂模式
  factory NetRequestManager() => _instance;

  static NetRequestManager get instance => _instance;
  static final NetRequestManager _instance = NetRequestManager._internal();

  late Dio _dio;

  NetRequestManager._internal() {
    // 初始化
    _init();
  }

  void _init() {
    _dio = Dio(new BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 100000,
    ));

    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      print("请求之前");
      // Do something before request is sent
      return handler.next(options); //continue
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      print("响应之前");
      // Do something with response data
      return handler.next(response); // continue
    }, onError: (DioError e, ErrorInterceptorHandler handler) {
      print("错误之前");
      // Do something with response error
      return handler.next(e); //continue
    }));
  }

  Future getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    var response = await _dio.get(url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
    return response;
  }
}

abstract class RequestCallback<T> {
  void onSuccess(T requestData);

  void onFailed(Exception e);
}
