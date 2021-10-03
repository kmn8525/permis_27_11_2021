
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'EcranCours.dart';
import 'EcranExamen.dart';
import 'EcranIntroExamen.dart';
import 'EcranIntroJeux.dart';
import 'EcranJeux.dart';
import 'EcranQuestionExamen.dart';
import 'EcranReglages.dart';
import 'EcranThemes.dart';


class Accueil extends StatefulWidget {
      int selectedIndex = 0;


     Accueil( this.selectedIndex)  ;


    @override
  _AccueilState createState() => _AccueilState();

}



class _AccueilState extends State<Accueil> {



  void initState() {

    super.initState();
  }

  final List<Widget> _children = [
    EcranTheme(),
    EcranCours(),
    EcranIntroExamen(),
    EcranIntroJeux(),
    EcranReglages(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? cupertino() : material();
  }

  Widget material() {
     ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,

    );
    return Scaffold(
      body: _children[widget.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            title: Text('Theme'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Cours'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),

            backgroundColor: Colors.white,
            title: Text('Examen'),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            title: Text('Jeux'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Reglage'),
          ),
        ],
        currentIndex: widget.selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget cupertino() {

    return CupertinoTabScaffold(

        tabBar: CupertinoTabBar(
            activeColor: Colors.blue,
            inactiveColor: Colors.white,
            backgroundColor: Colors.grey,

            items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            title: Text('theme'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Cours'),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),

            backgroundColor: Colors.white,
            title: Text('Examen'),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            title: Text('Jeux'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Reglage'),
          ),

        ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return EcranTheme();
              break;
            case 1:
              return EcranCours();
              break;
            case 2:
              return EcranIntroExamen();
              break;
            case 3:
              return EcranIntroJeux();
              break;
            default:
              return EcranReglages();
              break;
          }
        });
  }

}










