import 'db_helper.dart';
import 'user_model.dart';

class UserService extends DatabaseHelper {
  Future insertUser({required UserModel model}) async {
    final db = await database;
    return await db.insert("users", model.tocreateMap());
  }

  Future listUser() async {
    final db = await database;
    var data = await db.query("users");
    List<UserModel> userlist = [];
    for (var element in data) {
      var result = UserModel.fromJson(element);
      userlist.add(result);
    }
    return userlist;
  }

  Future updateUser({required UserModel model}) async {
    final db = await database;
    return await db.update("users", model.toUpdateMap(),
        where: "id = ?", whereArgs: [model.id]);
  }

  Future deleteUser({required int id}) async {
    final db = await database;
    return await db.delete("users", where: "id = ?", whereArgs: [id]);
  }

  // company

  Future listCompany() async {
    final db = await database;
    return await db.query("company");
  }
}
