import 'package:newsly/data/models/news/everything/articles_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();
  static String dataPath = '';

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("articles.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    dataPath = path;
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";

    await db.execute('''
    CREATE TABLE ${ArticleModelFields.dbTable} (
    ${ArticleModelFields.id} $idType,
    ${ArticleModelFields.sourceName} $textType,
    ${ArticleModelFields.author} $textType,
    ${ArticleModelFields.title} $textType,
    ${ArticleModelFields.description} $textType,
    ${ArticleModelFields.url} $textType,
    ${ArticleModelFields.urlToImage} $textType,
    ${ArticleModelFields.publishedAt} $textType,
    ${ArticleModelFields.content} $textType
    )
    ''');
  }

  static Future<ArticlesModel> insert(ArticlesModel articleModel) async {
    final db = await getInstance.database;
    final int id = await db.insert(
      ArticleModelFields.dbTable,
      articleModel.toJson(),
    );
    return articleModel.copyWith(id: id);
  }

  static Future<List<ArticlesModel>> getAll() async {
    List<ArticlesModel> allList = [];
    final db = await getInstance.database;
    allList =
        (await db.query(
          ArticleModelFields.dbTable,
        )).map((e) => ArticlesModel.fromJsonSQ(e)).toList();
    return allList;
  }

  static delete(int id) async {
    final db = await getInstance.database;
    db.delete(
      ArticleModelFields.dbTable,
      where: "${ArticleModelFields.id} = ?",
      whereArgs: [id],
    );
  }
}
