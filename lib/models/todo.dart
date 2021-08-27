import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo_type.dart';




class Todo {

  final int id;
  final TodoType type;
  final String title;
  final String description;
  final DateTime dateTime;
  bool isDone;


  Todo({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.dateTime,
    this.isDone = false
  });

  Todo copyAndReplace({
    int? newId,
    TodoType? newTodotype,
    String? newTitle,
    String? newDescription,
    DateTime? newDateTime
    }
    ) {
    return Todo(
      id: newId ?? id,
      type: newTodotype ?? type,
      title: newTitle ?? title,
      description: newDescription ?? description,
      dateTime: newDateTime ?? dateTime
    );
  }



}