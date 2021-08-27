import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/models/todo_type.dart';
import 'package:to_do_app/providers/todo_list_provider.dart';
import 'package:to_do_app/widgets/todo_item.dart';

class HomeTodoList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoListProvider>(context).todoList;
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (ctx, index) => TodoItem(todoList[index]),
      itemCount: todoList.length,
    );
  }
}
