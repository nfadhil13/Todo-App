import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/datasources/local/database.dart';
import 'package:to_do_app/screens/home/home_screen.dart';
import 'package:to_do_app/screens/todo_form/todo_form.dart';
import 'package:to_do_app/widgets/todo_item.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var instance = AppDatabase.instance;
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(  255,70,83,158),
        accentColor: Color.fromARGB(255,58, 174, 231),
        fontFamily: 'Poppins'
      ),
      home: HomeScreen(),
      routes: {
        TodoForm.routeName : (ctx) => TodoForm()
      },
    );
  }
}
