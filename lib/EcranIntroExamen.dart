

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

        body: Container(

          color:  Color(0xfff3f8ff),

              child: Center(
                child: Column(
                  children:<Widget> [

    Container (
      padding: EdgeInsets.fromLTRB( 50, 100, 50, 10),

      child :   Image.asset(
                      'assets/icons/logo_intro_examen.webp' ,
                      height: 200,
                      width:  250,

                    ),
              ) ,




                    Row(
                      children: <Widget>[
                        Icon(Icons.list_alt),
                        Text(
                          'L\'examen consiste a 50  question ' ,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.volume_up_outlined),
                        Text(
                          'Les question sont lues par un assistant vocal ' ,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        Icon(Icons.close),
                        Text(
                          'Minimun pour reussir : 41/50 ' ,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),


                    Row(
                      children: <Widget>[
                        Icon(Icons.bug_report),
                        Text(
                          'Une seul faute grave  est autorisee ' ,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        Icon(Icons.timer),
                        Text(
                          ' Vous Avez 15 seconde pour repondre  ' ,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.timer),
                        Text(
                          ' 👼🏾 Bonne  Chance ' ,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                       Expanded(
                         child: Container(
                          padding: EdgeInsets.fromLTRB( 50, 150, 50, 10),

                          child: ElevatedButton.icon(
                            label: Text('COMMENCER'),
                            icon: Icon(Icons.play_circle_outline),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true ).push(TransitionHaut(

                                  page :  EcranQuestionsExamen.C1(   )));


                              },
                          ),

                    ),
                       ) ,
                  ],
                ),
              ),

          ),
        //   <--- image
      ),
    );
  }
}


