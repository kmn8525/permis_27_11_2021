

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
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    final ButtonStyle Style_button_panneu =
    ElevatedButton.styleFrom(
      textStyle: const TextStyle(
          fontSize: 20 ,
        ) ,
       primary: Colors.white ,
        onPrimary: Colors.black ,
       shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: Colors.black, width: 0.5) ,
      ),
    );

    final ButtonStyle Style_button_priorite =
    ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 20 ,
      ) ,
      primary: Colors.white ,
      onPrimary: Colors.black ,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        side: BorderSide(color: Colors.black, width: 0.5) ,
      ),
    );

    final ButtonStyle Style_button_question =
    ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 20 ,
      ) ,
      primary: Colors.white ,
      onPrimary: Colors.black ,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        side: BorderSide(color: Colors.black, width: 0.7) ,
      ),
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor : Colors.white ,

        body: Container(
          color: Colors.white,

            width: largeur ,
         height: hauteur,
       /* decoration: BoxDecoration(
        image: DecorationImage(

          image: AssetImage('assets/icons/logo_intro_jeux.webp'),
        fit: BoxFit.cover,
        ),
        ) ,*/

            child: Stack(
              children: <Widget>[

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: <Widget>[
                    Center(
                      child: Container(
                        child: Image.asset(
                          'assets/icons/logo_intro_jeux.webp',
                          height: 400,
                          width: 600,
                        ),
                      ),
                    ),

                    Center(
                      child: ElevatedButton(
                        style: Style_button_panneu,
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true ).push(TransitionHaut(

                              page :  EcranQuestionPanneaux(  )));

                        },
                        child: const Text('JEUX DES PANNEAUX 🚦 '),
                      ),
                    ),
                     SizedBox(
                      height: 30,
                    ) ,

                    Center(
                      child: ElevatedButton(
                        style: Style_button_question,
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true ).push(TransitionHaut(

                              page :  EcranQuestionPanneaux(  )));

                        },
                        child: const Text('QUESTION A LA SUITE ⏳'),
                      ),
                    ),
                     SizedBox(
                      height: 30,
                    ) ,
                    Center(
                      child: ElevatedButton(
                        style: Style_button_question,
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true ).push(TransitionHaut(

                              page :  EcranQuestionPanneaux(  )));

                        },
                        child: const Text('JEUX DES PRIORITER 🚧'),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ) ,


                  ],
                ),
              ],
            ), ),
                ) ,


    );
  }
}
