
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:permis/Constantes.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

import 'Dessiner.dart';
import 'EcranQuestions.dart';
import 'EcranSolutions.dart';
import 'ListeResultats.dart';

final  cleEcranResultat = new GlobalKey<EcranResultatState>();



var listRep = [] ;



var tampon  ;
String chemin = 'imageDefinition' ;
int MoyennePoint = 0 ;


class EcranResultat extends StatefulWidget {

  final int indexCourant;
  final String Titre;

  const EcranResultat({Key key, this.indexCourant, this.Titre}) : super(key: key);


  @override
  EcranResultatState createState() => EcranResultatState();

}

enum TtsState { playing, stopped, paused, continued }

class EcranResultatState extends State<EcranResultat>  with ChangeNotifier{


  final  _screenshotController = ScreenshotController();

  List listeQuestionResultat ;
  List listeChoixResultat ;
  List verification ;

  String questionTexte ;
 String option_A;
 String option_B;
 String  option_C;
 String liensImage ;


  Color couleurBouton_A  = Colors.white ;
  Color couleurBouton_B  = Colors.white ;
  Color couleurBouton_C  = Colors.white;

  Color couleurSelection_A  ;
  Color couleurSelection_B  ;
  Color couleurSelection_C  ;



  bool clic_bouton_A = true;
  bool clic_bouton_B = true;
  bool clic_bouton_C = true;

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

  String idQuestion ;
  String idOption;
  String q;
  bool g;
  String e;
  bool repA;
  bool repB;
  bool repC;
  String  cheminImageSource;
  int numImagesource;
  String  cheminQuestionExplication;
  int numeroQuestionExplication;

  String optionA;
  String optionB;
  String optionC;

  FlutterTts flutterTts;
  dynamic languages;
  //String language;
  double volume = 1.0;
  double pitch = 1.1;
  double rate = 1.0;
  String text_parler ;
  String  id = "";
  String RecuperCleListeFavoris=" " ;


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

      if ( option_C  == 'null' ) {
        visibilite_bouton_C = false ;


      }


      else {
        visibilite_bouton_C = true ;


      }

     });



  }


  @override
  void initState() {
    initTts();
    listeQuestionResultat =  Provider.of<Resultats>(context , listen: false).listeQuestionResultat() ;
    listeChoixResultat =  Provider.of<Resultats>(context , listen: false).listeOption();

    questionTexte =  Provider.of<Resultats>(context , listen: false).getQuestionText(widget.indexCourant);
    option_A =  Provider.of<Resultats>(context , listen: false).getOptionA(widget.indexCourant);
    option_B = Provider.of<Resultats>(context , listen: false).getOptionB(widget.indexCourant);
    option_C = Provider.of<Resultats>(context , listen: false).getOptionC(widget.indexCourant);

    couleurBouton_A =   Provider.of<Resultats>(context , listen: false).getColoueurBoutonA(widget.indexCourant);
    couleurBouton_B =   Provider.of<Resultats>(context , listen: false).getColoueurBoutonB(widget.indexCourant);
    couleurBouton_C =   Provider.of<Resultats>(context , listen: false).getColoueurBoutonC(widget.indexCourant);

    couleurSelection_A  = Provider.of<Resultats>(context , listen: false).getColoueurSelectionA(widget.indexCourant);
    couleurSelection_B  = Provider.of<Resultats>(context , listen: false).getColoueurSelectionB(widget.indexCourant);
    couleurSelection_C  = Provider.of<Resultats>(context , listen: false).getColoueurSelectionC(widget.indexCourant);



    liensImage =  Provider.of<EcranQuestionsState>(context , listen: false).liensImageImageSource();
    text_parler =  Provider.of<Resultats>(context , listen: false).getExplication(widget.indexCourant);

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

  void _captureEcran() async {
    final imageFile = await _screenshotController.capture();
    Share.shareFiles([imageFile.path] , subject :'envoie de la question $idQuestion' , text : 'voici de la question ');
  }





  void BoutonSuivant() {
    resetColor();

    Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
        builder: (BuildContext context  ) =>
            EcranSolutions( TitreTheme: widget.Titre, )));


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
              child: Text('${widget.Titre}') ,


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
                      _captureEcran();
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
                              'assets/$liensImage/source/${widget.indexCourant + 1}.webp',
                              height: 223,

                            ),
                          ),
                        ),



                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(1),
                      child: Column(
                        children: [

                          /////////////////////////////////////////////////////////////////////
                          ///// ---------------   ZONE  QUESTION  -------------- /////////
                          /////////////////////////////////////////////////////////////////////

                          Container(
                            margin: EdgeInsets.fromLTRB(10, 1, 10, 60),

                            child: Text(
                              ' $questionTexte' ,

                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),


                        ],
                      )),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB( 0, 0, 0, 50),

                      child: Column(
                        children: <Widget>[
                          Wrap(
                            // spacing: 2,
                            runSpacing: -70,
                            children: <Widget>[

                              /////////////////////////////////////////////////////////////////////
                              ///// ---------------   BOUTON  1  -------------- /////////
                              /////////////////////////////////////////////////////////////////////
                              Row(
                                children: <Widget>[
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 40, 30, 50),

                                      child: Container(
                                        child: AbsorbPointer(
                                          absorbing: desactive_boutonA,
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              // side: BorderSide(color: Colors.red)
                                            ),
                                            elevation: 3,
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
                                            color: couleurBouton_A ,
                                          ),
                                        ),
                                        height: 60.0,
                                        width: 260,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),

                                    child: Container(
                                      child: AbsorbPointer(
                                        absorbing: desactive_boutonA,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            // side: BorderSide(color: Colors.red)
                                          ),
                                          elevation: 3,
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
                                          color: couleurSelection_A ,
                                        ),
                                      ),
                                      height: 40.0,
                                      width:  40,
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
                                  Center(
                                    child: Container(
                                      //margin: EdgeInsets.all(40),
                                      //  padding: EdgeInsets.fromLTRB(0, 0, 30, 0),

                                      margin: EdgeInsets.fromLTRB(40, 40, 20, 50),                                    child: AbsorbPointer(
                                        absorbing: desactive_boutonB,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            // side: BorderSide(color: Colors.red)
                                          ),
                                          elevation: 3,
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
                                          color: couleurBouton_B ,
    ),
                                      ),
                                      height: 60.0,
                                      width: 260,
                                    ),
                                  ),
                                  Container(
                                    // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Container(

                                      child: AbsorbPointer(
                                        absorbing: desactive_boutonB,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            // side: BorderSide(color: Colors.red)
                                          ),
                                          elevation: 3,
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
                                          color: couleurSelection_B ,
    ),
                                      ),
                                      height: 40.0,
                                      width:  40.0,
                                    ),
                                  ),
                                ],
                              ),


                              /////////////////////////////////////////////////////////////////////
                              ///// ---------------   BOUTON  3  -------------- /////////
                              /////////////////////////////////////////////////////////////////////

                              Row(
                                children: <Widget>[
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(40, 40, 20, 50),

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
                                              elevation: 3,
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
                                              color: couleurBouton_C ,
                                            ),
                                          ),
                                          height: 60,
                                          width: 260,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Visibility(
                                    visible: visibilite_bouton_C,
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),

                                      child: AbsorbPointer(
                                        absorbing: desactive_boutonC,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            // side: BorderSide(color: Colors.red)
                                          ),
                                          elevation: 3,
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
                                          color: couleurSelection_C ,
                                        ),
                                      ),
                                      height: 52.0,
                                      width:  40,
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
                                            '$text_parler',
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




