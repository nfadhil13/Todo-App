import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/models/todo_type.dart';
import 'package:to_do_app/widgets/todo_item.dart';

class HomeTodoList extends StatelessWidget {

  final List<Todo> _todoList = [
    Todo(id: 1, type: TodoType.Business, title: "Membeli makan dogi", description: "Jangan lupa beli makan nanti mati", dateTime: DateTime.now()),
    Todo(id: 2, type: TodoType.Personal, title: "Membeli makan", description: "Jangan lupa beli makan nanti mati", dateTime: DateTime.now()),
    Todo(id: 3, type: TodoType.Business, title: "Membeli makan", description: "Jangan lupa beli makan nanti mati", dateTime: DateTime.now()),
    Todo(id: 4, type: TodoType.Personal, title: "Membeli makan", description: "Jangan lupa beli makan nanti mati", dateTime: DateTime.now()),
    Todo(id: 5, type: TodoType.Business, title: "Membeli makan", description: "Jangan lupa beli makan nanti mati", dateTime: DateTime.now()),
    Todo(id: 7, type: TodoType.Personal, title: "Membeli makan", description: "Jangan lupa beli makan nanti mati", dateTime: DateTime.now()),
    Todo(id: 8, type: TodoType.Business, title: "Membeli makan", description: "Jangan lupa beli makan nanti mati", dateTime: DateTime.now()),
    Todo(id: 9, type: TodoType.Personal, title: "Membeli makan", description: "Jangan lupa beli makan nanti mati", dateTime: DateTime.now()),

  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (ctx, index) => TodoItem(_todoList[index]),
      itemCount: _todoList.length,
    );
  }
}
