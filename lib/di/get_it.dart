import 'package:get_it/get_it.dart';
import 'package:junior_tennis_organizer/cubit/home/home_cubit.dart';
import 'package:junior_tennis_organizer/cubit/intro/intro_cubit.dart';
import 'package:junior_tennis_organizer/cubit/main/main_cubit.dart';
import 'package:junior_tennis_organizer/cubit/settings/settings_cubit.dart';

import '../core/functions/base_functions.dart';
import '../cubit/tournaments/tournaments_cubit.dart';
import '../cubit/rankings/rankings_cubit.dart';
import '../data/local_data_source/local_data_source_impl.dart';
import '../data/local_data_source/mock_local_data_source_impl.dart';
import '../data/provider/api_client.dart';
import '../data/provider/mock_api_client.dart';
import '../data/repository/auth_repository_impl.dart';
import '../data/repository/main_repository_impl.dart';
import '../domain/data_source/local_data_source.dart';
import '../domain/data_source/remote_data_source.dart';
import '../domain/repository/auth_repository.dart';
import '../domain/repository/main_repository.dart';
import '../routes/navigation_route.dart';

final getItInstance = GetIt.I;

init() {
  getItInstance.registerLazySingleton<NavigationRoute>(
    () => NavigationRoute(),
  );

  getItInstance.registerLazySingleton<LocalDataSource>(
    () => BaseFunctions.noTestEnvironment ? LocalDataSourceImpl() : MockLocalDataSourceImpl(),
  );

  getItInstance.registerLazySingleton<ApiClient>(
    () => ApiClient(
      getItInstance<NavigationRoute>(),
      getItInstance<LocalDataSource>(),
    ),
  );

  getItInstance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      BaseFunctions.noTestEnvironment ? getItInstance<ApiClient>() : MockApiClient(),
    ),
  );

  getItInstance.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      getItInstance<RemoteDataSource>(),
      getItInstance<LocalDataSource>(),
    ),
  );

  getItInstance.registerLazySingleton<MainRepository>(
    () => MainRepositoryImpl(
      getItInstance<RemoteDataSource>(),
      getItInstance<LocalDataSource>(),
    ),
  );

  if (BaseFunctions.noTestEnvironment) {
    getItInstance.registerLazySingleton<MainCubit>(
      () => MainCubit(
        getItInstance<NavigationRoute>(),
      ),
    );
  } else {
    getItInstance.registerFactory<MainCubit>(
      () => MainCubit(
        getItInstance<NavigationRoute>(),
      ),
    );
  }

  if (BaseFunctions.noTestEnvironment) {
    getItInstance.registerLazySingleton<HomeCubit>(
      () => HomeCubit(
        getItInstance<NavigationRoute>(),
        getItInstance<MainRepository>(),
      ),
    );
  } else {
    getItInstance.registerFactory<HomeCubit>(
      () => HomeCubit(
        getItInstance<NavigationRoute>(),
        getItInstance<MainRepository>(),
      ),
    );
  }



  if (BaseFunctions.noTestEnvironment) {
    getItInstance.registerLazySingleton<TournamentsCubit>(
      () => TournamentsCubit(
        getItInstance<NavigationRoute>(),
        getItInstance<MainRepository>(),
      ),
    );
  } else {
    getItInstance.registerFactory<TournamentsCubit>(
      () => TournamentsCubit(
        getItInstance<NavigationRoute>(),
        getItInstance<MainRepository>(),
      ),
    );
  }

  if (BaseFunctions.noTestEnvironment) {
    getItInstance.registerLazySingleton<RankingsCubit>(
      () => RankingsCubit(
        getItInstance<NavigationRoute>(),
        getItInstance<MainRepository>(),
      ),
    );
  } else {
    getItInstance.registerFactory<RankingsCubit>(
      () => RankingsCubit(
        getItInstance<NavigationRoute>(),
        getItInstance<MainRepository>(),
      ),
    );
  }




  getItInstance.registerFactory<IntroCubit>(
    () => IntroCubit(
      getItInstance<NavigationRoute>(),
    ),
  );


  getItInstance.registerFactory<SettingsCubit>(
        () => SettingsCubit(),
  );
}
