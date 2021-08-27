import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/todo_list_provider.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({
    Key? key,
  }) : super(key: key);

  Widget _buildTodoStatus() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Consumer<TodoListProvider>(
          builder: (context, model, child) {
            return Text(model.numberOfTodo.toString(),
            style: TextStyle(letterSpacing: 1, fontSize: 22, color: Colors.white));
          },
        ),
        Text("Things to do",
          style: TextStyle(letterSpacing: 1, fontSize: 12, color: Colors.white.withOpacity(0.8))
        )
      ],
    );
  }

  Widget _buildTodoPercentageStatus() {
    return Consumer<TodoListProvider>(
      builder: (_, model, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  value: model.numberOfTotal == 0 ? 0 : model.numberOfDone/model.numberOfTotal * 100,
                  color: Color.fromRGBO(139, 167, 215, 1),
                  backgroundColor:
                      Color.fromRGBO(139, 167, 215, 1).withOpacity(0.5),
                  strokeWidth: 3,
                )),
            SizedBox(width: 10),
            Text("${(model.numberOfTotal == 0 ? 0 : model.numberOfDone/model.numberOfTotal * 100).toStringAsFixed(2)}% Done",
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.8)))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/img/home_bg.jpg",
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned.fill(child: Container(color: Colors.black.withOpacity(0.1),)),
        Positioned.fill(
          child: Container(
            padding: EdgeInsets.only(left: 32,right: 24, top: 24, bottom: 24),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "Your\nThings",
                                style: TextStyle(
                                    fontSize: 30,
                                    letterSpacing: 3,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300
                                )
                            )
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              DateFormat.yMMMMd().format(DateTime.now()),
                              style: TextStyle(
                                  letterSpacing: 1,
                                  color: Colors.white.withOpacity(0.5)
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: _buildTodoStatus(),
                      ),
                      Positioned.fill(
                        child: _buildTodoPercentageStatus()
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
