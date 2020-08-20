import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: NoughtsAndCrosses(),
  ));
}

class NoughtsAndCrosses extends StatefulWidget {
  @override
  _NoughtsAndCrossesState createState() => _NoughtsAndCrossesState();
}

class _NoughtsAndCrossesState extends State<NoughtsAndCrosses> {
  bool xPlayer = true;
  String turn = "Turn : X";
  bool finished = false;
  List gridValue = [
    [0, " ", Colors.blue],
    [1, " ", Colors.blue],
    [2, " ", Colors.blue],
    [3, " ", Colors.blue],
    [4, " ", Colors.blue],
    [5, " ", Colors.blue],
    [6, " ", Colors.blue],
    [7, " ", Colors.blue],
    [8, " ", Colors.blue],
  ];

  void winner(int one, int two, int three) {
    if (gridValue[one][1] != " " &&
        gridValue[one][1] == gridValue[two][1] &&
        gridValue[one][1] == gridValue[three][1]) {
      gridValue[one][2] = Colors.green;
      gridValue[two][2] = Colors.green;
      gridValue[three][2] = Colors.green;
      finished = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noughts & Crosses"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(
                9,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      if (!finished) {
                        setState(() {
                          if (gridValue[index][1] == " ") {
                            xPlayer
                                ? gridValue[index][1] = "X"
                                : gridValue[index][1] = "O";
                            winner(0, 1, 2);
                            winner(3, 4, 5);
                            winner(6, 7, 8);
                            winner(0, 3, 6);
                            winner(1, 4, 7);
                            winner(2, 5, 8);
                            winner(0, 4, 8);
                            winner(2, 4, 6);
                            xPlayer = !xPlayer;
                            xPlayer ? turn = "Turn : X" : turn = "Turn : O";
                          }
                        });
                      }
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          gridValue[index][1],
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: gridValue[index][2],
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            child: Text(
              turn,
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                gridValue = [
                  [0, " ", Colors.blue],
                  [1, " ", Colors.blue],
                  [2, " ", Colors.blue],
                  [3, " ", Colors.blue],
                  [4, " ", Colors.blue],
                  [5, " ", Colors.blue],
                  [6, " ", Colors.blue],
                  [7, " ", Colors.blue],
                  [8, " ", Colors.blue],
                ];
                finished = false;
              });
            },
            child: Text("Restart"),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
