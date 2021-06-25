import 'package:flutter/material.dart';

class ExamplePage extends StatelessWidget {
  //the example page that appears on
  final Set<String> savedWordSet; //         pressing the Done button
  ExamplePage({required this.savedWordSet});
  @override
  Widget build(BuildContext context) {
    final Iterable<ListTile> tiles = savedWordSet.map((String pair) {
      return ListTile(
        title: Text(pair, style: TextStyle(fontSize: 16.0)),
      );
    });
    final List<Widget> divided =
        ListTile.divideTiles(tiles: tiles, context: context).toList();
    return Scaffold(
        body: ListView(
      children: divided,
    ));
  }
}

class FancyButton extends StatelessWidget {
  //class for Done button
  final GestureTapCallback onPress;
  FancyButton({required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF454545),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.horizontal(left: Radius.circular(50.0)),
      ),
      padding: EdgeInsets.only(left: 10, right: 16),
      child: ElevatedButton(
          child: Text('Done',style: TextStyle(fontSize: 18),),
          onPressed: onPress,
          style: ElevatedButton.styleFrom(onPrimary: Colors.white,primary: Color(0xFF454545),)
          ),
    );
  }
}

Widget dynamicButton(String str, bool val, void myFunc()) {
  ButtonStyle thisButtonStyle;
  Icon curIcon;
  if (val == false) {
    thisButtonStyle = ElevatedButton.styleFrom(
        primary: Color(0xFF5ECDDA),
        onPrimary: Colors.black,
        shape: StadiumBorder());
    curIcon = Icon(Icons.add);
  } else {
    thisButtonStyle = ElevatedButton.styleFrom(
      shape: StadiumBorder(),
      primary: Colors.white,
      onPrimary: Colors.black,
    );
    curIcon = Icon(
      Icons.remove_outlined,
      color: Colors.red,
      size: 24.0,
    );
  }
  return ElevatedButton.icon(
    onPressed: myFunc,
    icon: curIcon,
    label: Text(str),
    style: thisButtonStyle,
  );
}

Widget smallTextSection = Text(
  'The Learning Commune',
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
);

Widget mainHeadingSection = Padding(
    padding: EdgeInsets.only(top: 10),
    child: Text('Choose any 5 or more interests from below.',
        style: TextStyle(
          fontSize: 28,
          color: Colors.black,
        )));

Widget selectCountState(int number) {
  return Align(
    alignment: Alignment.bottomRight,
    child: Container(
      decoration: BoxDecoration(
          color: Color(0xFF454545),
          border: Border.all(width: 1, color: Color(0xFF454545)),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              topLeft: Radius.circular(50.0))),
      padding: EdgeInsets.all(15.0),
      child: Text('$number selected',
          style: TextStyle(fontSize: 20.0, color: Colors.white)),
    ),
  );
}
