import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home/home_todo_list.dart';
import 'package:to_do_app/screens/todo_form/todo_form.dart';

import 'home_header_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(TodoForm.routeName);
        },
        child: Icon(Icons.add, color: Colors.white,),
      ),
      body: Column(
        children: [
          HomeHeaderSection(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Todo's", style: TextStyle(color: Colors.black38, fontSize: 16, letterSpacing: 2),),
                  SizedBox(height : 10),
                  Expanded(child: HomeTodoList()),
                  SizedBox(height : 20),
                  Row(
                    children: [
                      Text("Completed", style: TextStyle(color: Colors.black38, fontSize: 16, letterSpacing: 2),),
                      SizedBox(width: 3),
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 11,
                        child: Text("5", style: TextStyle(color: Colors.white, fontSize: 12)),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}

