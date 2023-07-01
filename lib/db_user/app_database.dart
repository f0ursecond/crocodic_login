import 'dart:async';
import 'package:crocodic_login/db_user/user.dart';
import 'package:crocodic_login/db_user/user_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}

final databaseLocal =
    $FloorAppDatabase.databaseBuilder('app_database.db').build();
