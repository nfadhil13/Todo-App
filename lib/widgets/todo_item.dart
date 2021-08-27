import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
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
        Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: ValueKey(_todo.id),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: _todo.type == TodoType.Personal ? Colors.redAccent : Colors.green,
              child: Text("${_todo.type == TodoType.Personal ? "P" : "B"}"),
            ),
            title: Text(_todo.title),
            subtitle: Text(
              _todo.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(DateFormat("d MMM").format(_todo.dateTime)),
          ),
        ),
        Container(height: 1, width: double.infinity, color: Colors.grey.withOpacity(0.5)),
      ]),
    );
  }
}
