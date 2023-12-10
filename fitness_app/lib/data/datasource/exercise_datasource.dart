import 'package:fitness_app/data/models/exercise.dart';
import 'package:fitness_app/utils/app_keys.dart';
import 'package:fitness_app/utils/exercise_keys.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ExerciseDatasource {
  static final ExerciseDatasource _instance = ExerciseDatasource._();

  factory ExerciseDatasource() => _instance;

  ExerciseDatasource._() {
    _initDb();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'Exercises.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${AppKeys.dbTable} (
        ${ExerciseKeys.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${ExerciseKeys.title} TEXT,
        ${ExerciseKeys.note} TEXT,
        ${ExerciseKeys.date} TEXT,
        ${ExerciseKeys.time} TEXT,
        ${ExerciseKeys.category} TEXT,
        ${ExerciseKeys.isCompleted} INTEGER
      )
    ''');
  }

  Future<int> addExercise(Exercise exercise) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        AppKeys.dbTable,
        exercise.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<List<Exercise>> getAllExercises() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      AppKeys.dbTable,
      orderBy: "id DESC",
    );
    return List.generate(
      maps.length,
      (index) {
        return Exercise.fromJson(maps[index]);
      },
    );
  }

  Future<int> updateExercise(Exercise exercise) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        AppKeys.dbTable,
        exercise.toJson(),
        where: 'id = ?',
        whereArgs: [exercise.id],
      );
    });
  }

  Future<int> deleteExercise(Exercise exercise) async {
    final db = await database;
    return db.transaction(
      (txn) async {
        return await txn.delete(
          AppKeys.dbTable,
          where: 'id = ?',
          whereArgs: [exercise.id],
        );
      },
    );
  }
}
