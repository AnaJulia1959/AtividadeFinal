import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AnimeDatabase {
  static final AnimeDatabase _instance = AnimeDatabase._();
  static Database? _database;

  AnimeDatabase._();

  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;

    final dbPath = await getDatabasesPath();
    _database = await openDatabase(
      join(dbPath, 'anime.db'),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE favorites(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
          )
        ''');
      },
      version: 1,
    );
    return _database!;
  }

  static Future<void> addFavorite(String name) async {
    final db = await getDatabase();
    await db.insert('favorites', {'name': name});
  }

  static Future<List<Map<String, dynamic>>> getFavorites() async {
    final db = await getDatabase();
    return db.query('favorites');
  }
}
