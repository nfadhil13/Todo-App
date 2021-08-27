import 'package:flutter/cupertino.dart';
import 'package:to_do_app/datasources/local/dao/todo_dao.dart';
import 'package:to_do_app/models/todo.dart';

class TodoListProvider with ChangeNotifier {

  final List<Todo> _todoList = [];
  final _todoDao = TodoDao();
  var _numberOfTodo = 0;
  var _isFetching = false;


  TodoListProvider(){
    getLatestTodoList();
  }


  List<Todo> get todoList  {
    return [..._todoList];
  }

  int get numberOfTodo {
    return _numberOfTodo;
  }

  bool get isFetching {
    return _isFetching;
  }

  int get numberOfDone {
    return _todoList.length - _numberOfTodo;
  }

  int get numberOfTotal {
    return _todoList.length;
  }

  Future<void> addNewTodo(Todo todo) async {
    _isFetching = true;
    notifyListeners();
    await _todoDao.createNewTodo(todo);
    _todoList.insert(0, todo);
    _numberOfTodo++;
    _isFetching = false;
    notifyListeners();
  }

  Future<void> getLatestTodoList() async{
    print("Getting todoList");
    _isFetching = true;
    notifyListeners();
    final newList = await _todoDao.getAllTodo();
    _todoList.clear();
    _todoList.addAll(newList);
    _numberOfTodo = _todoList.where((element) => element.isDone == false).length;
    _isFetching = false;
    notifyListeners();
  }

}