import '../../domain/data_source/local_data_source.dart';
import '../../domain/data_source/remote_data_source.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl with AuthRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<void> hasUser(bool value) async {
    await _localDataSource.hasUser(value);
  }
}
