import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:permis/EcranIntroJeux.dart';
import 'package:permis/EcranJeux.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'dart:async';
 import 'dart:ui';
import 'Acceuil.dart';
import 'BouttonPanneaux.dart';
import 'Constantes.dart';
import 'Dessiner.dart';
import 'EcranQuestions.dart';
import 'EcranSolutions.dart';
import 'ListeQuestionPanneaux.dart';
import 'TrasitionPages.dart';
import 'Utility.dart';


var tampon  ;
String TitreTheme = 'Jeux_Panneaux';

const Color CouleurApresSelection = Colors.white24 ;



class EcranQuestionPanneaux extends StatefulWidget {


  @override
  EcranQuestionPanneauxState createState() => EcranQuestionPanneauxState();



  Object chargementListesDeQuestionPanneaux() {

    tampon = new  JeuxPanneaux.C1();


    return tampon ;

  }




}


enum TtsState { playing, stopped, paused, continued }

class EcranQuestionPanneauxState extends State<EcranQuestionPanneaux>    with  SingleTickerProviderStateMixin{


  final  _screenshotController = ScreenshotController();

  bool desactive_panneau_A = false;
  bool desactive_panneau_B = false;
  bool desactive_panneau_C = false;
  bool desactive_panneau_D = false;
  bool desactive_panneau_E = false;
  bool desactive_panneau_F = false;
  bool desactive_panneau_G = false;
  bool desactive_panneau_H = false;
  bool desactive_panneau_I = false;




  bool clic_panneau_A = false;
  bool clic_panneau_B = false;
  bool clic_panneau_C = false;
  bool clic_panneau_D = false;
  bool clic_panneau_E = false;
  bool clic_panneau_F = false;
  bool clic_panneau_G = false;
  bool clic_panneau_H = false;
  bool clic_panneau_I = false;

  bool clic_explication = false;


  bool valeur_panneau_A = false;
  bool valeur_panneau_B = false;
  bool valeur_panneau_C = false;
  bool valeur_panneau_D = false;
  bool valeur_panneau_E = false;
  bool valeur_panneau_F = false;
  bool valeur_panneau_G = false;
  bool valeur_panneau_H = false;
  bool valeur_panneau_I = false;



  bool choix_1;
  bool choix_2;
  bool choix_3;

  bool valeur_choisi;

  bool visibilite_bouton_Valider = true;
  bool visibilite_bouton_Suivant = false;

  bool visibilite_zone_1 = true ;
  bool visibilite_zone_2 = false ;
  bool visibilite_zone_3 = false ;
  bool visibilite_zone_reponse = false ;
  bool visibilite_zone_explication = true ;



  Color couleurApresSelection_panneau_A = CouleurApresSelection;
  Color couleurApresSelection_Panneux_B = CouleurApresSelection;
  Color couleurApresSelection_Panneux_C = CouleurApresSelection;
  Color couleurApresSelection_Panneux_D = CouleurApresSelection;
  Color couleurApresSelection_Panneux_E = CouleurApresSelection;
  Color couleurApresSelection_Panneux_F = CouleurApresSelection;
  Color couleurApresSelection_Panneux_G = CouleurApresSelection;
  Color couleurApresSelection_Panneux_H = CouleurApresSelection;
  Color couleurApresSelection_Panneux_I = CouleurApresSelection;


  Color couleurPardefaultPanneux_A = kCouleurBlancGeneral ;
  Color couleurPardefaultPanneux_B = kCouleurBlancGeneral ;
  Color couleurPardefaultPanneux_C = kCouleurBlancGeneral ;
  Color couleurPardefaultPanneux_D = kCouleurBlancGeneral ;
  Color couleurPardefaultPanneux_E = kCouleurBlancGeneral ;
  Color couleurPardefaultPanneux_F = kCouleurBlancGeneral ;
  Color couleurPardefaultPanneux_G = kCouleurBlancGeneral ;
  Color couleurPardefaultPanneux_H = kCouleurBlancGeneral ;
  Color couleurPardefaultPanneux_I = kCouleurBlancGeneral ;

  bool valeurChoisis ;

  String TexteReponseFinal = '' ;
  Color couleurReponse ;
  Color couleurChoix = Colors.red;


  FlutterTts flutterTts;
  dynamic languages;
  //String language;
  double volume = 1.0;
  double pitch = 1.1;
  double rate = 1.0;
  String _text_parler ;
  String valeurTexte ;
  String  id = "";
  String RecuperCleListeFavoris=" " ;
  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;



  double valeurAnimation = 0.0 ;
  Color couleurAnimations = Colors.blue ;
  double debut = 0.0 ;
  double fin  = 1.0;
  Animation<double> animer ;
  AnimationController animationController;




  void _captureEcran() async {
    final imageFile = await _screenshotController.capture();
    Share.shareFiles([imageFile.path] , subject :'envoie de la question ' , text : 'voici de la question ');
  }
    bool valeur_Panneau_Choisi_A() {
    if (clic_panneau_A == true) {
      valeur_choisi = true;
    } else {
      valeur_choisi = null;
    }

    return valeur_choisi;
  }

  bool valeurChoisiB() {
    if (clic_panneau_B == true) {
      valeur_choisi = true;
    } else {
      valeur_choisi = null;
    }

    return valeur_choisi;
  }

  bool valeurChoisiC() {
    if (clic_panneau_C == true) {
      valeur_choisi = true;
    } else {
      valeur_choisi = null;
    }

    return valeur_choisi;
  }
  bool valeurChoisiD() {
    if (clic_panneau_D == true) {
      valeur_choisi = true;
    } else {
      valeur_choisi = null;
    }

    return valeur_choisi;
  }
  bool valeurChoisiE() {
    if (clic_panneau_E == true) {
      valeur_choisi = true;
    } else {
      valeur_choisi = null;
    }

    return valeur_choisi;
  }
  bool valeurChoisiF() {
    if (clic_panneau_F == true) {
      valeur_choisi = true;
    } else {
      valeur_choisi = null;
    }

    return valeur_choisi;
  }
  bool valeurChoisiG() {
    if (clic_panneau_G == true) {
      valeur_choisi = true;
    } else {
      valeur_choisi = null;
    }

    return valeur_choisi;
  }
  bool valeurChoisiH() {
    if (clic_panneau_H == true) {
      valeur_choisi = true;
    } else {
      valeur_choisi = null;
    }

    return valeur_choisi;
  }
  bool valeurChoisiI() {
    if (clic_panneau_I == true) {
      valeur_choisi = true;
    } else {
      valeur_choisi = null;
    }

    return valeur_choisi;
  }


  Future _getLanguages() async {
    languages = await flutterTts.setLanguage("fr-FR");
    // flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
    if (languages != null) setState(() => languages);
  }

  Future<dynamic> awaitSpeakCompletion(bool awaitCompletion) async {
    await flutterTts.awaitSpeakCompletion(awaitCompletion);

  }
  Future _speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (_text_parler != null) {
      if (_text_parler.isNotEmpty) {
        var result = await flutterTts.speak(_text_parler);
        if (result == 1) {
          setState(() => ttsState = TtsState.playing);
        }
      }
    }
  }


  Future _arretVolume() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }
  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
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

           lancerAnimation();


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

  textFini(){

    flutterTts = FlutterTts();
    flutterTts.setCompletionHandler(() {
    });


    return  ;
  }

  double  lancerAnimation(){


     animer = Tween<double>(begin: debut, end: fin).animate(animationController) ;
    animationController.forward();


    animer.addListener(() {

      setState(() {
        valeurAnimation = animer.value ;

      });




      if ( valeurAnimation  > 0.7) {

        setState(() {
          couleurAnimations = Colors.red ;

        });


      }

      if    (animationController.status == AnimationStatus.completed) {




        setState(() {

          visibilite_zone_1 = false ;

          visibilite_bouton_Suivant  = true ;
          visibilite_bouton_Valider = false;
          visibilite_zone_reponse = true ;


          TexteReponseFinal = 'Mauvaise Reponse';

          couleurReponse = Colors.red ;


        });

        animationController.stop();


      }



    });


    return valeurAnimation ;
  }


  void ReinitialisationCouleurEtClicPanneaux() {
    setState(() {


      couleurPardefaultPanneux_A = kCouleurBlancGeneral ;
      couleurPardefaultPanneux_B = kCouleurBlancGeneral ;
      couleurPardefaultPanneux_C = kCouleurBlancGeneral ;
      couleurPardefaultPanneux_D = kCouleurBlancGeneral ;
      couleurPardefaultPanneux_E = kCouleurBlancGeneral ;
      couleurPardefaultPanneux_F = kCouleurBlancGeneral ;
      couleurPardefaultPanneux_G = kCouleurBlancGeneral ;
      couleurPardefaultPanneux_H = kCouleurBlancGeneral ;
      couleurPardefaultPanneux_I = kCouleurBlancGeneral ;



      clic_panneau_A = false;
      clic_panneau_B = false;
      clic_panneau_C = false;
      clic_panneau_D = false;
      clic_panneau_E = false;
      clic_panneau_F = false;
      clic_panneau_G = false;
      clic_panneau_H = false;
      clic_panneau_I = false;

    });
  }
  void BoutonSuivant() {


    ReinitialisationCouleurEtClicPanneaux();

    setState(() {

      if (tampon.FinTheme() == true) {

        _arretVolume();
        animationController.stop();

        var alertStyle = AlertStyle(
          animationType: AnimationType.fromTop,
          isCloseButton: false,
          isOverlayTapDismiss: false,
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
          title: "FIN DE LA SERIE",

          // desc: "Voulez-vous continuez ?.",

          buttons: [


            DialogButton(
              margin: EdgeInsets.all(15),

              child: Text(

                "JEUX",
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),


              onPressed:  () {

                Navigator.of(context, rootNavigator: true ).push(TransitionBas(

                    page :  Accueil( 3 )));

              },


              color: Colors.deepOrangeAccent,

            ) ,

            DialogButton(
              //  padding: EdgeInsets.all(15),

              child: Text(
                "CORRECTION",
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),


              onPressed:  () {

                Navigator.of(context, rootNavigator: false ).push(MaterialPageRoute(
                    builder: (BuildContext context  ) =>
                        EcranSolutions(TitreTheme: '${TitreTheme}' )));

              },

              gradient: LinearGradient(colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0)
              ]),
            )

          ],



        ).show();

      }
      else {






  visibilite_bouton_Valider =  true ;        // le bouton valider est desactiver
  visibilite_bouton_Suivant = false;    // le bouton suivant est afficher

  visibilite_zone_1 = true ;
  visibilite_zone_2 =  false;
  visibilite_zone_3 =  false;
  visibilite_zone_reponse =  false ;


  desactive_panneau_A = false;
  desactive_panneau_B = false;
  desactive_panneau_C = false;
  desactive_panneau_D = false;
  desactive_panneau_E = false;
  desactive_panneau_F = false;
  desactive_panneau_G = false;
  desactive_panneau_H = false;
  desactive_panneau_I = false;




  tampon.questionSuivante();
  animationController.value = 0.0 ;
ActulisationDesvaleurDesPanneaux();
couleurAnimations = Colors.blue ;
  ReinitialisationCouleurEtClicPanneaux();

  StatusTexteParler();

_speak();



      }

    });


  }



  void ActulisationDesvaleurDesPanneaux(){

    valeur_panneau_A = tampon.getReponseA();
    valeur_panneau_B = tampon.getReponseB();
    valeur_panneau_C = tampon.getReponseC();
    valeur_panneau_D = tampon.getReponseD();
    valeur_panneau_E = tampon.getReponseE();
    valeur_panneau_F = tampon.getReponseF();
    valeur_panneau_G = tampon.getReponseG();
    valeur_panneau_H = tampon.getReponseH();
    valeur_panneau_I = tampon.getReponseI();
    valeurTexte =  tampon.getExplication();

  }

  Widget BoutonPlayStop(BuildContext context) {

    return  GestureDetector(
      child: SizedBox(
        width: 70,
        height: 70 ,

        child: LiquidCircularProgressIndicator(
          value: valeurAnimation   ,
          direction: Axis.vertical,
          backgroundColor: Colors.white54,
          valueColor: AlwaysStoppedAnimation(couleurAnimations),
          center: Row(
            children: [
              Visibility(
                visible: visibilite_bouton_Valider,

                child: Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),

                    child: Container(

                      child: SvgPicture.asset(
                        'assets/icons/play.svg',
                        height: 45.0,
                        width:  45.0,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                    onPressed: () {

                       animationController.stop();
                       visibilite_zone_1 = false ;
                       visibilite_zone_2 = false ;
                       visibilite_zone_3 = false ;
                       visibilite_bouton_Suivant = true; // le bouton suivant est afficher
                       visibilite_bouton_Valider = false;
                       visibilite_zone_reponse = true ;
                       TexteReponseFinal = 'Mauvaise Reponse';
                       couleurReponse = Colors.red ;

                       _arretVolume();


                      setState(() {
                       /* visibilite_bouton_explication = true ;
                        visibilite_bouton_sauvegarde = true ;*/




                      });




                     /* Provider.of<Resultats>(context , listen: false).ajoutQuestionResultat(
                          idQuestion , q ,repA , repB , repC , g
                          , explication ,point , cheminImageSource , numeroImagesource  , cheminQuestionAnimationExplication , numeroQuestionAnimationExplication);

                      Provider.of<Resultats>(context , listen: false).ajoutOptionResultat(idOption ,optionA, optionB, optionC);
*/
                      setState(() {
                     //   desactive_panneauA = !desactive_panneauA;

                      });
                    },
                  ),


                ),

              ),
              Visibility(
                visible: visibilite_bouton_Suivant,
                child: Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child:  Container(

                      child: SvgPicture.asset(
                        'assets/icons/suivant.svg',
                        height: 45.0,
                        width:  45.0,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                    onPressed: () {

                      BoutonSuivant();




                    },
                    // color: Colors.blueAccent,
                  ),

                ),
              ),
            ],
          ),
        ),


      ),


    );

  }


  bool EchecReussite( bool x , bool y , bool z) {


    if ((x == null) & (y == null) & (z == null))
    {


    }


  }

  void StatusTexteParler(){

    setState(() {
      _text_parler =  valeurTexte;

    });

   }

  @override
  void initState() {

    animationController = AnimationController(
        duration: const Duration(seconds: 20),  vsync: this) ;


    widget.chargementListesDeQuestionPanneaux();

    initTts() ;
    ActulisationDesvaleurDesPanneaux();
    StatusTexteParler();
   _speak() ;

    super.initState();
  }




  @override
  void dispose() {


    animationController.dispose() ;
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {

    double hauteur = MediaQuery.of(context).size.height;
    final Size size = MediaQuery.of(context).size;

    ActulisationDesvaleurDesPanneaux();

    return Scaffold(
      extendBody: true,

      appBar: AppBar(

        leading:   IconButton(
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            icon:   Icon(
              Icons.arrow_back,
              color: Colors.blueAccent ,
              size: 30,
            ),
            onPressed: () {

              Navigator.pop(context);
              _arretVolume() ;
            }
        ),
        title: Row(
          children: <Widget> [

            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text('$TitreTheme ') ,


            ),
            Expanded(
              child: Container(

                margin: EdgeInsets.only(left: 30),
                child: IconButton(

                    icon:   Icon(
                      Icons.share,
                      color: Colors.black ,
                      size: 30,
                    ),
                    onPressed: () {
                      _captureEcran();
                      _arretVolume() ;


                    }
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),

                child: IconButton(
                    icon:   Icon(
                      Icons.bug_report_outlined,
                      color: Colors.black ,
                      size: 30,
                    ),
                    onPressed: () {
                      _arretVolume() ;


                    }
                ),
              ),
            ),



          ],
        ),
      ),
      body: Screenshot(
        controller: _screenshotController,

        child: Container(

          height: hauteur,
          child: Stack(
            children: <Widget>[
              Column(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  /////////////////////////////////////////////////////////////////////
                  ///// ---------------   ZONE REPONSE  -------------- /////////
                  /////////////////////////////////////////////////////////////////////

                  Visibility(
                    visible: visibilite_zone_reponse,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,

                      child: Column(
                        children: <Widget>[
                          Container(
                          //  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            margin: EdgeInsets.all(2),

                            child: Container(

                                  child: BoutonPanneaux(

                                    couleur: kCouleurBlancGeneral,
                                    WidgetEnfant :
                                    Center(
                                        child: SvgPicture.asset(
                                          'assets/${tampon.CheminImageCorrecte()}/${tampon.CheminNumeroImageCorrecte()}.svg',
                                          width:  100,
                                          height: 300,

                                        ),)
                                    ,
                                    apuyer : (){
                                    } ,
                                    hauteur: 400,
                                    largeur: 350,

                                  )


                            ),
                          ),

                          BoutonPanneaux(

                            couleur: couleurReponse,
                            WidgetEnfant :
                            Center(
                                child: Text (TexteReponseFinal) ,
                            )
                            ,
                            apuyer : (){
                            } ,
                            hauteur: 50,
                            largeur: 300,

                          )




                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,

                    //  padding: EdgeInsets.fromLTRB( 0, 0, 0, 150),

                      child: Column(
                        children: <Widget>[

                          Wrap(
                            // spacing: 2,
                            runSpacing: 40,
                            children: <Widget>[



                              /////////////////////////////////////////////////////////////////////
                              ///// ---------------    ZONE  BOUTON  1  -------------- /////////
                              /////////////////////////////////////////////////////////////////////
                              Visibility(
                                visible : visibilite_zone_1 ,

                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[


                                        Container(

                                    child: Container(


                                      child: AbsorbPointer(
                                              absorbing: desactive_panneau_A,
                                              child: BoutonPanneaux(
                                                couleur :  clic_panneau_A ?
                                                couleurApresSelection_panneau_A
                                                    : couleurPardefaultPanneux_A ,

                                                  WidgetEnfant :
                                                  SvgPicture.asset(
                                                     'assets/${tampon.getCheminImageSourceA()}/${tampon.getNomImageSourceA()}.svg',

                                                   ),
                                                  apuyer : (){

                                                   if ( valeur_panneau_A == false) {

                                                    animationController.stop();

                                                    setState(() {

                                                      visibilite_zone_1 = false ;
                                                      visibilite_zone_2 =   false;
                                                      visibilite_zone_3 =  false;

                                                      visibilite_bouton_Suivant  = !  visibilite_bouton_Suivant ;
                                                      visibilite_bouton_Valider = ! visibilite_bouton_Valider;
                                                      visibilite_zone_reponse = ! visibilite_zone_reponse ;


                                                      TexteReponseFinal = 'Mauvaise Reponse';

                                                      couleurReponse = Colors.red ;
                                                    });


                                                  }
                                                   
                                                   else {

                                                     setState(() {
                                                       desactive_panneau_A = ! desactive_panneau_A ;
                                                       desactive_panneau_B = ! desactive_panneau_B ;
                                                       desactive_panneau_C = ! desactive_panneau_C ;

                                                       clic_panneau_B = ! clic_panneau_B ;
                                                       clic_panneau_C = ! clic_panneau_C ;
                                                       visibilite_zone_2 = ! visibilite_zone_2 ;



                                                     });


                                                   }


                                                    valeur_panneau_A = valeur_Panneau_Choisi_A();

                                                   }  ,

                                                hauteur: 120,
                                                largeur: 100,

                                              )
                                            ),

                                          ),
                                        ),

                                      Container(

                                        child: Container(
                                          child: AbsorbPointer(
                                              absorbing: desactive_panneau_B,
                                              child: BoutonPanneaux(
                                                  couleur: clic_panneau_B ?
                                                  couleurApresSelection_Panneux_B
                                                      : couleurPardefaultPanneux_B,
                                                  WidgetEnfant :
                                                  SvgPicture.asset(
                                                    'assets/${tampon.getCheminImageSourceB()}/${tampon.getNomImageSourceB()}.svg',

                                                  ),
                                                  apuyer : (){

                                                    if ( valeur_panneau_B == false) {

                                                      animationController.stop();

                                                      setState(() {

                                                        visibilite_zone_1 = false ;
                                                        visibilite_zone_2 =   false;
                                                        visibilite_zone_3 =  false;

                                                        visibilite_bouton_Valider = false;
                                                        visibilite_bouton_Suivant  = true ;
                                                        visibilite_zone_reponse = true ;

                                                        TexteReponseFinal = 'Mauvaise Reponse';

                                                        couleurReponse = Colors.red ;


                                                      });


                                                    }


                                                    else {

                                                      setState(() {
                                                        desactive_panneau_A = ! desactive_panneau_A ;
                                                        desactive_panneau_B = ! desactive_panneau_B ;
                                                        desactive_panneau_C = ! desactive_panneau_C ;

                                                        clic_panneau_A = ! clic_panneau_A ;
                                                        clic_panneau_C = ! clic_panneau_C ;

                                                        visibilite_zone_2 = ! visibilite_zone_2 ;



                                                      });


                                                    }

                                                  } ,
                                                hauteur: 120,
                                                largeur: 100,

                                              ) ,
                                          ),

                                        ),
                                      ),

                                      Container(

                                        child: Container(
                                          child: AbsorbPointer(
                                              absorbing: desactive_panneau_C,
                                              child: BoutonPanneaux(
                                                  couleur: clic_panneau_C ?
                                                  couleurApresSelection_Panneux_C
                                                      : couleurPardefaultPanneux_C,
                                                  WidgetEnfant :
                                                  SvgPicture.asset(
                                                    'assets/${tampon.getCheminImageSourceC()}/${tampon.getNomImageSourceC()}.svg',
                                                    height: 40.0,
                                                    width: 40.0,
                                                  ),
                                                  apuyer : (){

                                                    if ( valeur_panneau_C == false) {

                                                      animationController.stop();

                                                      setState(() {

                                                        visibilite_zone_1 = false ;
                                                        visibilite_zone_2 =   false;
                                                        visibilite_zone_3 =  false;
                                                        visibilite_bouton_Suivant  = !  visibilite_bouton_Suivant ;
                                                        visibilite_bouton_Valider = ! visibilite_bouton_Valider;
                                                        visibilite_zone_reponse = ! visibilite_zone_reponse ;


                                                        TexteReponseFinal = 'Mauvaise Reponse';

                                                        couleurReponse = Colors.red ;

                                                      });


                                                    }

                                                    else {

                                                      setState(() {
                                                        desactive_panneau_A = ! desactive_panneau_A ;
                                                        desactive_panneau_B = ! desactive_panneau_B ;
                                                        desactive_panneau_C = ! desactive_panneau_C ;

                                                        clic_panneau_B = ! clic_panneau_B ;
                                                        clic_panneau_A = ! clic_panneau_A ;

                                                        visibilite_zone_2 = ! visibilite_zone_2 ;



                                                      });


                                                    }

                                                  } ,
                                                hauteur: 120,
                                                largeur: 100,

                                              ) ,
                                          ),

                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                              ),


                              /////////////////////////////////////////////////////////////////////
                              ///// ---------------   BOUTON  2  -------------- /////////
                              /////////////////////////////////////////////////////////////////////
                              Visibility(
                                visible : visibilite_zone_2 ,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(

                                        child: Container(
                                          child: AbsorbPointer(
                                              absorbing: desactive_panneau_D,
                                              child: BoutonPanneaux(

                                                  couleur: clic_panneau_D ?
                                                  couleurApresSelection_Panneux_D
                                                      : couleurPardefaultPanneux_D,
                                                  WidgetEnfant :
                                                  SvgPicture.asset(
                                                    'assets/${tampon.getCheminImageSourceD()}/${tampon.getNomImageSourceD()}.svg',
                                                    height: 40.0,
                                                    width: 40.0,
                                                  ),
                                                  apuyer : (){

                                                    if ( valeur_panneau_D == false) {

                                                      animationController.stop();

                                                      setState(() {

                                                        visibilite_zone_1 = false ;
                                                        visibilite_zone_2 =   false;
                                                        visibilite_zone_3 =  false;

                                                        visibilite_bouton_Suivant  = !  visibilite_bouton_Suivant ;
                                                        visibilite_bouton_Valider = ! visibilite_bouton_Valider;
                                                        visibilite_zone_reponse = ! visibilite_zone_reponse ;

                                                        TexteReponseFinal = 'Mauvaise Reponse';

                                                        couleurReponse = Colors.red ;


                                                      });


                                                    }

                                                    else {

                                                      setState(() {
                                                        desactive_panneau_D = ! desactive_panneau_D ;
                                                        desactive_panneau_E = ! desactive_panneau_E ;
                                                        desactive_panneau_F = ! desactive_panneau_F ;

                                                        clic_panneau_E = ! clic_panneau_E ;
                                                        clic_panneau_F = ! clic_panneau_F ;

                                                        visibilite_zone_3 = ! visibilite_zone_3 ;



                                                      });


                                                    }

                                                  } ,
                                                hauteur: 120,
                                                largeur: 100,
                                              ) ,
                                          ),

                                        ),
                                      ),

                                      Container(

                                        child: Container(
                                          child: AbsorbPointer(
                                              absorbing: desactive_panneau_E,
                                              child: BoutonPanneaux(

                                                  couleur: clic_panneau_E ?
                                                  couleurApresSelection_Panneux_E
                                                      : couleurPardefaultPanneux_E,
                                                  WidgetEnfant :
                                                  SvgPicture.asset(
                                                    'assets/${tampon.getCheminImageSourceE()}/${tampon.getNomImageSourceE()}.svg',
                                                    height: 40.0,
                                                    width: 40.0,
                                                  ),
                                                  apuyer : (){


                                                    if ( valeur_panneau_E == false) {

                                                      animationController.stop();

                                                      setState(() {

                                                        visibilite_zone_1 = false ;
                                                        visibilite_zone_2 =   false;
                                                        visibilite_zone_3 =  false;
                                                        visibilite_bouton_Suivant  = !  visibilite_bouton_Suivant ;
                                                        visibilite_bouton_Valider = ! visibilite_bouton_Valider;
                                                        visibilite_zone_reponse = ! visibilite_zone_reponse ;


                                                        TexteReponseFinal = 'Mauvaise Reponse';

                                                        couleurReponse = Colors.red ;

                                                      });


                                                    }

                                                    else {

                                                      setState(() {
                                                        desactive_panneau_D = ! desactive_panneau_D ;
                                                        desactive_panneau_E = ! desactive_panneau_E ;
                                                        desactive_panneau_F = ! desactive_panneau_F ;

                                                        clic_panneau_D = ! clic_panneau_F ;
                                                        clic_panneau_F = ! clic_panneau_F ;

                                                        visibilite_zone_3 = ! visibilite_zone_3 ;



                                                      });


                                                    }

                                                  } ,
                                                hauteur: 120,
                                                largeur: 100,
                                              )
                                          ),

                                        ),
                                      ),

                                      Container(

                                        child: Container(
                                          child: AbsorbPointer(
                                              absorbing: desactive_panneau_F,
                                              child: BoutonPanneaux(
                                                  couleur: clic_panneau_F ?
                                                  couleurApresSelection_Panneux_F
                                                      : couleurPardefaultPanneux_F,
                                                  WidgetEnfant :
                                                  SvgPicture.asset(
                                                    'assets/${tampon.getCheminImageSourceF()}/${tampon.getNomImageSourceF()}.svg',

                                                  ),
                                                  apuyer : (){


                                                    if ( valeur_panneau_F == false) {

                                                      animationController.stop();

                                                      setState(() {

                                                        visibilite_zone_1 = false ;
                                                        visibilite_zone_2 =   false;
                                                        visibilite_zone_3 =  false;
                                                        visibilite_bouton_Suivant  = !  visibilite_bouton_Suivant ;
                                                        visibilite_bouton_Valider = ! visibilite_bouton_Valider;
                                                        visibilite_zone_reponse = ! visibilite_zone_reponse ;

                                                        TexteReponseFinal = 'Mauvaise Reponse';

                                                        couleurReponse = Colors.red ;


                                                      });


                                                    }

                                                    else {

                                                      setState(() {
                                                        desactive_panneau_D = ! desactive_panneau_D ;
                                                        desactive_panneau_E = ! desactive_panneau_E ;
                                                        desactive_panneau_F = ! desactive_panneau_F ;

                                                        clic_panneau_D = ! clic_panneau_F ;
                                                        clic_panneau_E = ! clic_panneau_E ;

                                                        visibilite_zone_3 = ! visibilite_zone_3 ;


                                                      });


                                                    }

                                                  } ,
                                                hauteur: 120,
                                                largeur: 100,

                                              ) ,
                                          ),

                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                              ),

                              /////////////////////////////////////////////////////////////////////
                              ///// ---------------   BOUTON  3  -------------- /////////
                              /////////////////////////////////////////////////////////////////////

                              Visibility(
                                visible : visibilite_zone_3 ,

                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(

                                        child: Container(
                                          child: AbsorbPointer(
                                              absorbing: clic_panneau_G,
                                              child: BoutonPanneaux(

                                                  couleur: clic_panneau_G ?
                                                  couleurApresSelection_Panneux_G
                                                      : couleurPardefaultPanneux_G,
                                                  WidgetEnfant :
                                                  SvgPicture.asset(
                                                    'assets/${tampon.getCheminImageSourceG()}/${tampon.getNomImageSourceG()}.svg',

                                                  ),
                                                  apuyer : (){

                                                    if ( valeur_panneau_G == false) {

                                                      animationController.stop();

                                                      setState(() {

                                                        visibilite_zone_1 = false ;
                                                        visibilite_zone_2 =   false;
                                                        visibilite_zone_3 =  false;

                                                        visibilite_bouton_Suivant  = !  visibilite_bouton_Suivant ;
                                                        visibilite_bouton_Valider = ! visibilite_bouton_Valider;
                                                        visibilite_zone_reponse = ! visibilite_zone_reponse ;

                                                        TexteReponseFinal = 'Mauvaise Reponse';

                                                        couleurReponse = Colors.red ;


                                                      });


                                                    }

                                                    else {

                                                      setState(() {
                                                        visibilite_zone_1 = false ;
                                                        visibilite_zone_2 = false ;
                                                        visibilite_zone_3 = false ;

                                                        visibilite_bouton_Suivant  =  true ;
                                                        visibilite_bouton_Valider = false ;
                                                        visibilite_zone_reponse = true  ;

                                                        TexteReponseFinal = 'Bravo';

                                                        couleurReponse = Colors.green ;
                                                        couleurAnimations = Colors.blue ;

                                                        animationController.stop();


                                                      });


                                                    }

                                                  } ,
                                                hauteur: 120,
                                                largeur: 100,

                                              )
                                          ),

                                        ),
                                      ),

                                      Container(

                                        child: Container(
                                          child: AbsorbPointer(
                                              absorbing: clic_panneau_H,
                                              child: BoutonPanneaux(

                                                  couleur: clic_panneau_H ?
                                                  couleurApresSelection_Panneux_H
                                                      : couleurPardefaultPanneux_H,
                                                  WidgetEnfant :
                                                  SvgPicture.asset(
                                                    'assets/${tampon.getCheminImageSourceH()}/${tampon.getNomImageSourceH()}.svg',

                                                  ),
                                                  apuyer : (){

                                                    if ( valeur_panneau_H == false) {

                                                      animationController.stop();

                                                      setState(() {

                                                        visibilite_zone_1 = false ;
                                                        visibilite_zone_2 =   false;
                                                        visibilite_zone_3 =  false;

                                                        visibilite_bouton_Suivant  = !  visibilite_bouton_Suivant ;
                                                        visibilite_bouton_Valider = ! visibilite_bouton_Valider;
                                                        visibilite_zone_reponse = ! visibilite_zone_reponse ;

                                                        TexteReponseFinal = 'Mauvaise Reponse';

                                                        couleurReponse = Colors.red ;


                                                      });


                                                    }

                                                    else {

                                                      setState(() {
                                                        visibilite_zone_1 = false ;
                                                        visibilite_zone_2 = false ;
                                                        visibilite_zone_3 = false ;

                                                        visibilite_bouton_Suivant  =  true ;
                                                        visibilite_bouton_Valider = false ;
                                                        visibilite_zone_reponse = true  ;

                                                        TexteReponseFinal = 'Bravo';

                                                        couleurReponse = Colors.green ;
                                                        couleurAnimations = Colors.blue ;

                                                        animationController.stop();


                                                      });


                                                    }
                                                  } ,
                                                hauteur: 120,
                                                largeur: 100,

                                              )
                                          ),

                                        ),
                                      ),

                                      Container(

                                        child: Container(
                                          child: AbsorbPointer(
                                              absorbing: clic_panneau_I,
                                              child: BoutonPanneaux(

                                                  couleur: clic_panneau_I ?
                                                  couleurApresSelection_Panneux_I
                                                      : couleurPardefaultPanneux_I,
                                                  WidgetEnfant :
                                                  SvgPicture.asset(
                                                    'assets/${tampon.getCheminImageSourceI()}/${tampon.getNomImageSourceI()}.svg',

                                                  ),
                                                  apuyer : (){

                                                    if ( valeur_panneau_I == false) {

                                                      animationController.stop();

                                                      setState(() {

                                                        visibilite_zone_1 = false ;
                                                        visibilite_zone_2 =   false;
                                                        visibilite_zone_3 =  false;
                                                        visibilite_bouton_Suivant  = !  visibilite_bouton_Suivant ;
                                                        visibilite_bouton_Valider = ! visibilite_bouton_Valider;
                                                        visibilite_zone_reponse = ! visibilite_zone_reponse ;

                                                        TexteReponseFinal = 'Mauvaise Reponse';

                                                        couleurReponse = Colors.red ;

                                                        animationController.stop();

                                                      });


                                                    }

                                                    else {

                                                      setState(() {
                                                        visibilite_zone_1 = false ;
                                                        visibilite_zone_2 = false ;
                                                        visibilite_zone_3 = false ;

                                                        visibilite_bouton_Suivant  =  true ;
                                                        visibilite_bouton_Valider = false ;
                                                        visibilite_zone_reponse = true  ;

                                                        TexteReponseFinal = 'Bravo';

                                                        couleurReponse = Colors.green ;
                                                        couleurAnimations = Colors.blue ;


                                                      });


                                                    }
                                                  } ,
                                                hauteur: 120,
                                                largeur: 100,

                                              )
                                          ),

                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                              ),


                            ],

                          ),

                        ],
                      ),
                    ),
                  ),
                  /////////////////////////////////////////////////////////////////////
                  ///// ---------------    ZONE  EXPLICATION  -------------- /////////
                  /////////////////////////////////////////////////////////////////////

                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Visibility(
                      visible: visibilite_zone_explication,


                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 0, 100),

                            child: Container(
                                child: BoutonPanneaux(

                                  couleur: kCouleurBlancGeneral,
                                  WidgetEnfant :
                                  Center(child: Text ('${tampon.getExplication()}' ))
                                  ,
                                  apuyer : (){
                                  } ,
                                  hauteur: 100,
                                  largeur: 350,

                                )


                            ),
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

                    CustomPaint(
                      size: Size(size.width, 90),
                      painter:  DessinBasBarNavigation(),
                    ),
                    Center(
                      heightFactor: 0.5,
                      child: RawMaterialButton(
                        elevation: 25 ,
                        fillColor: Colors.white,
                        shape: CircleBorder(),
                        child:   BoutonPlayStop(context),


                      ),

                    ),


                  ] ,

                ),
              ) ,
            ],
          ),
        ),
      ),




    );
  }
}

