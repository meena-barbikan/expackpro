import 'dart:async';
import 'dart:developer';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DatabaseHelper {
  //static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  // factory DatabaseHelper() => _instance;

  //DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'example.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: _oncreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _oncreate(Database db, int version) async {
    Map<String, dynamic> user = {
      "user_id": "001",
      "name": "meena",
      "password": "123",
      "PhoneNumber": "1234567890"
    };
    try {
      await db.execute(''' CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id TEXT UNIQUE, 
            name TEXT NOT NULL,
            password INTEGER NOT NULL,
            PhoneNumber INTEGER NOT NULL
          )  ''');
      await db.execute(''' CREATE TABLE company(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            companyName TEXT NOT NULL,
            CompanyId INTEGER NOT NULL,
            CompanyAddress TEXT NOT NULL,
            CompanyEmail TEXT NOT NULL,
            CompanyPhone INTEGER NOT NULL,
            city TEXT NOT NULL,
            Pincode TEXT NOT NULL,
            Bankname TEXT NOT NULL
          )  ''');

      var userresult = db.insert("users", user);
      log("  User Result -$userresult");
    } catch (e) {
      rethrow;
    }
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // பதிப்பு 2க்கு மேம்படுத்தும் போது, PhoneNumber புலத்தைச் சேர்க்க
      await db.execute('ALTER TABLE users ADD COLUMN PhoneNumber INTEGER;');
    }
  }
}
