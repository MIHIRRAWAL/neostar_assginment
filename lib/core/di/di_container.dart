import 'package:assignment_neostar/core/database/sql_helper.dart';
import 'package:assignment_neostar/data/repositories/user_repositories_impl.dart';
import 'package:assignment_neostar/domain/repositories/user_repositories.dart';
import 'package:assignment_neostar/domain/usecases/user_usecase.dart';
import 'package:assignment_neostar/presentation/blocs/get_all_users/get_all_register_bloc.dart';
import 'package:assignment_neostar/presentation/blocs/register/register_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/data_source/local/user_local_data_source.dart';

final getItInstance = GetIt.I;

init() {
  /// BLOCS
  getItInstance.registerFactory(
    () => RegisterBloc(
      userUsecase: getItInstance(),
    ),
  );

  getItInstance
      .registerFactory(() => GetAllRegisterBloc(userUsecase: getItInstance()));

  /// USECASE
  getItInstance.registerLazySingleton(
    () => UserUsecase(
      getItInstance(),
    ),
  );

  /// REPOSITORY
  getItInstance.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      userRemoteDataSoruce: getItInstance(),
    ),
  );

  //DATABASE
  getItInstance.registerLazySingleton(() => SQLHelper());

  /// DATA SOURCE
  getItInstance.registerLazySingleton<UserLocalDataSoruce>(
    () => UserLocalDataSoruceImpl(sqlHelper: getItInstance()),
  );
}
