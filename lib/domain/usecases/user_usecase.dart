import 'package:assignment_neostar/core/exception/exception.dart';
import 'package:assignment_neostar/data/models/user.dart';
import 'package:assignment_neostar/domain/entities/user.dart';
import 'package:assignment_neostar/domain/repositories/user_repositories.dart';
import 'package:dartz/dartz.dart';

class UserUsecase {
  final UserRepository userRepository;
  UserUsecase(this.userRepository);

  Future<Either<AppException, UserEntity>> call(UserEntity user) async {
    return await userRepository.createUser(user);
  }

  Future<Either<AppException, List<User>>> getAll() async {
    return await userRepository.getAllUser();
  }
}
