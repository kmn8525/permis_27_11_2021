

import 'package:flutter/material.dart';
import 'package:permis/TrasitionPages.dart';

import 'EcranQuestionExamen.dart';

class EcranIntroExamen extends StatefulWidget {
  @override
  _EcranIntroExamenState createState() => _EcranIntroExamenState();
}

class _EcranIntroExamenState extends State<EcranIntroExamen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/profil/introExamen.png'),
                fit: BoxFit.scaleDown,
              ),
            ),
            child: Column(
              children:<Widget> [
                Container(
                  padding: EdgeInsets.fromLTRB( 120, 700, 120, 10),

                  child: ElevatedButton.icon(
                    label: Text('COMMENCER'),
                    icon: Icon(Icons.timer),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true ).push(TransitionHaut(

                          page :  EcranQuestionsExamen.C1(   )));


                      },
                  ),
                ) ,
              ],
            ),
          ),
        ), //   <--- image
      ),
    );
  }
}


