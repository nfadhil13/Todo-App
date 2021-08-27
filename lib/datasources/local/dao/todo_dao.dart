import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/datasources/local/database.dart';
import 'package:to_do_app/datasources/local/mapper/todo_mapper.dart';
import 'package:to_do_app/datasources/local/model/todo_entity.dart';
import 'package:to_do_app/models/todo.dart';

class TodoDao {

  final appDB = AppDatabase.instance;
  final mapper = TodoMapper();



  Future<void> createNewTodo(Todo todo) async {
    final db = await appDB.database;
    await db.insert(
        TodoEntity.tableName,
        mapper.mapFromDomain(todo).toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<void> updateTodo(Todo todo) async {
    final db = await appDB.database;
    await db.update(
        TodoEntity.tableName,
        mapper.mapFromDomain(todo).toMap(),
        where: '${TodoEntity.fieldNameId} = ?',
        whereArgs: [todo.id]
    );
  }
  
  Future<List<Todo>> getAllTodo() async {
    final db = await appDB.database;
    final List<Map<String,dynamic>> result = await db.query(TodoEntity.tableName);
    return result.map((e) => mapper.mapToDomain(TodoEntity.fromMap(e))).toList();
  }

  Future<void> deleteTodo(String id) async {
    final db = await appDB.database;
    await db.delete(
      TodoEntity.tableName,
      where: '${TodoEntity.tableName} = ?',
      whereArgs: [id]
    );
  }


}