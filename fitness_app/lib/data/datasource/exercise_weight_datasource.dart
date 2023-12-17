import 'package:fitness_app/data/models/models.dart';
import 'package:fitness_app/utils/app_keys.dart';
import 'package:fitness_app/utils/exerciseWeight_keys.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ExerciseWeightDatasource {
  static final ExerciseWeightDatasource _instance =
      ExerciseWeightDatasource._();

  factory ExerciseWeightDatasource() => _instance;

  ExerciseWeightDatasource._() {
    _initDb();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'ExercisesWeight.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${AppKeys.dbWeightTable} (
        ${ExerciseWeightKeys.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${ExerciseWeightKeys.title} TEXT,
        ${ExerciseWeightKeys.note} TEXT,
        ${ExerciseWeightKeys.date} TEXT,
        ${ExerciseWeightKeys.kg} TEXT,
        ${ExerciseWeightKeys.category} TEXT
      )
    ''');
  }

  Future<int> addExercise(ExerciseWeight exerciseWeight) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        AppKeys.dbWeightTable,
        exerciseWeight.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<List<ExerciseWeight>> getAllExercisesWeight() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      AppKeys.dbWeightTable,
      orderBy: "id DESC",
    );
    return List.generate(
      maps.length,
      (index) {
        return ExerciseWeight.fromJson(maps[index]);
      },
    );
  }

  Future<int> updateExerciseWeight(ExerciseWeight exerciseWeight) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        AppKeys.dbWeightTable,
        exerciseWeight.toJson(),
        where: 'id = ?',
        whereArgs: [exerciseWeight.id],
      );
    });
  }

  Future<int> updateKg(ExerciseWeight exerciseWeight, String newKg) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        AppKeys.dbWeightTable,
        {'${ExerciseWeightKeys.kg}': newKg},
        where: 'id = ?',
        whereArgs: [exerciseWeight.id],
      );
    });
  }

  Future<int> deleteExerciseWeight(ExerciseWeight exerciseWeight) async {
    final db = await database;
    return db.transaction(
      (txn) async {
        return await txn.delete(
          AppKeys.dbWeightTable,
          where: 'id = ?',
          whereArgs: [exerciseWeight.id],
        );
      },
    );
  }
}
