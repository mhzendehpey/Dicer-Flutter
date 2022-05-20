import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const DicerApp(),
    theme: ThemeData(fontFamily: 'Josefin'),
  ));
}

class DicerApp extends StatefulWidget {
  const DicerApp({Key? key}) : super(key: key);

  @override
  State<DicerApp> createState() => _DicerAppState();
}

class _DicerAppState extends State<DicerApp> {
  var numberOfDices = 2;
  List<int> diceValues = [6, 6, 6, 6, 6];
  var random = Random();
  var appbarTitle = 'Dicer';

  @override
  Widget build(BuildContext context) {
    // diceValues = List.filled(numberOfDices, 6, growable: true);
    List<DropdownMenuItem> dropDownItems =
        <int>[1, 2, 3, 4, 5].map<DropdownMenuItem<int>>((int value) {
      return DropdownMenuItem(
          value: value,
          child: Text(
            value.toString(),
            style: TextStyle(fontSize: 24),
          ));
    }).toList();

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text(appbarTitle),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text('Number of Dices: ', style: TextStyle(fontSize: 24.0)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                      value: numberOfDices,
                      items: dropDownItems,
                      onChanged: onChangedDropDown),
                )
              ],
            ),
            Expanded(
              child: Row(children: getDices()),
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
      for (var i = 0; i < numberOfDices; i++) {
        diceValues[i] = 1 + random.nextInt(6);
      }
      setState(() {});
      counter--;
      if (counter == 0) {
        timer.cancel();
      }
    });
  }

  List<Widget> getDices() {
    List<Widget> res = [];
    for (var i = 0; i < numberOfDices; i++) {
      res.add(makeDice(i));
    }
    return res;
  }

  Widget makeDice(int diceIndex) {
    const paddingValue = 24.0;
    var fontSizeValue = 32.0;
    var textColor = Colors.white;
    var fontFamilyValue = 'Josefin';
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(paddingValue),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "${diceValues[diceIndex]}",
                  style: TextStyle(
                      fontSize: fontSizeValue,
                      color: textColor,
                      fontFamily: fontFamilyValue),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Image.asset('images/dice${diceValues[diceIndex]}.png'))
          ],
        ),
      ),
    );
  }

  void setDiceValue(int diceValue) {}

  void onChangedDropDown(value) {
    setState(() {
      numberOfDices = value;
    });
  }
}
