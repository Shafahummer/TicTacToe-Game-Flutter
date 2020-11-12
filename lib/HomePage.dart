import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCross = true;
  String message;
  List<String> gameState;

  bool btnDisabled = false;

  AssetImage cross = AssetImage('images/cross.png');
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage edit = AssetImage('images/edit.png');

  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  void resetGame() {
    setState(() {
      btnDisabled = false;
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  AssetImage getImage(String value) {
    switch (value) {
      case "empty":
        return edit;
        break;
      case "cross":
        return cross;
        break;
      case "circle":
        return circle;
        break;
    }
  }

  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  checkWin() {
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[1] && (gameState[1] == gameState[2]))) {
      setState(() {
        this.message = "${this.gameState[0]} wins!";
        btnDisabled = true;
        Future.delayed(const Duration(milliseconds: 5000), () {
          resetGame();
        });
      });
    } else if ((gameState[3] != "empty") &&
        (gameState[3] == gameState[4] && (gameState[4] == gameState[5]))) {
      setState(() {
        this.message = "${this.gameState[3]} wins!";
        btnDisabled = true;
        Future.delayed(const Duration(milliseconds: 5000), () {
          resetGame();
        });
      });
    } else if ((gameState[6] != "empty") &&
        (gameState[6] == gameState[7] && (gameState[7] == gameState[8]))) {
      setState(() {
        this.message = "${this.gameState[6]} wins!";
        btnDisabled = true;
        Future.delayed(const Duration(milliseconds: 5000), () {
          resetGame();
        });
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[3] && (gameState[3] == gameState[6]))) {
      setState(() {
        this.message = "${this.gameState[0]} wins!";
        btnDisabled = true;
        Future.delayed(const Duration(milliseconds: 5000), () {
          resetGame();
        });
      });
    } else if ((gameState[1] != "empty") &&
        (gameState[1] == gameState[4] && (gameState[4] == gameState[7]))) {
      setState(() {
        this.message = "${this.gameState[1]} wins!";
        btnDisabled = true;
        Future.delayed(const Duration(milliseconds: 5000), () {
          resetGame();
        });
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[5] && (gameState[5] == gameState[8]))) {
      setState(() {
        this.message = "${this.gameState[2]} wins!";
        btnDisabled = true;
        Future.delayed(const Duration(milliseconds: 5000), () {
          resetGame();
        });
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[4] && (gameState[4] == gameState[8]))) {
      setState(() {
        this.message = "${this.gameState[0]} wins!";
        btnDisabled = true;
        Future.delayed(const Duration(milliseconds: 5000), () {
          resetGame();
        });
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[4] && (gameState[4] == gameState[6]))) {
      setState(() {
        this.message = "${this.gameState[2]} wins!";
        btnDisabled = true;
        Future.delayed(const Duration(milliseconds: 5000), () {
          resetGame();
        });
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        this.message = "Game Draw";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: GridView.count(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  crossAxisCount: 3,
                  children: List.generate(
                      9,
                      (index) => Container(
                          margin: EdgeInsets.all(10.0),
                          color: btnDisabled ? Colors.grey : Colors.yellow,
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.red,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              child: AbsorbPointer(
                                absorbing: btnDisabled ? true : false,
                                child: MaterialButton(
                                  onPressed: () {
                                    playGame(index);
                                  },
                                  child: Image(
                                    image: getImage(this.gameState[index]),
                                  ),
                                ),
                              )))))),
          Container(
            child: Text(
              message,
              style: TextStyle(color: Colors.green, fontSize: 25),
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 50.0),
              child: MaterialButton(
                minWidth: 300.0,
                disabledColor: Colors.grey,
                child: Text(
                  "Reset",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: this.resetGame,
                color: Colors.purple,
              ))
        ],
      )),
    );
  }
}
