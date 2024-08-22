import 'package:api_session/data/models/recipe_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._internal();

  static final DbHelper _instance = DbHelper._internal();

  factory DbHelper() {
    return _instance;
  }

  String tableName = 'favourites';
  Database? database;
  Map<int, bool> isFavourite = {};

  Future onCreateDatabase(Database database, int version) async {
    await database.execute(
      'CREATE TABLE $tableName (id INTEGER, title TEXT, image TEXT)',
    );
  }

  Future initDatabase() async {
    if (database != null) {
      return database;
    }
    String path = join(await getDatabasesPath(), 'favourites.db');
    database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreateDatabase,
    );
    return database;
  }

  Future getDataFromDatabase() async {
    final result = await database!.query(tableName);
    for (var item in result) {
      isFavourite.addAll({
        item['id'] as int: true,
      });
    }
    return result;
  }

  Future insertIntoDatabase(RecipeModel recipeModel) async {
    await database!.insert(
      tableName,
      recipeModel.toMap(),
    );
  }

  Future deleteFromDatabase(int id) async {
    await database!.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}