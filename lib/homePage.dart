import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true;
  List<String> displayExOh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  int oscore = 0;
  int xscore = 0;
  int filledBox = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Player X',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.yellowAccent,
                              fontFamily: 'PressStart2P'),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          xscore.toString(),
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.purpleAccent,
                              fontFamily: 'PressStart2P'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 2,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Player O',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.yellowAccent,
                              fontFamily: 'PressStart2P'),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          oscore.toString(),
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.purpleAccent,
                              fontFamily: 'PressStart2P'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[700]),
                    ),
                    child: Center(
                      child: Text(
                        displayExOh[index],
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  '@SANKET_PATEL',
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.cyanAccent,
                    fontFamily: 'PressStart2P',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayExOh[index] == '') {
        displayExOh[index] = 'O';
        filledBox += 1;
      } else if (!oTurn && displayExOh[index] == '') {
        displayExOh[index] = 'X';
        filledBox += 1;
      }
      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showDialog(displayExOh[0]);
    }
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showDialog(displayExOh[3]);
    }
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showDialog(displayExOh[6]);
    }
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showDialog(displayExOh[0]);
    }
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showDialog(displayExOh[1]);
    }
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showDialog(displayExOh[2]);
    }
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showDialog(displayExOh[0]);
    }
    if (displayExOh[2] == displayExOh[4] &&
        displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != '') {
      _showDialog(displayExOh[2]);
    } else if (filledBox == 9) {
      showDrawDialog();
    }
  }

  void showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('DRAW'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text('Play Again!'),
              )
            ],
          );
        });
  }

  void _showDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(winner + '  Is WINNER!'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text('Play Again!'),
              )
            ],
          );
        });
    if (winner == 'O') {
      oscore += 1;
    } else if (winner == 'X') {
      xscore += 1;
    }
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
    });
    filledBox = 0;
  }
}
