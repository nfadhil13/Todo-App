import 'package:flutter/material.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({
    Key? key,
  }) : super(key: key);

  Widget _buildTodoStatus() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("24",
            style: TextStyle(letterSpacing: 1, fontSize: 22, color: Colors.white)),
        Text("Things to do",
          style: TextStyle(letterSpacing: 1, fontSize: 12, color: Colors.white.withOpacity(0.8))
        )
      ],
    );
  }

  Widget _buildTodoPercentageStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(value: 0.8, color: Color.fromRGBO(139, 167, 215, 1), backgroundColor: Color.fromRGBO(139, 167, 215, 1).withOpacity(0.5), strokeWidth: 3,)),
        SizedBox(width: 10),
        Text("85% Done", style: TextStyle(letterSpacing: 1, fontSize: 12, color: Colors.white.withOpacity(0.8)))
      ],
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
                              "Nov 19, 2016",
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
