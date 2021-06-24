import 'package:flutter/material.dart';
import './random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple), home: RandomWords());
  }
}

class FancyButton extends StatelessWidget {
  final GestureTapCallback onPress;
  FancyButton({required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF454545),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(50.0)),
          ),
          padding: EdgeInsets.only(left: 10, right: 16),
          child: ElevatedButton(
              child: Text(
                'Done',
                style: TextStyle(fontSize: 22),
              ),
              onPressed: () {/*move to example page*/},
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Color(0xFF454545),
              )),
        ));
  }
}
