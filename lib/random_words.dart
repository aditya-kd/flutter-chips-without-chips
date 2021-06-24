import 'package:flutter/material.dart';

import 'main.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

/*
ListTile(
          hoverColor: Colors.lightGreen[100],
          title: Text(pair, style: TextStyle(fontSize: 18)),
          trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red : null),
          onTap: () {
            setState(() {
              if (alreadySaved) {
                _savedWordPairs.remove(pair);
              } else {
                _savedWordPairs.add(pair);
              }
            }
            );
          }
          )
*/
final masterList = <String>[
  'Technology',
  'Blogging',
  'Social media influencers',
  'Crypto',
  'VR/AR',
  'Science',
  'Movies & Series',
  'Anime',
  'Music',
  'Advertising',
  'Business',
  'Startups',
  'Finance',
  'Marketing',
  'Journalism',
  'Investment',
  'Digital Marketing',
  'Books',
  'Education',
  'Current affairs',
  'Social issues',
  'Food',
  'Health & fitness',
  'Sports',
  'Writing',
  'Travelling',
  'Cooking',
  'Photography',
  'Philosophy',
  'Design',
  'Politics',
  'Psychology',
  'History',
  'Economics',
  'Something Else',
  'Something More',
];

class RandomWordsState extends State<RandomWords> {
  final _savedWordPairs = Set<String>();
  Widget _buildList() {
    return ListView.builder(
      itemCount: 35,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        if (index % 3 != 0) return Padding(padding: EdgeInsets.all(2));
        // _randomWordPairs.addAll(masterList.take(3));
        return _buildRow(
            masterList[index], masterList[index + 1], masterList[index + 2]);
      },
    );
  }

  Widget iconDelButton(String str, bool val, void myFunc()) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: Colors.white,
          onPrimary: Colors.black,
        ),
        onPressed: myFunc,
        icon: Icon(
          Icons.remove_outlined,
          color: Colors.red,
        ),
        label: Wrap(
          direction: Axis.vertical,
          children: [Text(str)],
          alignment: WrapAlignment.center,
        ));
  }

  Widget iconAddButton(String str, bool val, void myFunc()) {
    return ElevatedButton.icon(
      onPressed: myFunc,
      icon: Icon(Icons.add),
      label: Text(str),
      style: ElevatedButton.styleFrom(
          primary: Color(0xFF5ECDDA),
          onPrimary: Colors.black,
          shape: StadiumBorder()),
    );
  }

  Widget upButton(String str, bool val, void theFunction()) {
    if (val == false)
      return iconAddButton(str, val, theFunction);
    else
      return iconDelButton(str, val, theFunction);
  }

  Widget _buildRow(String pair, String pair2, String pair3) {
    final alreadySaved = _savedWordPairs.contains(pair);
    final alreadySaved2 = _savedWordPairs.contains(pair2);
    final alreadySaved3 = _savedWordPairs.contains(pair3);
    return ListTile(
        title: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runAlignment: WrapAlignment.spaceAround,
            runSpacing: 7,
            spacing: 10,
            children: [
          upButton(pair, alreadySaved, () {
            setState(() {
              if (alreadySaved) {
                _savedWordPairs.remove(pair);
              } else {
                _savedWordPairs.add(pair);
              }
            });
          }),
          upButton(pair2, alreadySaved2, () {
            setState(() {
              if (alreadySaved2) {
                _savedWordPairs.remove(pair2);
              } else {
                _savedWordPairs.add(pair2);
              }
            });
          }),
          upButton(pair3, alreadySaved3, () {
            setState(() {
              if (alreadySaved3) {
                _savedWordPairs.remove(pair3);
              } else {
                _savedWordPairs.add(pair3);
              }
            });
          })
        ]));
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _savedWordPairs.map((String pair) {
        return ListTile(
          title: Text(pair, style: TextStyle(fontSize: 16.0)),
        );
      });
      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
          appBar: AppBar(title: Text('Saved WordPairs')),
          body: ListView(
            children: divided,
          ));
    }));
  }

  Widget smallTextSection = Text(
    'The Discerning Owl',
    style: TextStyle(
      fontSize: 20,
      color: Colors.black,
    ),
  );

  Widget mainHeadingSection = Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Text('Choose any 5 or more interests from below.',
          style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontFamily: 'Montserrat-SemiBold')));

  Widget build(BuildContext context) {
    int l = _savedWordPairs.length;
    return Scaffold(
        body: Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              smallTextSection,
              mainHeadingSection,
              SelectCountState(number: l),
            ],
          ),
        ),
        Expanded(
            child: Container(
          child: _buildList(),
        )),
        FancyButton(
          onPress: _pushSaved,
        ),
      ],
    ));
  }
}

class SelectCountState extends StatelessWidget {
  int number = 0;
  SelectCountState({required this.number});
  @override
  Widget build(BuildContext context) {
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
}
