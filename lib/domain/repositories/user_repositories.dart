import 'package:assignment_neostar/core/exception/exception.dart';
import 'package:assignment_neostar/data/models/user.dart';
import 'package:assignment_neostar/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<AppException, UserEntity>> createUser(UserEntity user);
  Future<Either<AppException, List<User>>> getAllUser();
}
