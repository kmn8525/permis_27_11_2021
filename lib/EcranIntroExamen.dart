import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permis/TrasitionPages.dart';

import 'EcranQuestionExamen.dart';

class EcranIntroExamen extends StatefulWidget {
  @override
  _EcranIntroExamenState createState() => _EcranIntroExamenState();
}

class _EcranIntroExamenState extends State<EcranIntroExamen> {
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    final ButtonStyle Style_button_commencer =
    ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 35) ,
      primary: Colors.blue ,
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor : Colors.white ,
        resizeToAvoidBottomInset : false,

        body:   Container(
            height: hauteur,
            width: largeur ,

            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Stack(
               children: <Widget>[

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'assets/icons/logo_intro_examen.webp',
                        height: 200,
                        width: 200,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ) ,

                    Expanded(
                      child: Row(

                        children: <Widget>[

                          SvgPicture.asset(
                            'assets/icons/list.svg',
                            alignment : Alignment.centerLeft,
                            width:  40.0,
                            height: 40.0,
                          ),

                          SizedBox(
                            width: 10,
                          ) ,
                          Expanded(
                            child: Text(
                              'L\'examen consiste a 50 questions ',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.cinzel(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(
                       height: 10,
                     ) ,

                    Expanded(
                       child: Row(
                         /*mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,*/
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/icons/volume.svg',
                              alignment : Alignment.centerLeft,

                              width:  40.0,
                              height: 40.0,
                            ),
                            SizedBox(
                              width: 10,
                            ) ,
                            Expanded(
                              child: Text(
                                'Les questions sont lues par un assistant vocal ',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.parisienne(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                     ),
                    SizedBox(
                      height: 10,
                    ) ,

                    Expanded(
                      child: Row(
                        /*mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,*/
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/icons/gold_medal.svg',
                            alignment : Alignment.centerLeft,

                            width:  40.0,
                            height: 40.0,
                          ),
                          SizedBox(
                            width: 10,
                          ) ,
                          Expanded(
                            child: Text(
                              'Minimun pour reussir : 41/50 ',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.cinzel(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ) ,
                    Expanded(
                      child: Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly ,

                        children: <Widget>[

                        SvgPicture.asset(
                        'assets/icons/alarme.svg',
                        width: 40.0,
                        height: 40.0,
                      ),

                          SizedBox(
                            width: 10,
                          ) ,
                          Expanded(
                            child: Text(
                              'Une seul faute grave  est autorisee ',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.cinzel(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ) ,
                    Expanded(
                      child: Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly ,

                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/icons/stopwatch.svg',
                            width:  40.0,
                            height: 40.0,
                          ),
                          SizedBox(
                            width: 20,
                          ) ,
                          Flexible(
                            child: Text(
                              ' Vous Avez 15 seconde pour repondre  ',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.parisienne(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                      SizedBox(height: 30),

                     ElevatedButton(
                        style: Style_button_commencer,
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true ).push(TransitionHaut(

                              page :  EcranQuestionsExamen.C1(   )));


                        },
                        child: const Text('COMMENCER'),
                      ),


                  ],
                ),
              ],
            ),
          ),
        ),
        //   <--- image

    );
  }
}
