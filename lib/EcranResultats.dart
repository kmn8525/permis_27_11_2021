
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:permis/Constantes.dart';
import 'package:permis/resultat/resultatDefinition.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

import 'Dessiner.dart';
import 'EcranQuestions.dart';
import 'EcranSolutions.dart';
import 'QuestionSauvegarder.dart';

final  cleEcranResultat = new GlobalKey<EcranResultatState>();



var listRep = [] ;



 String chemin = 'imageDefinition' ;
int MoyennePoint = 0 ;


class EcranResultat extends StatefulWidget {

  final int indexCourant;
  final String TitreTheme;

  const EcranResultat({Key key, this.indexCourant, this.TitreTheme}) : super(key: key);


  @override
  EcranResultatState createState() => EcranResultatState();

}

enum TtsState { playing, stopped, paused, continued }

class EcranResultatState extends State<EcranResultat>  with ChangeNotifier{



  final  _screenshotController = ScreenshotController();



  var tampon ;


  String  questionTexte ;
  String  option_A;
  String  option_B;
  String  option_C;
  String  liensImage ;


  Color couleurBoutonOption_A  = Colors.white ;
  Color couleurBoutonOption_B  = Colors.white ;
  Color couleurBoutonOption_C  = Colors.white;

  Color couleurSelectionLettre_A  ;
  Color couleurSelectionLettre_B  ;
  Color couleurSelectionLettre_C  ;



  bool clic_bouton_A = true;
  bool clic_bouton_B = true;
  bool clic_bouton_C = true;
  bool fauteGrave;
  bool visibilite_bouton_Suivant = true;

  bool visibilite_bouton_C = false;

  bool desactive_boutonA = false;
  bool desactive_boutonB = false;
  bool desactive_boutonC = false;

  int numeroImage = 1;

  Color couleurChoix ;
  Color couleurAnimation = Colors.white;
  /////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DE VARIABLE  QUI PERMETEENT DE ///////
  // SAUVEGARDER LES QUESTION ET OPTION-------------- /////////
  /////////////////////////////////////////////////////////////////////

  int idQuestion ;
  String question;
  bool fautegrave;
  String explication;
  String  cheminImageSource;
  int numeroImagesource;
  String  cheminQuestionExplication;
  int numeroQuestionAnimationExplication;



  FlutterTts flutterTts;
  dynamic languages;
  //String language;
  double volume = 1.0;
  double pitch = 1.1;
  double rate = 1.0;
  String text_parler ;
  String  id = "";
  String RecuperCleListeFavoris = " " ;


  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;


  Future _getLanguages() async {
    languages = await flutterTts.setLanguage("fr-FR");
    // flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
    if (languages != null) setState(() => languages);
  }

  Future _arretVolume() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future<dynamic> awaitSpeakCompletion(bool awaitCompletion) async {
    await flutterTts.awaitSpeakCompletion(awaitCompletion);

  }
  textFini(){

    flutterTts = FlutterTts();
    flutterTts.setCompletionHandler(() {
    });


    return  ;
  }


  initTts() {
    flutterTts = FlutterTts();

    _getLanguages();

    if (isAndroid || isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          ttsState = TtsState.paused;
        });
      });
      flutterTts.setStartHandler(() {
        setState(() {
          ttsState = TtsState.playing;
        });
      });

      flutterTts.setCompletionHandler(() {
        setState(() {
          ttsState = TtsState.stopped;
        });
      });
      flutterTts.setContinueHandler(() {
        setState(() {
          ttsState = TtsState.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {


        ttsState = TtsState.stopped;
      });
    });
  }



  Future _speak(  ) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (text_parler != null) {
      if (text_parler.isNotEmpty) {
        var result = await flutterTts.speak(text_parler);
        if (result == 1) setState(() => ttsState = TtsState.playing);
      }
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }
  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }


  String statut =" " ;

  Future   <String> _finDeLaVoix() async {
    var result = await flutterTts.stop();
    if (result == 1) {
      return "oui" ;
    }
    else {
      return "non" ;
    }

  }


  void masqueBouton( ) {

    setState(() {

      if ( option_C  == "null" ) {
        visibilite_bouton_C = false ;


      }


      else {
        visibilite_bouton_C = true ;


      }

     });



  }

  Object chargementDonnerQuestion() {
    setState(() {
      if (widget.TitreTheme == 'DEFINITION')  {


        tampon =  ResultatDefinition()  ;
        tampon.RestitutionDesValeurSauvegarder();




      }

      else if (widget.TitreTheme == 'CONDUCTEUR')  {




      }

      else if (widget.TitreTheme == 'FAVORIS')  {

       }

      else if (widget.TitreTheme == 'FAVORIS')  {



      }



      else if (widget.TitreTheme == 'Jeux_Panneaux')  {


      }

      else if (widget.TitreTheme == 'Question_Examen')  {




      }

    });

    return tampon ;
  }



  void ActualisationDesvaleurAsauvegarder()
  {

    idQuestion = tampon.getIdQuestion(widget.indexCourant ) ;
    questionTexte = tampon.getQuestionText(widget.indexCourant ) ;
    fauteGrave = tampon.getFauteGrave(widget.indexCourant ) ;
    explication = tampon.getExplication(widget.indexCourant ) ;
    cheminImageSource = tampon.getCheminImageSourceQuestion(widget.indexCourant ) ;
    numeroImagesource = tampon.getNumeroImageSourceQuestion(widget.indexCourant ) ;
    option_A = tampon.getOptionA(widget.indexCourant ) ;
    option_B = tampon.getOptionB(widget.indexCourant ) ;
    option_C = tampon.getOptionC(widget.indexCourant ) ;

    couleurBoutonOption_A =  tampon.getColoueurBoutonOptionA(widget.indexCourant ) ;
    couleurBoutonOption_B = tampon.getColoueurBoutonOptionB(widget.indexCourant ) ;
    couleurBoutonOption_C = tampon.getColoueurBoutonOptionC(widget.indexCourant ) ;
    couleurSelectionLettre_A  = tampon.getColoueurBoutonLettreOptionA(widget.indexCourant ) ;
    couleurSelectionLettre_B =  tampon.getColoueurBoutonLettreOptionB(widget.indexCourant ) ;
    couleurSelectionLettre_C =  tampon.getColoueurBoutonLettreOptionC(widget.indexCourant ) ;


    print("couleurBoutonOption_AcouleurBoutonOption_A");
    print(couleurBoutonOption_A);

  }
  @override
  void initState() {
    initTts();
    chargementDonnerQuestion();
    ActualisationDesvaleurAsauvegarder();
    masqueBouton( ) ;

    _speak() ;

    super.initState();


  }




// ----- REINITIALISATION DES COULEUR APRES LA PROCHAINE QUESTION ---- //

  void resetColor() {
    setState(() {

    });
  }

  void _checkFin() {

  }

  void _aChoisi(int value) {
  }



  void _likeThis() {
    BoutonSuivant();

  }

  /*void _captureEcran() async {
    final imageFile = await _screenshotController.capture();
    Share.shareFiles([imageFile.path] , subject :'envoie de la question $idQuestion' , text : 'voici de la question ');
  }
*/




  void BoutonSuivant() {
    resetColor();

    Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
        builder: (BuildContext context  ) =>
            EcranSolutions( TitreTheme: widget.TitreTheme, )));


  }




  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
     final Size size = MediaQuery.of(context).size;
      return Scaffold(
      extendBody: true,

      appBar: AppBar(


        title: Row(
          children: <Widget> [

            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text('${widget.TitreTheme}') ,


            ),
            Row(
              children: <Widget> [


                GestureDetector(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(60, 0, 0, 0),

                      child: SvgPicture.asset(
                        'assets/icons/share.svg',
                        height: 25.0,
                        width:  25.0,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                    onTap: () {
                      //_captureEcran();
                      _arretVolume() ;


                    }
                ),


              ],
            ),
          ],
        ),
      ),
      body: Screenshot(
        controller: _screenshotController,

        child: Container(

          /* decoration: BoxDecoration(
            gradient: RadialGradient(
                radius: 1,
                color: [Colors.white, kCouleurBody]
            ),
          ),*/
          height: hauteur,
          child: Stack(
            alignment :  AlignmentDirectional.center,

            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[

                        /////////////////////////////////////////////////////////////////////
                        ///// ---------------   ZONE IMAGE QUESTION  -------------- /////////
                        /////////////////////////////////////////////////////////////////////

                        Expanded(
                          child: Container(
                            child: Image.asset(
                              'assets/$cheminImageSource/source/$numeroImagesource.webp',
                              height: 205,

                            ),
                          ),
                        ),



                      ],
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB( 0, 20, 0, 150),

                      child: Column(
                        children: <Widget>[
                          Wrap(
                            // spacing: 2,
                            runSpacing: -70,
                            children: <Widget>[


                              /////////////////////////////////////////////////////////////////////
                              ///// ---------------   ZONE  QUESTION  -------------- /////////
                              /////////////////////////////////////////////////////////////////////

                              Container(
                                  margin: EdgeInsets.fromLTRB(10, 1, 10, 60),

                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          '$questionTexte'    ,
                                          textAlign : TextAlign.center ,


                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),


                                    ],
                                  )),

                              /////////////////////////////////////////////////////////////////////
                              ///// ---------------   BOUTON  1  -------------- /////////
                              /////////////////////////////////////////////////////////////////////
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(10, 40, 0, 50),

                                        child: Container(
                                          child: AbsorbPointer(
                                            absorbing: desactive_boutonA,
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                                // side: BorderSide(color: Colors.red)
                                              ),
                                              elevation:  1.5,
                                              textColor: Colors.black,
                                              child: Text(
                                              '$option_A'      ,
                                                style: TextStyle(

                                                  color: Colors.black,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              onPressed: () {



                                              },
                                              color: couleurBoutonOption_A ,
                                            ),
                                          ),
                                          height: 50.0,
                                          width: 260,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 25, 10),

                                    child: Container(
                                      child: AbsorbPointer(
                                        absorbing: desactive_boutonA,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            // side: BorderSide(color: Colors.red)
                                          ),
                                          elevation: 1.5,
                                          textColor: Colors.black,

                                            child: Text(
                                              'A',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            ),

                                          onPressed: () {

                                          },
                                          color: couleurSelectionLettre_A ,
                                        ),
                                      ),
                                      height: 35.0,
                                      width:  35.0,
                                    ),
                                  ),
                                ],
                              ),


                              /////////////////////////////////////////////////////////////////////
                              ///// ---------------   BOUTON  2  -------------- /////////
                              /////////////////////////////////////////////////////////////////////
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        //margin: EdgeInsets.all(40),
                                        //  padding: EdgeInsets.fromLTRB(0, 0, 30, 0),

                                        margin: EdgeInsets.fromLTRB(10, 40, 0, 50),                                    child: AbsorbPointer(
                                          absorbing: desactive_boutonB,
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              // side: BorderSide(color: Colors.red)
                                            ),
                                            elevation: 1.5,
                                            textColor: Colors.black,
                                            child: Text(
                                             '$option_B',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15
                                              ),
                                            ),
                                            onPressed: () {


                                             },
                                            color: couleurBoutonOption_B ,
    ),
                                        ),
                                        height: 50.0,
                                        width: 260,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    margin: EdgeInsets.fromLTRB(0, 0, 25, 10),
                                    child: Container(

                                      child: AbsorbPointer(
                                        absorbing: desactive_boutonB,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            // side: BorderSide(color: Colors.red)
                                          ),
                                          elevation: 1.5,
                                          textColor: Colors.black,
                                          child: Center(
                                            child: Text(
                                              'B',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {

                                          },
                                          color: couleurSelectionLettre_B ,
    ),
                                      ),
                                      height: 35.0,
                                      width:  35.0 ,
                                    ),
                                  ),
                                ],
                              ),


                              /////////////////////////////////////////////////////////////////////
                              ///// ---------------   BOUTON  3  -------------- /////////
                              /////////////////////////////////////////////////////////////////////

                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(10, 40, 0, 50),

                                        child: Visibility(
                                          visible: visibilite_bouton_C,
                                          child: Container(
                                            child: AbsorbPointer(
                                              absorbing: desactive_boutonC,
                                              child: RaisedButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  // side: BorderSide(color: Colors.red)
                                                ),
                                                elevation: 1.5,
                                                textColor: Colors.black,
                                                child: Text(
                                                  option_C ,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                onPressed: () {

                                                },
                                                color: couleurBoutonOption_C ,
                                              ),
                                            ),
                                            height: 50,
                                            width: 260,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Visibility(
                                    visible: visibilite_bouton_C,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 25, 10),

                                      child: AbsorbPointer(
                                        absorbing: desactive_boutonC,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            // side: BorderSide(color: Colors.red)
                                          ),
                                          elevation: 1.5,
                                          textColor: Colors.black,
                                          child: Text(
                                            'C',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          onPressed: () {

                                          },
                                          color: couleurSelectionLettre_C ,
                                        ),
                                      ),
                                      height:35.0,
                                      width: 35.0  ,
                                    ),
                                  ),
                                ],
                              ),

                              /////////////////////////////////////////////////////////////////////
                              ///// ---------------   ZONE  Explication  -------------- /////////
                              /////////////////////////////////////////////////////////////////////

                              Visibility(
                                visible: true,

                                child: Container(
                                    margin: EdgeInsets.fromLTRB(10, 50, 10, 20),

                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            '$explication',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        ),


                                      ],
                                    )),
                              ),


                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Positioned(
                bottom: -10,
                child: Stack(
                  alignment :  AlignmentDirectional.topCenter,

                  children:<Widget> [

                    Container(

                      child: CustomPaint(
                        size: Size(size.width, 80),
                        painter:  DessinBasBarNavigation(),
                      ),
                    ),
                    Center(
                      heightFactor: 0.6,
                      child: FloatingActionButton(
                          backgroundColor: Colors.orange,
                          child: Icon(Icons.skip_next_outlined),
                          elevation: 0.1,
                          onPressed: () {
                            _stop() ;
                            _likeThis();

                          }),
                    ),
                    Container(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget> [
                          Container(
                            width: size.width * 0.20,
                          ),


                        ],
                      ),
                    )


                  ] ,

                ),
              ) ,
            ],
          ),
        ),
      ),
      backgroundColor: null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,



    );
  }


  Widget BoutonPlay(BuildContext context) {

     return  GestureDetector(
      child: SizedBox(
        width: 70,
        height: 70 ,
        child: LiquidCircularProgressIndicator(
            backgroundColor : Colors.orange ,
           valueColor: AlwaysStoppedAnimation(Colors.orange),
          center: Row(
            children:  [
              Visibility(
                visible: true,

                child: Expanded(
                  child: Container(
                    child: FlatButton(
                      child: SvgPicture.asset(
                        'assets/icons/play.svg',
                        height: 35.0,
                        width:  35.0,
                        allowDrawingOutsideViewBox: true,
                      ),
                      onPressed: () {
                        _stop() ;
                        _likeThis();


                      },
                    ),

                  ),
                ),

              ),


            ],
          ),

        ),
      ),


    );

  }


}




