import 'package:dio/dio.dart' hide Headers;
import 'package:easy_localization/easy_localization.dart';

import '../../core/constants/locale_keys.g.dart';

class ServerError implements Exception {
  int? _errorCode;
  String _errorMessage = "";

  ServerError.withError({DioError? error}) {
    _handleError(error);
  }

  int getErrorCode() => _errorCode??500;

  String getErrorMessage() => _errorMessage;

  _handleError(DioError? error) {
    _errorCode = error?.response?.statusCode ?? 500;
    switch (error!.type) {
      case DioErrorType.connectTimeout:
        _errorMessage = LocaleKeys.noConnection.tr();
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = LocaleKeys.noConnection.tr();
        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = LocaleKeys.noConnection.tr();
        break;
      case DioErrorType.response:
        {
          _errorMessage = error.response?.data['error_code'].toString()??LocaleKeys.somethingWrong;
          break;
        }
      case DioErrorType.cancel:
        _errorMessage = LocaleKeys.canceledRequest.tr();
        break;
      case DioErrorType.other:
        _errorMessage = LocaleKeys.somethingWrong.tr();
        break;
    }
    return _errorMessage;
  }
}
