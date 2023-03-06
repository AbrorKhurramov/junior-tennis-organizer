import 'package:junior_tennis_organizer/core/constants/constants.dart';
import 'package:dio/dio.dart';

class ErrorHandlerInterceptor extends Interceptor {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if(err.response?.headers.toString().contains(Constants.html) == true){
      handler.resolve(Response(requestOptions: RequestOptions(path: ''), data: err));
      return handler.next(err);  // <--- THE TIP IS HERE
    }
    super.onError(err, handler);
  }
}