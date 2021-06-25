import 'package:first_app/examplePage.dart';
import 'package:flutter/material.dart';

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

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _savedWordPairs = Set<String>();
  Widget _buildList() {
    return ListView.builder(
      itemCount: masterList.length - 1, //always set as length(masterList)-1
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        //length of list always needs to be a multiple of 3
        if (index % 3 != 0) return Padding(padding: EdgeInsets.all(2));
        return _buildRow(
            masterList[index], masterList[index + 1], masterList[index + 2]);
      },
    );
  }

  Widget _buildRow(String pair, String pair2, String pair3) {
    final alreadySaved = _savedWordPairs.contains(pair);
    final alreadySaved2 = _savedWordPairs.contains(pair2);
    final alreadySaved3 = _savedWordPairs.contains(pair3);

    return ListTile(
        title: Wrap(spacing: 5, runSpacing: 5, children: [
      dynamicButton(pair, alreadySaved, () {
        print("'$pair' selected");
        setState(() {
          if (alreadySaved) {
            _savedWordPairs.remove(pair);
          } else {
            _savedWordPairs.add(pair);
          }
        });
      }),
      dynamicButton(pair2, alreadySaved2, () {
        print("'$pair2' selected");
        setState(() {
          if (alreadySaved2) {
            _savedWordPairs.remove(pair2);
          } else {
            _savedWordPairs.add(pair2);
          }
        });
      }),
      dynamicButton(pair3, alreadySaved3, () {
        print("'$pair3' selected");
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

  Widget build(BuildContext context) {
    int l = _savedWordPairs.length;
    return Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  smallTextSection,
                  mainHeadingSection,
                  selectCountState(l),
                ],
              ),
            ),
            Expanded(
              child: _buildList(),
            ),
          ],
        ),
        floatingActionButton: FancyButton(
          onPress: () {
            print('Done button pressed with selected list: $_savedWordPairs');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ExamplePage(savedWordSet: _savedWordPairs)));
          },
        ));
  }
}
