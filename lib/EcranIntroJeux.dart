

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
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              image: DecorationImage(

                image: AssetImage('assets/icons/logo_intro_jeux.webp'),
                  fit: BoxFit.cover ,
               ),

              color:  Color(0xfff3f8ff),


            ),
            child: Column(
              children:<Widget> [

                Container(
                  padding: EdgeInsets.fromLTRB( 0, 450, 0, 10),

                  child: ElevatedButton.icon(
                    label: Text('PANNEAUX' ,
                      style: TextStyle(
                          fontWeight: FontWeight.bold ,
                          fontSize: 20 ,

                      ),
                    ),
                    icon: Icon(Icons.accessibility ,
                        size : 20),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true ).push(TransitionHaut(

                          page :  EcranQuestionPanneaux(  )));

                    },
                  ),
                ) ,
                Container(
                  padding: EdgeInsets.fromLTRB( 0, 0, 0, 10),

                  child: ElevatedButton.icon(
                    label: Text('A LA SUITE' ,
                      style: TextStyle(
                          fontWeight: FontWeight.bold ,
                          fontSize: 20),
                    ),
                    icon: Icon(Icons.wysiwyg_rounded ,
                        size : 20),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true ).push(TransitionHaut(

                          page :  EcranQuestionsExamen.C1(  )));

                    },
                  ),
                ) ,

                Container(
                  padding: EdgeInsets.fromLTRB( 0, 0, 0, 10),

                  child: ElevatedButton.icon(
                    label: Text('PRIORITER' ,
                        style: TextStyle(
                            fontWeight: FontWeight.bold ,
                            fontSize: 20),
                  ),
                    icon: Icon(Icons.paste_outlined ,
                        size : 20),
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
