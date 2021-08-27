import 'package:flutter/material.dart';
import 'package:to_do_app/datasources/local/dao/todo_dao.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/models/todo_type.dart';

class TodoItem extends StatelessWidget {
  final Todo _todo;

  TodoItem(this._todo);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        ListTile(
          leading: CircleAvatar(
            child: Text("${_todo.type == TodoType.Personal ? "P" : "B"}"),
          ),
          title: Text(_todo.title),
          subtitle: Text(
            _todo.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text("11am"),
        ),
        Container(height: 1, width: double.infinity, color: Colors.grey.withOpacity(0.5)),
      ]),
    );
  }
}
