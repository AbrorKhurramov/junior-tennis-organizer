import 'dart:io';
import 'package:junior_tennis_organizer/core/constants/constants.dart';
import 'package:junior_tennis_organizer/data/model/version/update_version_response.dart';
import 'package:junior_tennis_organizer/routes/navigation_route.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/dio_retry/retry_interceptor.dart';
import '../../domain/data_source/local_data_source.dart';
import 'error_handler_interceptor.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(NavigationRoute navigation, LocalDataSource dataSource) {
    Dio dio = Dio(BaseOptions(followRedirects: false));
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          request: true,
          error: true,
          responseHeader: true,
        ),
      );
    }
    dio.options = BaseOptions(
      receiveTimeout: Constants.dioTimeOut,
      connectTimeout: Constants.dioTimeOut,
      sendTimeout: Constants.dioTimeOut,
    );

    dio.interceptors.addAll([
      RetryInterceptor(
        dio: dio,
        logPrint: (error) async {},
        toNoInternetPageNavigator: () async {},
        refreshTokenFunction: () async {},
        accessTokenGetter: () => "",
      ),
      ErrorHandlerInterceptor(),
    ]);
    return _ApiClient(dio, baseUrl: Constants.baseUrl);
  }

  @GET('/v1/mobile/version/{appName}')
  Future<UpdateVersionResponse> checkVersion(
    @Path("appName") String appName,
  );
}
