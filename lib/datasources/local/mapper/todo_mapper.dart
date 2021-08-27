import 'package:intl/intl.dart';
import 'package:to_do_app/datasources/local/model/todo_entity.dart';
import 'package:to_do_app/datasources/mapper.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/models/todo_type.dart';

class TodoMapper extends Mapper<TodoEntity, Todo> {
  @override
  TodoEntity mapFromDomain(Todo domain) {
    return TodoEntity(
        id: domain.id,
        type: domain.type == TodoType.Business ? 0 : 1,
        title: domain.title,
        description: domain.description,
        dateTime: DateFormat.yMMMMd().format(domain.dateTime),
        isDone: domain.isDone ? 1 : 0
    );
  }

  @override
  Todo mapToDomain(TodoEntity source) {
    return Todo(
      id: source.id,
      type: source.type == 0 ? TodoType.Business : TodoType.Personal,
      title: source.title,
      description: source.description,
      dateTime: DateFormat.yMMMMd().parse(source.dateTime),
      isDone: source.isDone == 1
    );
  }

}