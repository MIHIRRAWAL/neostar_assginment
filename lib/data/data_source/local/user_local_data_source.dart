import 'package:assignment_neostar/core/database/sql_helper.dart';

import '../../models/user.dart';

abstract class UserLocalDataSoruce {
  Future<User> createUser(User user);
  Future<List<User>> getAllUser();
}

class UserLocalDataSoruceImpl implements UserLocalDataSoruce {
  final SQLHelper sqlHelper;
  const UserLocalDataSoruceImpl({required this.sqlHelper});
  @override
  Future<User> createUser(User user) async {
    return await sqlHelper.createUser(user);
  }

  @override
  Future<List<User>> getAllUser() async {
    return await sqlHelper.getItems();
  }
}
