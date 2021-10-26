
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:permis/resultat/resultatDefinition.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Constantes.dart';
import 'EcranQuestions.dart';
import 'Ecran_cour_voie_publique.dart';
import 'ListeConducteurPassager.dart';
import 'ListeDefinition.dart';
import 'TrasitionPages.dart';
import 'Utility.dart';



var tampon  ;

/////////////////////////////////////////////////////////////////////
///// ------  EFFET ECRAN  DE L'EXAMEN///////
/////////////////////////////////////////////////////////////////////



class HorizontalItemExamen extends StatelessWidget {

  final String NomImageSVG;
  final String nomTheme;

  const  HorizontalItemExamen({Key key, this.NomImageSVG, this.nomTheme}) : super(key: key);





  @override
  Widget build(BuildContext context) =>  Container(
    height: double.infinity,



    child:  GestureDetector(

      onTap: () {


        /*Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
            builder: (BuildContext context  ) =>
                EcranQuestionsExamen(titrePage: '${ nomTheme}' )));


        // utilisateurTheme('${item.nomTheme}' ) ;*/

      },



      child: Container(
        height: double.infinity,



        child: Card(
          //semanticContainer: false,

          color: kCouleurBlancGeneral,
          elevation: 1.5,
          shadowColor : Colors.black38 ,
          margin: EdgeInsets.symmetric(vertical : 8 ,horizontal: 8),


          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),)) ,


          child: Container(

            alignment: Alignment.center ,
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  // margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(4),

                  child: SvgPicture.asset(
                    'assets/iconTheme/${NomImageSVG}.svg',
                    height: 43.0,
                    width: 43.0,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Expanded(
                  child: Text(
                    '${nomTheme}',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),


  );
}

/////////////////////////////////////////////////////////////////////
///// ------  EFFET ECRAN COUR-ACCEUIL///////
/////////////////////////////////////////////////////////////////////


class Animation_horizontal_ecran_cours extends StatefulWidget {
  final String balise;

  final String nom_image_svg;
  final String nom_theme;

  Animation_horizontal_ecran_cours({Key key,  this.balise ,this.nom_image_svg, this.nom_theme}) : super(key: key);

  @override
  Animation_horizontal_ecran_coursState createState() => Animation_horizontal_ecran_coursState();


}

class Animation_horizontal_ecran_coursState extends State<Animation_horizontal_ecran_cours> {

  Color c ;


  void chargeCouleur() {
    if  (widget.balise == "A" )
    {

      setState(() {
        c =   Color(0xff77D970) ;

      });


    }

    else if ( widget.balise == "B" ) {

      setState(() {

        c =   Color(0xffFF7777) ;

      });



    }
    else if ( widget.balise == "C" ) {

      setState(() {

        c =   Color(0xffFFB830) ;

      });


    }

    else if ( widget.balise == "D" ) {

      setState(() {

        c =   Color(0xff3DB2FF) ;

      });


    }

    else if ( widget.balise == "E" ) {

      setState(() {

        c =   Color(0xff2C394B) ;

      });


    }

    else if ( widget.balise == "F" ) {

      setState(() {


        c =   Color(0xffFFA0A0) ;
      });


    }

    else if ( widget.balise == "G" ) {


      setState(() {

        c =   Color(0xff9B72AA) ;

      });


    }
    else if ( widget.balise == "H" ) {

      setState(() {
        c = Colors.brown ;
      });


    }

    else if ( widget.balise == "I" ) {

      setState(() {

        c =   Color(0xffE36BAE) ;

      });


    }
    else if ( widget.balise == "J" ) {

      setState(() {

        c =   Color(0xffF88F01) ;

      });


    }
    else if ( widget.balise == "K" ) {
//
      setState(() {
        c = Colors.indigoAccent;
      });


    }
    else if ( widget.balise == "L" ) {

      setState(() {
        c = Colors.teal;
      });


    }

    else if ( widget.balise == "M" ) {

      setState(() {
        c = Colors.amber;
      });


    }
    else if ( widget.balise == "N" ) {

      setState(() {
        c =   Color(0xff3D56B2) ;
      });


    }
    else if ( widget.balise == "O" ) {

      setState(() {
        c =   Color(0xffEB92BE) ;
      });


    }

    else if ( widget.balise == "P" ) {

      setState(() {
        c =   Color(0xff911F27) ;
      });


    }
    else if ( widget.balise == "Q" ) {

      setState(() {
        c =   Color(0xff141E61) ;
      });


    }


    else if ( widget.balise == "R" ) {

      setState(() {
        c =   Color(0xff5C3D2E) ;
      });


    }
    else if ( widget.balise == "S" ) {

      setState(() {
        c =   Color(0xff082032) ;
      });


    }
    else if ( widget.balise == "T" ) {

      setState(() {
        c =   Color(0xff082032) ;
      });


    }

    else if ( widget.balise == "U" ) {

      setState(() {
        c =   Color(0xffFF4C29) ;
      });


    }

    else if ( widget.balise == "V" ) {

      setState(() {
        c =   Color(0xffB980F0) ;
      });


    }







  }

  @override
  void initState() {

    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    chargeCouleur() ;

    return    GestureDetector(

      onTap: () {

        if  (widget.balise == "A" )

        {


          Navigator.of(context, rootNavigator: true ).push(TransitionDroit( page:
          Ecran_cour_voie_publique(titrePage: '${ widget.nom_theme}'  )));


        }

        //  Navigator.push(context, SlideRightRoute(page: Screen2())),

      },



      child: Card(

        color: kCouleurBlancGeneral,
        elevation: 1.5,
        shadowColor : Colors.black ,
        margin: EdgeInsets.symmetric(vertical : 5 ,horizontal: 5),
        clipBehavior: Clip.antiAlias ,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Container(
              height: 120.0,
              width: 180.0,

              child: SvgPicture.asset(
                'assets/iconCours/${widget.nom_image_svg}.svg',
                // height: 80.0,
                //width: 120.0,
                color: Colors.white,

                allowDrawingOutsideViewBox: true,
              ),
              color: c,


            ),


            /*Divider(
                      color: Colors.black45,
                    ),*/
            Expanded(
              child: Container(
                height: 120.0,
                width: 140,
                child: Center(
                  child: Text(

                    '${widget.nom_theme}',
                    textAlign: TextAlign.center ,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14 ,
                      height : 1.2 ,
                    ),

                  ),
                ),
              ),
            ),



          ],
        ),

      ),


    );
  }
}



class Animation_horizontale_ecran_theme extends StatefulWidget {
  final String NomImageSVG;
  final String nomTheme;

  const Animation_horizontale_ecran_theme({Key key, this.NomImageSVG, this.nomTheme}) : super(key: key);

  @override
  Animation_horizontale_ecran_themeState createState() => Animation_horizontale_ecran_themeState();



}


class Animation_horizontale_ecran_themeState extends State<Animation_horizontale_ecran_theme> {
  Color c ;
  String etat ;

  int numQ_Definition = 0   ;
  int numQ_ConducteurPass = 0   ;

  int nbCD  ;
  int nbQCO  ;
  int nbQCCO  ;

  String RecuperCleQDefinion =" "  ;
  String RecuperCleQConducteurPass =" "  ;
  String RecuperCleListeFavoris=" " ;
  List  ListeFavoriSauver = [] ;

  int i = 0 ;
  int IdQuestion ;
  int   tailleListeSauver  ;

  bool verifExisteQuestion ;

  Future<void> recupereDonneSauvegarde() async {
    Utility.instance.getIntegerValue(RecuperCleQDefinion)
        .then((value) => setState(() {
      numQ_Definition = value ;


    }));

    Utility.instance.getIntegerValue(RecuperCleQConducteurPass)
        .then((value) => setState(() {
      numQ_ConducteurPass = value ;

    }));


    Utility.instance.getListData(RecuperCleListeFavoris)
        .then((value) => setState(() {
      ListeFavoriSauver = value ;

    }));
  }


  @override
  void initState() {
    RecuperCleQDefinion =  Provider.of<Definition>(context , listen: false).getCleNumQueDef ;
    RecuperCleQConducteurPass =  Provider.of<ConducteurPassager>(context , listen: false).getCleNumQueCondPass ;


    recupereDonneSauvegarde() ;


    super.initState();

  }

  void chargeCouleur() {
    if  (widget.nomTheme == "DEFINITION" )
    {

      if ( numQ_Definition > 0) {

        setState(() {
          c = Colors.red ;
        });
      }

      else {
        c = Colors.black ;

      }
    }

    else if ( widget.nomTheme == "CONDUCTEUR" ) {
      if ( numQ_ConducteurPass > 0) {

        setState(() {
          c = Colors.red ;
        });
      }

      else {
        c = Colors.black ;

      }

    }
    else if ( widget.nomTheme == "FAVORIS" ) {



      c = Colors.black ;



    }

  }


  @override
  Widget build(BuildContext context) {


    chargeCouleur();
    return
      GestureDetector(

        onTap: () {

          if  (widget.nomTheme == "DEFINITION" )


          {
            tampon =  ResultatDefinition()  ;
            tailleListeSauver =   tampon.RestitutionDesValeurSauvegarder();

            if ( numQ_Definition >  0) {
              var alertStyle = AlertStyle(
                animationType: AnimationType.fromTop,
                isCloseButton: false,
                isOverlayTapDismiss: true,
                descStyle: TextStyle(fontWeight: FontWeight.bold),
                descTextAlign: TextAlign.start,
                animationDuration: Duration(milliseconds: 500),
                alertBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                titleStyle: TextStyle(
                  color: Colors.green,
                ),
                alertAlignment: Alignment.center,
              );
              Alert(
                context: context,
                style: alertStyle,
                image: SvgPicture.asset(
                  'assets/emoji/happy.svg',
                  height: 43.0,
                  width: 43.0,
                  allowDrawingOutsideViewBox: true,
                ),
                // type: AlertType.info,
                title: "Ce Theme a deja ete Commencer voulez-vous reprendre",

                // desc: "Voulez-vous continuez ?.",

                buttons: [


                  DialogButton(
                    margin: EdgeInsets.all(15),

                    child: Text(

                      "OUI",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),


                    onPressed:  () {


                      Navigator.of(context, rootNavigator: true ).push(TransitionDroit(
                          page :  EcranQuestions(titrePage: '${ widget.nomTheme}' , NumImage: numQ_Definition + 1)));

                    },


                    color: Colors.green,

                  ) ,
                  DialogButton(
                    margin: EdgeInsets.all(15),

                    child: Text(

                      "NON",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),


                    onPressed:  () {

                      tampon.SuprimerLesResultat();

                      Navigator.of(context, rootNavigator: true ).push(TransitionDroit(

                          page :   EcranQuestions(titrePage: '${ widget.nomTheme}' , NumImage: 0)));




                    },


                    color: Colors.deepOrangeAccent,

                  ) ,


                ],



              ).show();


            }

            // else  if ( tailleListeSauver != 0  ) {
            //     if (numQ_Definition == (tailleListeSauver - 1)) {
            //       Navigator.of(context, rootNavigator: true).push(
            //           TransitionDroit(
            //
            //               page: EcranQuestions(
            //                   titrePage: '${ widget.nomTheme}',
            //                   NumImage: tailleListeSauver)));
            //     }
            //   }



            else {

              Navigator.of(context, rootNavigator: true ).push(TransitionDroit(

                  page :  EcranQuestions(titrePage: '${ widget.nomTheme}' , NumImage: numQ_Definition)));


            }


          }

          else if (widget.nomTheme == "CONDUCTEUR" ) {

            if ( numQ_ConducteurPass > 0) {


              var alertStyle = AlertStyle(
                animationType: AnimationType.fromTop,
                isCloseButton: false,
                isOverlayTapDismiss: true,
                descStyle: TextStyle(fontWeight: FontWeight.bold),
                descTextAlign: TextAlign.start,
                animationDuration: Duration(milliseconds: 500),
                alertBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                titleStyle: TextStyle(
                  color: Colors.green,
                ),
                alertAlignment: Alignment.center,
              );
              Alert(
                context: context,
                style: alertStyle,
                image: SvgPicture.asset(
                  'assets/emoji/happy.svg',
                  height: 43.0,
                  width: 43.0,
                  allowDrawingOutsideViewBox: true,
                ),
                // type: AlertType.info,
                title: "Ce Theme a deja ete Commencer voulez-vous reprendre",

                // desc: "Voulez-vous continuez ?.",

                buttons: [


                  DialogButton(
                    margin: EdgeInsets.all(15),

                    child: Text(

                      "OUI",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),


                    onPressed:  () {

                      Navigator.of(context, rootNavigator: true ).push(TransitionDroit(

                          page :   EcranQuestions(titrePage: '${ widget.nomTheme}' , NumImage: numQ_ConducteurPass)));





                    },


                    color: Colors.green,

                  ) ,
                  DialogButton(
                    margin: EdgeInsets.all(15),

                    child: Text(

                      "NON",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),


                    onPressed:  () {

                      Navigator.of(context, rootNavigator: true ).push(TransitionDroit(
                          page :  EcranQuestions(titrePage: '${ widget.nomTheme}' , NumImage: 0)));




                    },


                    color: Colors.deepOrangeAccent,

                  ) ,


                ],



              ).show();


            }

            else {

              Navigator.of(context, rootNavigator: true ).push(TransitionDroit(

                  page :  EcranQuestions(titrePage: '${ widget.nomTheme}' , NumImage: numQ_ConducteurPass)));






            }

          }
          else if (widget.nomTheme == "FAVORIS" ) {

            Navigator.of(context, rootNavigator: true ).push(TransitionDroit(

                page :  EcranQuestions.C1(titrePage: '${ widget.nomTheme}' )));
          }

          // utilisateurTheme('${item.nomTheme}' ) ;

        },

        child: Container(
          height: double.infinity,

          child: Card(

            color: Colors.white,
            elevation: 0.8,
            shadowColor : Colors.black ,
            margin: EdgeInsets.symmetric(vertical : 5 ,horizontal: 5),


            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),)) ,


            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children:<Widget> [
                Container(

                  alignment: Alignment.center ,
                  padding: EdgeInsets.fromLTRB(13, 0, 13, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        // margin: EdgeInsets.all(3),
                        padding: EdgeInsets.all(2),

                        child: SvgPicture.asset(
                          'assets/iconTheme/${widget.NomImageSVG}.svg',
                          height: 50.0,
                          width: 50.0,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                        height: 10.0,
                       ) ,

                      LinearProgressBar(
                        minHeight: 0.5,

                        maxSteps: 10,
                        currentStep: 1,
                        progressColor: Colors.green,
                        backgroundColor: Colors.black26,
                      ) ,

                      SizedBox(
                        width: 10.0,
                        height: 10.0,
                      ) ,
                      Expanded(
                        child: Text(
                          '${widget.nomTheme}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 11),
                        textAlign: TextAlign.center,
                        ),
                      ),


                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 4.0,
                    bottom: 4.0,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,

                    child: Icon(

                      Icons.cloud_download_outlined,
                      color: Colors.black12,
                      size: 20,
                    )
                  ),
                ),

              ],
            ),
          ),
        ),
      );
  }
}

