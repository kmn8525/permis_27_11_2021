

import 'package:flutter/material.dart';

import 'EcranJeuxPanneaux.dart';
import 'EcranQuestionExamen.dart';
import 'TrasitionPages.dart';

class EcranIntroJeux extends StatefulWidget {
  @override
  _EcranIntroJeuxState createState() => _EcranIntroJeuxState();
}

class _EcranIntroJeuxState extends State<EcranIntroJeux> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/profil/jeux.jpg"),
                fit: BoxFit.scaleDown,
              ),
            ),
            child: Column(
              children:<Widget> [

                Container(
                  padding: EdgeInsets.fromLTRB( 0, 300, 0, 25),

                  child: ElevatedButton.icon(
                    label: Text('PANNEAUX' ,
                      style: TextStyle(
                          fontWeight: FontWeight.bold ,
                          fontSize: 50),),
                    icon: Icon(Icons.accessibility ,
                        size : 50),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true ).push(TransitionHaut(

                          page :  EcranQuestionPanneaux(  )));

                    },
                  ),
                ) ,
                Container(
                  padding: EdgeInsets.fromLTRB( 0, 0, 0, 25),

                  child: ElevatedButton.icon(
                    label: Text('A LA SUITE' ,
                      style: TextStyle(
                          fontWeight: FontWeight.bold ,
                          fontSize: 50),
                    ),
                    icon: Icon(Icons.wysiwyg_rounded ,
                        size : 50),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true ).push(TransitionHaut(

                          page :  EcranQuestionsExamen.C1(  )));

                    },
                  ),
                ) ,

                Container(
                  padding: EdgeInsets.fromLTRB( 0, 0, 0, 25),

                  child: ElevatedButton.icon(
                    label: Text('PRIORITER' ,
                        style: TextStyle(
                            fontWeight: FontWeight.bold ,
                            fontSize: 50),
                  ),
                    icon: Icon(Icons.paste_outlined ,
                        size : 50),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true ).push(TransitionHaut(

                          page :  EcranQuestionsExamen.C1(  )));

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
