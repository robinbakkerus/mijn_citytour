import 'package:flutter/material.dart';
import 'home_page.dart';
import 'map_page.dart';
import '../data/constants.dart';

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '/home', icon: Icons.home),
  const Choice(title: '/maps', icon: Icons.map),
];

AppBar buildMainAppBar(BuildContext context, int disableButton) {
  void _select(Choice choice) {
    print("** " + choice.title);

    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }

    if (choice.title == '/maps') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainMapPage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  bool _isButtonDisabled(int n) => n==disableButton;

  IconButton _buildButton(int n) {
      return new  IconButton(
        icon: Icon(choices[n].icon),
        onPressed: _isButtonDisabled(n) ? null : () {
          _select(choices[n]);
        } ,
      );
  }

  return new AppBar(
    title: new Text(Constants.toLangName(Constants.current.nativeLang) + "->" + Constants.toLangName(Constants.current.targetLang)),
    actions: <Widget>[
      _buildButton(0),
      _buildButton(1),
      PopupMenuButton<Choice>(
        onSelected: _select,
        itemBuilder: (BuildContext context) {
          return choices.skip(2).map((Choice choice) {
            return PopupMenuItem<Choice>(
              value: choice,
              child: Text(choice.title),
            );
          }).toList();
        },
      ),
    ],
  );
}
