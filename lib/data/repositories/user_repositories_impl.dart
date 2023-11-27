import 'package:assignment_neostar/core/exception/exception.dart';
import 'package:assignment_neostar/data/models/user.dart';
import 'package:assignment_neostar/domain/entities/user.dart';
import 'package:assignment_neostar/domain/repositories/user_repositories.dart';
import 'package:dartz/dartz.dart';
import '../data_source/local/user_local_data_source.dart';

class UserRepositoryImpl extends UserRepository {
  final UserLocalDataSoruce userRemoteDataSoruce;

  UserRepositoryImpl({required this.userRemoteDataSoruce});
  @override
  Future<Either<AppException, UserEntity>> createUser(UserEntity user) async {
    return _createUser(user);
  }

  Future<Either<AppException, UserEntity>> _createUser(UserEntity user) async {
    try {
      final userData = await userRemoteDataSoruce.createUser(user.restore);
      return Right(userData);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException, List<User>>> getAllUser() {
    return _getAllUser();
  }

  Future<Either<AppException, List<User>>> _getAllUser() async {
    try {
      final userData = await userRemoteDataSoruce.getAllUser();
      return Right(userData);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }
}
