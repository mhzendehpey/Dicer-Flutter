import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const CodeBaz()));
}

class CodeBaz extends StatefulWidget {
  const CodeBaz({Key? key}) : super(key: key);

  @override
  State<CodeBaz> createState() => _CodeBazState();
}

class _CodeBazState extends State<CodeBaz> {
  var leftDice = 6;
  var rightDice = 6;
  var random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text(
          'CodeBaz Qoreh',
          style: TextStyle(fontFamily: 'Josefin'),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                "$leftDice",
                                style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.white,
                                    fontFamily: 'Josefin'),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Image.asset('images/dice$leftDice.png'))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                '$rightDice',
                                style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.white,
                                    fontFamily: 'Josefin'),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Image.asset('images/dice$rightDice.png'))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: onPress,
                    child: Text(
                      'Dice!',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.red,
                        fontFamily: 'Josefin',
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                        shape: StadiumBorder(),
                        minimumSize: Size.fromRadius(45),
                        side: BorderSide(width: 2, color: Colors.red)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onPress() {
    int counter = 10;
    Timer.periodic(Duration(milliseconds: 72), (timer) {
      leftDice = 1 + random.nextInt(6);
      rightDice = 1 + random.nextInt(6);
      setState(() {});
      counter--;
      if (counter == 0) {
        timer.cancel();
      }
    });
  }
}
