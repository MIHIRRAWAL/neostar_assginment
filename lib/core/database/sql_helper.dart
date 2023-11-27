import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../data/models/user.dart';

class SQLHelper {
  static Database? _db;
  static const registeredUserList = "registreduserlist";
  static const String dBNAME = 'registreduserlistdb.db';

  Future<Database> get registeredUserDb async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = p.join(documentsDirectory.path, dBNAME);
    var db = await openDatabase(path, version: 1, onCreate: _createDatabase);
    return db;
  }

  void _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user(
        id INTEGER PRIMARY KEY,
        firstName TEXT,
        lastName TEXT,
        phone TEXT,
        email TEXT,
        gender TEXT,
        password TEXT,
        qualification TEXT,
        yearOfPassing TEXT,
        grade TEXT,
        experience TEXT,
        designation TEXT,
        domain TEXT,
        address TEXT,
        landmark TEXT,
        city TEXT,
        state TEXT,
        pinCode TEXT,
        imagePath TEXT
      )
    ''');
  }

  // Create new user
  Future<User> createUser(User user) async {
    final db = await registeredUserDb;

    final data = user.toJson();
    debugPrint(data.toString());
    final id = await db.insert('user', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    user.id = id;
    return user;
  }

  // Read all items (journals)
  Future<List<User>> getItems() async {
    final db = await registeredUserDb;
    var data = await db.query('user', orderBy: "id");
    final userList = data.map((e) => User.fromJson(e)).toList();
    return userList;
  }

  // Delete
  Future<void> deleteItem(int id) async {
    final db = await registeredUserDb;
    try {
      await db.delete("user", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
