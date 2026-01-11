
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainPage()));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            color: Colors.blueAccent,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                height: 150,
                minWidth: 150,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                child: Text("START"),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            color: Colors.redAccent,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                height: 150,
                minWidth: 150,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                child: Text("START"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double blueCardHeight = 0;
  double redCardHeight = 0;
  int playerAScore = 0;
  int playerBScore = 0;
  bool initialized = false;
  @override
  Widget build(BuildContext context) {
    if (initialized == false) {
      blueCardHeight = MediaQuery.of(context).size.height / 2;
      redCardHeight = MediaQuery.of(context).size.height / 2;
      initialized = true;
    }
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              setState(() {
                blueCardHeight = blueCardHeight + 30;
                redCardHeight = redCardHeight - 30;
                playerBScore = playerBScore + 5;
              });
              double maxHeight = MediaQuery.of(context).size.height - 60;
              if (blueCardHeight > maxHeight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Resultpage(playerBScore, "b"),
                  ),
                );
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              height: blueCardHeight,
              width: double.infinity,
              color: Colors.blueAccent,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player B",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    playerBScore.toString(),
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                redCardHeight = redCardHeight + 30;
                blueCardHeight = blueCardHeight - 30;
                playerAScore = playerAScore + 5;
              });
              double ScreenHeight = MediaQuery.of(context).size.height;
              double maxHeight = MediaQuery.of(context).size.height - 30;
              if (redCardHeight > maxHeight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Resultpage(playerAScore, "a"),
                  ),
                );
              }
            },

            padding: EdgeInsets.zero,
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10),
              height: redCardHeight,
              width: double.infinity,
              color: Colors.redAccent,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player A",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    playerAScore.toString(),
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Resultpage extends StatelessWidget {
  int score = 0;
  String player = "";
  Resultpage(this.score, this.player);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == "a" ? Colors.redAccent : Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              score.toString(),
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),

            Text(
              player == "a" ? "Player A Won" : "Player B Won",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              color: Colors.white,
              child: Text("Restart Game"),
            ),
          ],
        ),
      ),
    );
  }
}