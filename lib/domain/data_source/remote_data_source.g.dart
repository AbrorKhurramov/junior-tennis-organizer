// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_data_source.dart';

// **************************************************************************
// SubclassGenerator
// **************************************************************************

class RemoteDataSourceImpl with RemoteDataSource {
  final ApiClient _apiClient;
  RemoteDataSourceImpl(this._apiClient);

  @override
  Future<ResponseHandler<UpdateVersionResponse>> checkVersion({
    required String appName,
  }) async {
    UpdateVersionResponse? response;
    try {
      response = await _apiClient.checkVersion(
        appName,
      );
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(
          ServerError.withError(error: error as DioError),
        );
    }
    return ResponseHandler()..data = response;
  }
}
