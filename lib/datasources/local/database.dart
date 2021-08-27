
import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:to_do_app/models/todo.dart';

import 'model/todo_entity.dart';

class AppDatabase {
  static final AppDatabase instance =  AppDatabase._init();



  static Database? _database;

  AppDatabase._init();



  Future<Database> get database async {
    return _database ??= await _initDB("todo.db");
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath + filePath);

    return await openDatabase(path, version: 1, onCreate: _creatDB);
  }

  FutureOr<void> _creatDB(Database db, int version) async {
    await db.execute('''
        ${TodoEntity.createTableString}
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
