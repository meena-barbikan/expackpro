import 'package:shared_preferences/shared_preferences.dart';

class LocalDpService {
  Future<SharedPreferences> _connection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<bool> islogin() async {
    var connection = await _connection();
    return connection.getBool('login') ?? false;
  }

  Future setLogin({
    // required String email,
    // required String password,
    required String token,
  }) async {
    var connection = await _connection();
    connection.setString("token", token);
    connection.setBool("login", true);
    // connection.setString("email", email);
    // connection.setString("password", password);
  }

  Future<String> getemail() async {
    var connection = await _connection();
    return connection.getString("email") ?? "";
  }

  Future<String> getId() async {
    var connection = await _connection();
    return connection.getString("id") ?? "";
  }

  Future<String> getpassword() async {
    var connection = await _connection();
    return connection.getString("password") ?? "";
  }

  Future<String> gettoken() async {
    var connection = await _connection();
    return connection.getString("token") ?? "";
  }
}
