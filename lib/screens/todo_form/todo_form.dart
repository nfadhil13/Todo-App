import 'dart:io';

import 'package:flutter/material.dart';
import 'package:to_do_app/datasources/local/dao/todo_dao.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/models/todo_type.dart';

class TodoForm extends StatefulWidget {

  static final routeName = "/todo-form";

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {


  TodoType? _todoType;

  var _todo = Todo(id: -1, type: TodoType.Business, title: "", description: "", dateTime: DateTime.now());
  var _timeEditTextController = TextEditingController();
  final _form = GlobalKey<FormState>();


  @override
  void dispose() {
    // TODO: implement dispose
    _timeEditTextController.dispose();
    super.dispose();
  }

  InputDecoration _buildtextFieldInputDecoration(String textHint) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder:UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ) ,
        errorStyle: TextStyle(
          color: Colors.redAccent
        ),
        hintText: textHint,
        hintStyle: TextStyle(
            color: Colors.grey.shade500
        )
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).accentColor),
            onPressed: () {
              Navigator.of(context).pop(true);
            }
        ),
        Text("Add new thing", style: TextStyle(
          color: Colors.white,
          letterSpacing: 1,
          fontSize: 21,
          fontWeight: FontWeight.w300
        ),),
        IconButton(icon: Icon(Icons.settings, color: Theme.of(context).accentColor),
            onPressed: () {
              //Navigator.of(context).pop(true);
            }
        ),
      ],
    );
  }

  Widget _buildCircleIcon() {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1
        ),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Icon(Icons.create_outlined, color: Theme.of(context).accentColor, size: 30),
    );
  }


  void _showDatePicker(BuildContext context) async{
    final result = await showDatePicker(
        context: context,
        initialDate: _todo.dateTime,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 100))
    );
    _timeEditTextController.text = result?.toString() ?? "";
    _todo =  Todo(id: _todo.id, type: _todo.type, title: _todo.title, description: _todo.description, dateTime: result ?? _todo.dateTime);
  }

  final TodoDao _todoDao = TodoDao();

  void _saveForm() {
    final currentState = _form.currentState;
    print(currentState);
    print(currentState?.validate());
    if(currentState != null && currentState.validate()){
      currentState.save();
      _todoDao.createNewTodo(_todo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Form(
            key: _form,
            child: Column(
            children: [
              _buildAppBar(context),
              SizedBox(height: 45),
              _buildCircleIcon(),
              SizedBox(height: 20),
              DropdownButtonFormField<TodoType>(
                onSaved: (value) {
                  _todo = _todo.copyAndReplace(newTodotype: value);
                },
                value: _todoType,
                hint: Text("Todo Type", style: TextStyle(color: Colors.grey.shade500),),
                onChanged: (value) {
                    setState(() {
                      _todoType = value;
                    });
                },
                validator: (value) {
                  if(value == null) return "You have to choose the todo type";
                  return null;
                },
                iconEnabledColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),
                dropdownColor: Theme.of(context).accentColor,
                items: <DropdownMenuItem<TodoType>>[
                  DropdownMenuItem(child: Text("Business"), value: TodoType.Business),
                  DropdownMenuItem(child: Text("Personal"), value: TodoType.Personal)
                ],
                decoration: _buildtextFieldInputDecoration(""),
              ),
              SizedBox(height: 20),
              TextFormField(
                onSaved: (value) {
                  _todo = _todo.copyAndReplace(newTitle: value);
                },
                validator: (value) {
                  if(value == null || value.isEmpty) return "Title has to be filled";
                  return null;
                },
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: _buildtextFieldInputDecoration("Title"),
              ),
              SizedBox(height: 20),
              // Description field
              TextFormField(
                onSaved: (value) {
                  _todo = _todo.copyAndReplace(newDescription: value);
                },
                validator: (value) {
                  if(value == null || value.isEmpty) return "Description has to be filled";
                  return null;
                },
                maxLines: 3,
                style: TextStyle(
                    color: Colors.white
                ),
                decoration: _buildtextFieldInputDecoration("Description"),
              ),
              SizedBox(height: 20),
              Stack(
                children: [
                  TextFormField(
                    controller: _timeEditTextController,
                    enabled: false,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.white
                    ),
                    decoration: InputDecoration(
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: "Date",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade500
                        )
                    ),
                  ),
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () {
                        _showDatePicker(context);
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        width: double.infinity,
                        child: Icon(
                          Icons.date_range,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 52),
              ElevatedButton(
                  onPressed: _saveForm,
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      width: double.infinity,
                      child: Text("ADD YOUR TODO"),
                      alignment: Alignment.center
                  ),

              )
            ],
          )),
        ),
      ),
    );
  }
}
