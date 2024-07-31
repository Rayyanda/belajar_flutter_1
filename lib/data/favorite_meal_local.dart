import 'package:belajar_flutter_1/model/favorite.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteMealLocal{
  FavoriteMealLocal._init();

  static final FavoriteMealLocal instance = FavoriteMealLocal._init();

  final String tblFavorite = 'tbl_favroite';

  static Database? _database;

  Future<void> _createDB(Database db, int version) async{
    await db.execute('''
      CREATE TABLE $tblFavorite (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      idMeal TEXT,
      strMeal TEXT,
      strMealThumb TEXT
      )''');
  }

  Future<Database> _initDB(String filePath) async
  {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  // Future<void> _onUpgrade(Database db, int newVersion, int oldVersion) async
  // {
  //   await db.execute("ALTER TABLE $tblFavorite ADD COLUMN (strMeal TEXT, strMealThumb TEXT)");
  // }

  Future<Database> get database async
  {
    if(_database != null) return _database!;

    _database = await _initDB('favorite.db');
    return _database!;
  }

  //menambah favorit makanan
  Future<void> addToFavorite(Favorite favorit) async
  {
    final db = await instance.database;
    await db.insert(tblFavorite, favorit.toMap());
  }

  //menampilkan semua data favorite
  Future<List<Favorite>> getFavorite() async
  {
    final db = await instance.database;
    final result = await db.query(tblFavorite);
    return result.map((e)=> Favorite.fromMap(e)).toList();
  }

  //menghapus dari data favorite
  Future<void> deleteFavorite(String idMeal) async
  {
    final db = await instance.database;
    await db.delete(tblFavorite, where: 'idMeal = ?', whereArgs: [idMeal]);
  }


  //mengecek apakah ada di db local
  Future<bool> checkFavorite(String idMeal) async
  {
    final db = await instance.database;
    final result = await db.query(tblFavorite, where: 'idMeal = ?', whereArgs:[idMeal]);
    return result.isEmpty;
  }

}