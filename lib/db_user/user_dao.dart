import 'package:crocodic_login/db_user/user.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @insert
  Future<void> insertUser(User user);

  @Query('SELECT * FROM User')
  Future<List<User>> findAllUser();

  @Query('SELECT * FROM User WHERE id = :id')
  Future<User?> findUserById(int id);

  @Query('DELETE FROM User WHERE id = :id')
  Future<void> deleteAllUser(int id);
}
