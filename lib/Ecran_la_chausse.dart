


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Ecran_la_chausse extends StatefulWidget {
  final  String titrePage;

  const Ecran_la_chausse({Key key, this.titrePage}) : super(key: key);

  @override
  _Ecran_la_chausseState createState() => _Ecran_la_chausseState();
}


class _Ecran_la_chausseState extends State<Ecran_la_chausse> {
  String espace_liste = "\u2022 " ;

String  p1 = " * Une voie publique, par exemple une route, un pont, un tunnel, un sentier, un chemin de terre, une place, une autoroute ..., est un lieu public où nous pouvons nous rendre sans problème avec nos véhicules, lorsque nous souhaitons nous déplacer. Notre présence à cet endroit ne nécessite aucune justification .";

String  p2 = "Un terrain public, comme le parking d'un restaurant ou une station-service, est un lieu public où nous pouvons nous rendre avec notre véhicule, pour autant que nous ayons une bonne raison de le faire. " ;

String  p3 = "La chaussée est la partie pavée de la voie publique où les véhicules, comme les voitures, les autobus, les motocyclettes et les tracteurs peuvent circuler. S'il n'y a pas de piste cyclable, les cyclomoteurs à deux roues et les cyclistes peuvent utiliser la chaussée. S'il n'y a pas d'accotement ou de trottoir, les piétons peuvent aussi emprunter la chaussée. Une voie publique peut compter deux ou plusieurs bandes, séparées par des rails de protection ou un accotement: par exemple des autoroutes. Quand la voie publique comporte deux ou trois chaussées nettement séparées, notamment par un terre-plein, par un espace non accessible aux véhicules, par une différence de niveau, les conducteurs ne peuvent emprunter la chaussée de gauche par rapport au sens de leur marche, sauf réglementation locale. " ;








@override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,

      appBar: AppBar(
        centerTitle: true ,
        leading: IconButton(
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              Navigator.pop(context) ;

             }),
        title:   Text(widget.titrePage),

        backgroundColor: Colors.lightBlue,

        shadowColor:Colors.transparent ,


      ),
    body: SingleChildScrollView(
      scrollDirection : Axis.vertical,

      child: Container(
         height:  hauteur ,
          width: largeur,
          color: Colors.white70,

          padding: EdgeInsets.all(25.0),

        child:  Stack(
          children: <Widget>[
            Column(

              children: <Widget>[



                RichText(
                  text: TextSpan(
                    children: <TextSpan>[

                      TextSpan(children: <InlineSpan>[
                    //    style: GoogleFonts.getFont('Lato'),

                      ],
                        text: p1 ,   style: GoogleFonts.inconsolata(
                          textStyle: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2.0 ,
                            wordSpacing : 2.0 ,
                            height: 1.5,
                            fontSize: 100 ,

                          ),
                        ),

                      ),

                    ],
                  ),
                  textScaleFactor: 0.1,
                  textAlign: TextAlign.justify,
                ),
                  Divider(
                      color: Colors.transparent,
                      height: 15.0

                  ),

                Container(
                  margin:   EdgeInsets.only(left: 20.0, right: 20.0),

                  child: Image.asset(
                  'assets/la_chausse/1.jpg' ,
                     width: 200,
                  ),
                ) ,
                Divider(
                    color: Colors.transparent,
                    height: 15.0),

                RichText(
                  text: TextSpan(
                    text: "{espace_liste} ",

                    children: <TextSpan>[

                      TextSpan(children: <InlineSpan>[
                        //    style: GoogleFonts.getFont('Lato'),

                      ],
                        text: p2 ,
                        style: GoogleFonts.ptSerif(
                          textStyle: TextStyle(

                            color: Colors.black,
                            letterSpacing: 2.0 ,
                            wordSpacing : 2.0 ,
                            height: 1.5,
                            fontSize: 100 ,

                          ),
                        ),

                      ),

                    ],
                  ),
                  textScaleFactor: 0.1,
                  textAlign: TextAlign.justify,
                ),
                Divider(
                    color: Colors.transparent,
                    height: 15.0),

                RichText(
                  text: TextSpan(
                    children: <TextSpan>[

                      TextSpan(children: <InlineSpan>[
                        //    style: GoogleFonts.getFont('Lato'),

                      ],
                        text: p3 ,   style: GoogleFonts.ptSerif(
                          textStyle: TextStyle(

                             color: Colors.black,
                             letterSpacing: 2.0 ,
                             wordSpacing : 2.0 ,
                             height: 1.5,
                            fontSize: 100 ,

                          ),
                        ),

                      ),

                    ],
                  ),
                  textScaleFactor: 0.1,
                  textAlign: TextAlign.justify,
                ),

              ],
            ),
          ],
        )
      ),
    ) ,
    );
  }
}
