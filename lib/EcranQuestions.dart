import 'dart:async';
import 'dart:io';
import 'dart:ui';

 import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:permis/Acceuil.dart';
import 'package:permis/resultat/resultatDefinition.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:sp_util/sp_util.dart';
import 'package:toast/toast.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
 import 'Dessiner.dart';
import 'EcranSolutions.dart';
import 'ListeConducteurPassager.dart';
import 'ListeDefinition.dart';
import 'ListeFavoris.dart';
import 'Constantes.dart';



import 'Option.dart';
import 'Question.dart';
import 'TrasitionPages.dart';
import 'Utility.dart';



var tampon  ;
var listecharger ;

String TitreTheme ;
int MoyennePoint = 0 ;


class EcranQuestions extends StatefulWidget  {


  String titrePage;
  int NumImage ;



  EcranQuestions({Key key , this.titrePage, this.NumImage}) : super(key: key);
  EcranQuestions.C1({Key key , this.titrePage}) : super(key: key);


  @override
  EcranQuestionsState createState() => EcranQuestionsState();


  Object chargementDonnerQuestion() {

    if (titrePage == 'DEFINITION') {
       tampon =   Definition.C1(NumImage);



    }

    else if (titrePage == 'CONDUCTEUR') {
      {
         tampon =    ConducteurPassager.C1(NumImage);

        }
    }
    else if (titrePage == 'FAVORIS') {
        tampon =    FavorisState();


    }
    else if (titrePage == 'INJONCTIONS') {
      {
        /*var i = () => Incjontion();
        tampon = i();*/
      }
    }
    else if (titrePage == 'FEUX') {
      {
       /* var f = () => Feux();
        tampon = f();*/
      }
    }

    return tampon ;

  }


    Object chargementTitreTheme() {

    if (titrePage == 'DEFINITION') {
      TitreTheme = 'DEFINITION' ;
    }

    else if (titrePage == 'CONDUCTEUR') {
      {
        TitreTheme = 'CONDUCTEUR' ;


      }
    }
    else if (titrePage == 'INJONCTIONS') {
      {
        TitreTheme = 'INJONCTIONS' ;


      }
    }
    else if (titrePage == 'FEUX') {
      {
        TitreTheme = 'FEUX' ;

      }

    }

    else if (titrePage ==  'disk') {

      TitreTheme = 'disk' ;
    }


    return TitreTheme ;

  }



}

enum TtsState { playing, stopped, paused, continued }


class EcranQuestionsState extends State<EcranQuestions>  with ChangeNotifier , SingleTickerProviderStateMixin {

   final  _screenshotController = ScreenshotController();



  bool verifi = false ;
  String cleNumQD = "qd";

  String cleNumCD = "cd";
  String cleNumQCO = "qco";

  String cleNumCCO = "cco";

  int nbCD  ;
  int nbQCO  ;
  int nbQCCO  ;
  int i ;
  String RecupereCleQuestionDefinition=""  ;
  String RecupereCleQuestionConducteurPass=""  ;





    bool verifExisteQuestion   ;
   /*Color getColor(int value ) {
     if (value > 0 && value < 100) return Colors.red;
     if (value >= 100 && value < 200) return Colors.blue;

   }*/

  Color couleurPardefaulOptiont_A =  kcouleurBlanche ;
  Color couleurPardefaultOption_B =  kcouleurBlanche ;
  Color couleurPardefaultOption_C =  kcouleurBlanche ;

  Color couleurPardefault_bouton_Explication =      kcouleurBleu ;
  Color couleurApresSelection_bouton_Explication =  kcouleurBleu ;
  Color couleurBouton_AvantSauvegarde  = kcouleurGris ;
  Color couleurBouton_ApresSauvegarde  =  kcouleurBleu ;


  Color couleurApresSelection_OptionA = kcouleurOrange;
  Color couleurApresSelection_OptionB = kcouleurOrange;
  Color couleurApresSelection_OptionC = kcouleurOrange;

   Color couleurLettreOption_A =  kcouleurBlanche ;
   Color couleurLettreOption_B =  kcouleurBlanche ;
   Color couleurLettreOption_C =  kcouleurBlanche ;

  String couleurSauvegardeOption_A =  " " ;
  String couleurSauvegardeOption_B =  " " ;
  String couleurSauvegardeOption_C =  " " ;

  String couleurSauvegardeLettreOption_A = " " ;
  String couleurSauvegardeLettreOption_B = " " ;
  String couleurSauvegardeLettreOption_C = " " ;

   String couleurStringBouton_A = " " ;
   String couleurStringBouton_B = " " ;
   String couleurStringBouton_C = " " ;


   String couleurStringLettre_A = " " ;
   String couleurStringLettre_B = " " ;
   String couleurStringLettre_C = " " ;

   String couleurStringChoixUtilisateur = " " ;
   String couleurSauvegarChoixUtilisateur = " " ;


   bool choix_1;
   bool choix_2;
   bool choix_3;
   bool valeur_choisi;
   int  point ;


   bool clic_bouton_A = false;
   bool clic_bouton_B = false;
   bool clic_bouton_C = false;
   bool clic_bouton_explication = false;
   bool clic_bouton_sauvegarde = false;


   bool visibilite_bouton_Valider = true;
   bool visibilite_bouton_explication = false;
   bool visibilite_bouton_sauvegarde = false;

   bool visibilite_bouton_Suivant = false;
   bool visibilite_bouton_C = false;
   bool visibilite_zoneExplication = false ;





   bool desactive_boutonA = false;
   bool desactive_boutonB = false;
   bool desactive_boutonC = false;
   bool desactive_bouton_Explication= false;
   bool desactive_bouton_Sauvegarde = false;

   String _tf = 'Aucun texte saisi';
   String _tfS = 'Aucun texte soumis';
   String _cTf = 'Aucun texte saisi';
   String _cTfS = 'Aucun texte soumis';
   String selectedCurrency = "Il y a une erreur dans le contenue";

   String dropdownValue = 'One';




  FlutterTts flutterTts;
  dynamic languages;
  //String language;
  double volume = 2.0;
  double pitch = 1;
  double rate = 0.55;
  String _text_parler ;
  String  id = "";
  String RecuperCleListeFavoris=" " ;





       /////////////////////////////////////////////////////////////////////
        ///// ---------------   LISTE DE VARIABLE  QUI PERMETEENT DE ///////
                   // SAUVEGARDER LES QUESTION ET OPTION-------------- /////////
      /////////////////////////////////////////////////////////////////////

  int idQuestion ;
  String explication ;
  String questionTexte;
  bool fauteGrave;
  String explications;
  bool reponse_A;
  bool reponse_B;
  bool reponse_C;
  String  cheminImageSource;
  int numeroImagesource;
  String  cheminQuestionAnimationExplication;
  int numeroQuestionAnimationExplication;

  String option_A;
  String option_B;
  String option_C;
  /////////////////////////////////////////////////////////////////////
  //---------/////////////////////////////////------------//


 bool etatIdQuestion ;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  Color couleurChoix = kcouleurRouge;
   Color CouleurAchoisi = kcouleurBlanche;

   Future _getLanguages() async {
     languages = await flutterTts.setLanguage("fr-FR");
     // flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
     if (languages != null) setState(() => languages);
   }

  String liensImageImageSource (){

    return tampon.getCheminImageSourceQuestion() ;
  }


  String ChargeTitrePages (){

    return widget.titrePage ;
  }

  Future<dynamic> awaitSpeakCompletion(bool awaitCompletion) async {
    await flutterTts.awaitSpeakCompletion(awaitCompletion);

  }


   void _captureEcran() async {
     final imageFile = await _screenshotController.capture();
     //Share.shareFiles([imageFile.path] , subject :'envoie de la question $idQuestion' , text : 'voici de la question ');
   }


  void ActualisationDesvaleurAsauvegarder(){

  idQuestion = tampon.getIdQuestion();
  questionTexte = tampon.getQuestionText();
  fauteGrave = tampon.getFauteGrave() ;
  reponse_A = tampon.getReponseA() ;
  reponse_B = tampon.getReponseB() ;
  reponse_C = tampon.getReponseC() ;
  explication = tampon.getExplication();

  cheminImageSource = tampon.getCheminImageSourceQuestion() ;
  numeroImagesource = tampon.getNumeroImageSourceQuestion() ;

  option_A = tampon.getOptionA() ;
  option_B = tampon.getOptionB();
  option_C = tampon.getOptionC();

}


   void ActualisationValeurAnimations() {

     cheminImageAnimations = tampon.getCheminImageAnimations() ;
     numeroImageA = tampon.getNumeroImageA();
     VisibiliteAnimation_A  = tampon.getVisibiliteA();
     DescriptionA = tampon.getDescriptionA();
     positionGaucheA  = tampon.getPositionGaucheA();
     positionHautA  = tampon.getPositionHautA();
     positionDroiteA  = tampon.getPositionDroiteA();
     positionBasA  = tampon.getPositionBasA();
     hauteurA  = tampon.getHauteurA ();
     largeurA  = tampon.getLargeurA ();


     numeroImageB = tampon.getNumeroImageB();
     VisibiliteAnimation_B = tampon.getVisibiliteB();
     DescriptionB = tampon.getDescriptionB();
     positionGaucheB  = tampon.getPositionGaucheB();
     positionHautB  = tampon.getPositionHautB();
     positionDroiteB  = tampon.getPositionDroiteB();
     positionBasB  = tampon.getPositionBasB();
     hauteurB  = tampon.getHauteurB ();
     largeurB  = tampon.getLargeurB ();


     numeroImageC = tampon.getNumeroImageC();
     VisibiliteAnimation_C  = tampon.getVisibiliteC();
     DescriptionC = tampon.getDescriptionC();
     positionGaucheC  = tampon.getPositionGaucheC();
     positionHautC  = tampon.getPositionHautC();
     positionDroiteC = tampon.getPositionDroiteC();
     positionBasC  = tampon.getPositionBasC();
     hauteurC  = tampon.getHauteurC ();
     largeurC  = tampon.getLargeurC ();


     numeroImageD = tampon.getNumeroImageD();
     VisibiliteAnimation_D  = tampon.getVisibiliteD();
     DescriptionD = tampon.getDescriptionD();
     positionGaucheD  = tampon.getPositionGaucheD();
     positionHautD  = tampon.getPositionHautD();
     positionDroiteD  = tampon.getPositionDroiteD();
     positionBasD  = tampon.getPositionBasD();
     hauteurD  = tampon.getHauteurD();
     largeurD  = tampon.getLargeurD();


     numeroImageE = tampon.getNumeroImageE();
     VisibiliteAnimation_E  = tampon.getVisibiliteE();
     DescriptionE = tampon.getDescriptionE();
     positionGaucheE  = tampon.getPositionGaucheE();
     positionHautE  = tampon.getPositionHautE();
     positionDroiteE  = tampon.getPositionDroiteE();
     positionBasE  = tampon.getPositionBasE();
     hauteurE  = tampon.getHauteurE ();
     largeurE = tampon.getLargeurE ();



   }



   bool   StatutQuestionSauvegarder(){


     setState(() {
       verifExisteQuestion =  Provider.of<FavorisState>(context , listen: false).VerificationQuestionFavoris(idQuestion) ;

     });





return  verifExisteQuestion ;

   }




var test ;
  @override
  void initState() {


    RecupereCleQuestionDefinition =  Provider.of<Definition>(context , listen: false).getCleNumQueDef ;
   setState(() {
     test =  SpUtil.getObjList('cqf', (v) => Question.fromJson(v as Map<String, dynamic>));

   });



    RecupereCleQuestionConducteurPass =  Provider.of<ConducteurPassager>(context , listen: false).getCleNumQueCondPass ;

    widget.chargementDonnerQuestion();
    widget.chargementTitreTheme();
    StatutQuestionSauvegarder();

    masqueBouton( ) ;
    ActualisationValeurAnimations();

    MiseAjourVisibiliteAnimation();
    ChargeTitrePages () ;
    resetColor();
    initialisation_Tts();
    _speak() ;
    visibilite_bouton_explication = false ;
    visibilite_bouton_sauvegarde = false ;



    super.initState();



  }





  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }



    textFini(){

    flutterTts = FlutterTts();
     flutterTts.setCompletionHandler(() {
     });


    return  ;
  }


  initialisation_Tts() {
    flutterTts = FlutterTts();

    _getLanguages();

    if (isAndroid || isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          ttsState = TtsState.paused;

        });

        _arretDeLaVOix();
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
    flutterTts.setProgressHandler(
            (String text, int startOffset, int endOffset, String word) {



             /* setState(() {


                if (word == "boire" ) {


                  _text_parler = _text_parler.replaceAll("boire", " ") ;

                  for ( int i = 0 ; i <_text_parler.length ; i++ ) {

                    print(_text_parler[i]);

                  }


                 }




              });*/
        });


  }

  Future _speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (_text_parler != null) {
      if (_text_parler.isNotEmpty) {
        var result = await flutterTts.speak(_text_parler);
        if (result == 1) setState(() => ttsState = TtsState.playing);
      }
    }
  }

  Future _arretDeLaVOix() async {
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

       /////// ----------------------------------------- ////////
        ////// -----  VARIABLES ANIMATION DES QUESTION ---- //////
    ////////////// // ----------------------------------------- /////////


   TutorialCoachMark tutorialCoachMark;
   List<TargetFocus> targets = <TargetFocus>[];
    GlobalKey keyButton1 = GlobalKey();
    GlobalKey keyButton2 = GlobalKey();
    GlobalKey keyButton3 = GlobalKey();
    GlobalKey keyButton4 = GlobalKey();
    GlobalKey keyButton5 = GlobalKey();




   int valuerActuelIndiceAnimation = 0 ;
   String  cheminImageAnimations;

   int     numeroImageA;
   bool    VisibiliteAnimation_A = false  ;
   String  DescriptionA;
   double  positionGaucheA ;
   double  positionHautA ;
   double  positionDroiteA ;
   double  positionBasA ;
   double  hauteurA ;
   double  largeurA ;

   int     numeroImageB;
   bool    VisibiliteAnimation_B = false ;
   String  DescriptionB;
   double  positionGaucheB ;
   double  positionHautB ;
   double  positionDroiteB ;
   double  positionBasB ;
   double  hauteurB ;
   double  largeurB ;

   int     numeroImageC;
   bool    VisibiliteAnimation_C = false ;
   String  DescriptionC;
   double  positionGaucheC ;
   double  positionHautC ;
   double  positionDroiteC;
   double  positionBasC ;
   double  hauteurC ;
   double  largeurC ;

   int     numeroImageD;
   bool    VisibiliteAnimation_D = false ;
   String  DescriptionD;
   double  positionGaucheD ;
   double  positionHautD ;
   double  positionDroiteD ;
   double  positionBasD ;
   double  hauteurD ;
   double  largeurD ;

   int     numeroImageE;
   bool    VisibiliteAnimation_E  = false;
   String  DescriptionE;
   double  positionGaucheE ;
   double  positionHautE ;
   double  positionDroiteE ;
   double  positionBasE ;
   double  hauteurE ;
   double  largeurE ;


   void MiseAjourVisibiliteAnimation() {

     setState(() {

       VisibiliteAnimation_A = false ;
       VisibiliteAnimation_B = false ;
       VisibiliteAnimation_C = false ;
       VisibiliteAnimation_D = false ;
       VisibiliteAnimation_E = false ;

     });


   }



   void initialisationDesZoneDetailler ( ) {

     targets.add(
       TargetFocus(
         enableOverlayTab : true ,

         identify: "0",
         keyTarget: keyButton1,
         contents: [
           TargetContent(
               align: ContentAlign.bottom,
               child: Container(
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text(
                       "${DescriptionA}",
                       style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
                     ),

                   ],
                 ),
               ))

         ],
         shape: ShapeLightFocus.RRect,
         ),
     );

     targets.add(
       TargetFocus(
         enableOverlayTab : true ,

         identify: "1",
         keyTarget: keyButton2,
         contents: [
           TargetContent(
               align: ContentAlign.right,
               child: Container(
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text(
                       "${DescriptionB}",
                       style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
                     ),

                   ],
                 ),
               ))
         ],
          radius: 2,
        ),
     );

     targets.add(
         TargetFocus(
           enableOverlayTab : true ,
           identify: "2",
           keyTarget: keyButton3,
           contents: [
             TargetContent(
                  child: Container(
                   child: Column(
                     mainAxisSize: MainAxisSize.min,
                     children: <Widget>[

                        Text(
                           "${DescriptionC}",
                           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                       ),

                     ],
                   ),
                 )),

           ],
           shape: ShapeLightFocus.Circle,
           radius: 2,
           paddingFocus : 2 ,
         ));
     targets.add(
         TargetFocus(
           enableOverlayTab : true ,
           identify: "3",
           keyTarget: keyButton4,
           contents: [
             TargetContent(
                 align: ContentAlign.top,
                 child: Container(
                   child: Column(
                     mainAxisSize: MainAxisSize.min,
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.only(bottom: 20.0),
                         child: Text(
                           "${DescriptionD}",
                           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                         ),
                       ),

                     ],
                   ),
                 )),
            ],
           shape: ShapeLightFocus.Circle,
           radius: 2,
           paddingFocus : 2 ,
         ));
     targets.add(
         TargetFocus(
           enableOverlayTab : true ,
           identify: "4",
           keyTarget: keyButton5,
           contents: [
             TargetContent(
                 align: ContentAlign.top,
                 child: Container(
                   child: Column(
                     mainAxisSize: MainAxisSize.min,
                     children: <Widget>[

                          Text(
                           "${DescriptionE}",
                           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                         ),


                     ],
                   ),
                 )),
             TargetContent(
                 align: ContentAlign.bottom,
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.only(bottom: 20.0),
                       child: Text(
                         "salut",
                         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                       ),
                     ),

                   ],
                 ))
           ],
           shape: ShapeLightFocus.Circle,
           radius: 2,
           paddingFocus : 2 ,
         ));

   }

   void showToast(String msg, {int duration, int gravity}) {
     Toast.show(msg, context, duration: duration, gravity: gravity);
   }
   void LancerLeTutoriel() {
     tutorialCoachMark = TutorialCoachMark(
       context,
       targets: targets,
       // colorShadow: Color(0xff343A40),
       textSkip: "SKIP",
       paddingFocus: 5,
       opacityShadow: 0.3,
       onFinish: () {
         setState(() {
           valuerActuelIndiceAnimation = 0 ;
         });
         MiseAjourVisibiliteAnimation();

       },
       onClickTarget: (target) {
        },
       onSkip: () {

         _arretDeLaVOix();
         setState(() {
           valuerActuelIndiceAnimation = 0 ;
         });
          MiseAjourVisibiliteAnimation();
       },
       onClickOverlay: (target) {

         if (  (targets[valuerActuelIndiceAnimation].identify) == "1") {


             setState(() {
               _text_parler =   DescriptionB ;

             });

             _speak();
            // _text_parler
          }

       else  if (  (targets[valuerActuelIndiceAnimation].identify) == "2") {


           setState(() {
             _text_parler =   DescriptionC ;

           });

           _speak();
           // _text_parler
         }

         if (  (targets[valuerActuelIndiceAnimation].identify) == "3") {


           setState(() {
             _text_parler =   DescriptionD ;

           });

           _speak();
           // _text_parler
         }

         if ((  (targets[valuerActuelIndiceAnimation].identify) == "4") && ( DescriptionE != "null") ) {


           setState(() {
             _text_parler =   DescriptionE ;

           });



           _speak();
           // _text_parler
         }
         valuerActuelIndiceAnimation ++ ;
       },
     )..show();
   }


   /////// ----------------------------------------- ////////
   ////// -----  FONCTION QUI RENVOIS LA COULEUR EN FONCTION DU CHOIX DE L'UTILISATEUR ---- //////
              ////////////// // ----------------------------------------- /////////

  Color verificationDesReponses(bool a, bool b, bool c) {
    bool verif_a;
    bool verif_b;
    bool verif_c;


    setState(() {
      // --------------------------------------//
      // ----- ON TESTE SI TOUTES LES VALEUR NE SONT SELECTIONNER  ---- //
      // --------------------------------------//

      if ((a == null) & (b == null) & (c == null))
      {
        verif_a = tampon.getReponseA();
        verif_b = tampon.getReponseB();
        verif_c = tampon.getReponseC();
        point  = tampon.getPoint();

        couleurChoix = kcouleurRouge ;


        // --------------------------------//
        //- Aucune valeur n'as ete selectionner -//
        // les lettre A , B  ,C  recoivent une couleur blanche //

        couleurSauvegardeLettreOption_A = "ffffff";
        couleurSauvegardeLettreOption_B = "ffffff";
        couleurSauvegardeLettreOption_C = "ffffff";



        if ((verif_a == true) & (verif_b == true)) {
          couleurPardefaulOptiont_A = kcouleurVerte;
          couleurPardefaultOption_B = kcouleurVerte;
          couleurPardefaultOption_C = kcouleurBlanche;

          couleurStringBouton_A = couleurPardefaulOptiont_A.toString();
          couleurStringBouton_B = couleurPardefaultOption_B.toString();
          couleurStringBouton_C = couleurPardefaultOption_C.toString();


          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_B.split('(0xff')[1].split(')')[0];


        } else if ((verif_a == true) & (verif_c == true)) {
          couleurPardefaulOptiont_A = kcouleurVerte;
          couleurPardefaultOption_C = kcouleurVerte;
          couleurPardefaultOption_B = kcouleurBlanche;

          couleurStringBouton_A= couleurPardefaulOptiont_A.toString();
          couleurStringBouton_C = couleurPardefaultOption_C.toString();
          couleurStringBouton_B = couleurPardefaultOption_B.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];

        } else if ((verif_b == true) & (verif_c == true)) {

          couleurPardefaultOption_B = kcouleurVerte;
          couleurPardefaultOption_C = kcouleurVerte;
          couleurPardefaulOptiont_A = kcouleurBlanche;


          couleurStringBouton_B= couleurPardefaultOption_B.toString();
          couleurStringBouton_C = couleurPardefaultOption_C.toString();
          couleurStringBouton_A= couleurPardefaulOptiont_A.toString();



          couleurSauvegardeOption_B = couleurSauvegardeOption_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurSauvegardeOption_C.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_A = couleurSauvegardeOption_A.split('(0xff')[1].split(')')[0];

        } else if (verif_a == true) {

          couleurPardefaulOptiont_A = kcouleurVerte;
          couleurStringBouton_A = couleurPardefaulOptiont_A.toString();
          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];


          couleurPardefaultOption_B = kcouleurBlanche;
          couleurStringBouton_B = couleurPardefaultOption_B.toString();
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];



          couleurPardefaultOption_C = kcouleurBlanche;
          couleurStringBouton_C = couleurPardefaultOption_C.toString();
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];




        } else if (verif_b == true) {

          couleurPardefaultOption_B = kcouleurVerte;
          couleurStringBouton_B = couleurPardefaultOption_B.toString();
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];


          couleurPardefaulOptiont_A = kcouleurBlanche;
          couleurStringBouton_A = couleurPardefaulOptiont_A.toString();
          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];


          couleurPardefaultOption_C = kcouleurBlanche;
          couleurStringBouton_C = couleurPardefaultOption_C.toString();
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


        } else {

          couleurPardefaultOption_C = kcouleurVerte;
          couleurStringBouton_C= couleurPardefaultOption_C.toString();
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];

          couleurPardefaulOptiont_A = kcouleurBlanche;
          couleurStringBouton_A = couleurPardefaulOptiont_A.toString();
          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];


          couleurPardefaultOption_B = kcouleurBlanche;
          couleurStringBouton_B = couleurPardefaultOption_B.toString();
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];


        }



      }

      // --------------------------------------//
// ----- ON TESTE SI TOUTE LES VALEURS  SONT SELECTIONNER ---- //
      // --------------------------------------//

      else if ((a != null) & (b != null) & (c != null))
      {
        couleurSauvegardeLettreOption_A = "ffffff";
        couleurSauvegardeLettreOption_B = "ffffff";
        couleurSauvegardeLettreOption_C = "ffffff";

         couleurLettreOption_A = kcouleurOrange  ;
         couleurStringLettre_A= couleurLettreOption_A.toString();
         couleurSauvegardeLettreOption_A = couleurStringLettre_A.split('(0xff')[1].split(')')[0];

        couleurLettreOption_B = kcouleurOrange  ;
         couleurStringLettre_B= couleurLettreOption_B.toString();
         couleurSauvegardeLettreOption_B = couleurStringLettre_B.split('(0xff')[1].split(')')[0];

         couleurLettreOption_C = kcouleurOrange  ;
         couleurStringLettre_C= couleurLettreOption_C.toString();
         couleurSauvegardeLettreOption_C = couleurStringLettre_C.split('(0xff')[1].split(')')[0];


         couleurChoix = kcouleurRouge ;


         couleurSauvegardeLettreOption_A = "FF6733";
         couleurSauvegardeLettreOption_B = "FF6733";
         couleurSauvegardeLettreOption_C = "FF6733";

        verif_a = tampon.getReponseA();
        verif_b = tampon.getReponseB();
        verif_c = tampon.getReponseC();

        if ((verif_a == a) & (verif_b == b)) {

          couleurApresSelection_OptionA = kcouleurVerte;
          couleurApresSelection_OptionB = kcouleurVerte;
          couleurApresSelection_OptionC = kcouleurRouge;

          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_B = couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurApresSelection_OptionC.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];



        } else if ((verif_a == a) & (verif_c == c)) {
          couleurApresSelection_OptionA = kcouleurVerte;
          couleurApresSelection_OptionB = kcouleurRouge;
          couleurApresSelection_OptionC = kcouleurVerte;

          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_B = couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurApresSelection_OptionC.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


        } else if ((verif_b == b) & (verif_c == c)) {
          couleurApresSelection_OptionB = kcouleurVerte;
          couleurApresSelection_OptionC = kcouleurVerte;
          couleurApresSelection_OptionA = kcouleurRouge;

          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_B = couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurApresSelection_OptionC.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


        } else if (verif_a == a) {
          couleurApresSelection_OptionA = kcouleurVerte;
          couleurApresSelection_OptionB = kcouleurRouge;
          couleurApresSelection_OptionC = kcouleurRouge;

          couleurStringBouton_A =  couleurApresSelection_OptionA.toString();
          couleurStringBouton_B = couleurApresSelection_OptionB.toString();
          couleurStringBouton_C =  couleurApresSelection_OptionC.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];



        } else if (verif_b == b) {
          couleurApresSelection_OptionB = kcouleurVerte;
          couleurApresSelection_OptionC = kcouleurRouge;
          couleurApresSelection_OptionA = kcouleurRouge;

          couleurStringBouton_A =  couleurApresSelection_OptionA.toString();
          couleurStringBouton_B = couleurApresSelection_OptionB.toString();
          couleurStringBouton_C =  couleurApresSelection_OptionC.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];



        } else {
          couleurApresSelection_OptionC = kcouleurVerte;
          couleurApresSelection_OptionB = kcouleurRouge;
          couleurApresSelection_OptionA = kcouleurRouge;

          couleurStringBouton_A =  couleurApresSelection_OptionA.toString();
          couleurStringBouton_B = couleurApresSelection_OptionB.toString();
          couleurStringBouton_C =  couleurApresSelection_OptionC.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


        }




      }

      // --------------------------------------//
// ----- ON TESTE SI   A ET B  SONT SELECTIONNER ---- //
      // --------------------------------------//
      else if ((a != null) & (b != null) )
      {
        couleurSauvegardeLettreOption_A = "ffffff";
        couleurSauvegardeLettreOption_B = "ffffff";
        couleurSauvegardeLettreOption_C = "ffffff";
        couleurChoix = kcouleurRouge ;

        verif_a = tampon.getReponseA();
        verif_b = tampon.getReponseB();
        verif_c = tampon.getReponseC();

        couleurLettreOption_A = kcouleurOrange  ;
        couleurStringLettre_A= couleurLettreOption_A.toString();
        couleurSauvegardeLettreOption_A = couleurStringLettre_A.split('(0xff')[1].split(')')[0];

        couleurLettreOption_B = kcouleurOrange  ;
        couleurStringLettre_B= couleurLettreOption_B.toString();
        couleurSauvegardeLettreOption_B = couleurStringLettre_B.split('(0xff')[1].split(')')[0];



        if ((verif_a == a) & (verif_b == b)) {
          couleurApresSelection_OptionA = kcouleurVerte;
          couleurApresSelection_OptionB = kcouleurVerte;
          couleurPardefaultOption_C = kcouleurBlanche;

          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_B = couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurPardefaultOption_C.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


          couleurChoix = kcouleurVerte ;


        }

        else if (verif_a == a)

        {

          couleurApresSelection_OptionA = kcouleurVerte;
          couleurApresSelection_OptionB = kcouleurRouge;
          couleurPardefaultOption_C = kcouleurBlanche;

          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_B = couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurPardefaultOption_C.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];



        }
        else if (verif_b == b )
        {
          couleurApresSelection_OptionB = kcouleurVerte;
          couleurApresSelection_OptionA = kcouleurRouge;
          couleurPardefaultOption_C = kcouleurBlanche;

          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_B = couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurPardefaultOption_C.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];



        }
        else
        {
          couleurApresSelection_OptionB = kcouleurRouge;
          couleurApresSelection_OptionA = kcouleurRouge;
          couleurPardefaultOption_C = kcouleurVerte;

          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_B = couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurPardefaultOption_C.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


        }




      }

      // --------------------------------------//
// ----- ON TESTE SI   A ET C  SONT SELECTIONNER ---- //
      // --------------------------------------//

      else if ((a != null) & (c != null) )
      {

        couleurSauvegardeLettreOption_A = "ffffff";
        couleurSauvegardeLettreOption_B = "ffffff";
        couleurSauvegardeLettreOption_C = "ffffff";

        couleurChoix = kcouleurRouge ;

        verif_a = tampon.getReponseA();
        verif_b = tampon.getReponseB();
        verif_c = tampon.getReponseC();

        couleurLettreOption_A = kcouleurOrange  ;
        couleurStringLettre_A= couleurLettreOption_A.toString();
        couleurSauvegardeLettreOption_A = couleurStringLettre_A.split('(0xff')[1].split(')')[0];

        couleurLettreOption_C = kcouleurOrange  ;
        couleurStringLettre_C= couleurLettreOption_C.toString();
        couleurSauvegardeLettreOption_C = couleurStringLettre_C.split('(0xff')[1].split(')')[0];


        if ((verif_a == a) & (verif_c == c)) {
          couleurApresSelection_OptionA = kcouleurVerte;
          couleurApresSelection_OptionC = kcouleurVerte;
          couleurPardefaultOption_B =     kcouleurBlanche;

          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_C=  couleurApresSelection_OptionC.toString();
          couleurStringBouton_B=  couleurPardefaultOption_B.toString();


          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


          couleurChoix = kcouleurVerte ;


        }

        else if (verif_a == a)
        {
          couleurApresSelection_OptionA = kcouleurVerte;
          couleurApresSelection_OptionC = kcouleurRouge;
          couleurPardefaultOption_B = kcouleurBlanche;

          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_C = couleurApresSelection_OptionC.toString();
          couleurStringBouton_B=  couleurPardefaultOption_B.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


        }
        else if (verif_c == c)
        {
          couleurApresSelection_OptionC = kcouleurVerte;
          couleurApresSelection_OptionA = kcouleurRouge;
          couleurPardefaultOption_B = kcouleurBlanche;

          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_C = couleurApresSelection_OptionC.toString();
          couleurStringBouton_B=  couleurPardefaultOption_B.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


        }
        else {
          couleurPardefaultOption_B = kcouleurVerte;
          couleurApresSelection_OptionC = kcouleurRouge;
          couleurApresSelection_OptionA = kcouleurRouge;

          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_C = couleurApresSelection_OptionC.toString();
          couleurStringBouton_B=  couleurPardefaultOption_B.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];



        }



      }

      // --------------------------------------//
// ----- ON TESTE SI   B ET C  SONT SELECTIONNER ---- //
      // --------------------------------------//
      else if ((b != null) & (c != null) )
      {

        couleurSauvegardeLettreOption_A = "ffffff";
        couleurSauvegardeLettreOption_B = "ffffff";
        couleurSauvegardeLettreOption_C = "ffffff";

        couleurChoix = kcouleurRouge ;

        verif_a = tampon.getReponseA();
        verif_b = tampon.getReponseB();
        verif_c = tampon.getReponseC();

        couleurLettreOption_B = kcouleurOrange  ;
        couleurStringLettre_B= couleurLettreOption_B.toString();
        couleurSauvegardeLettreOption_B = couleurStringLettre_B.split('(0xff')[1].split(')')[0];

        couleurLettreOption_C = kcouleurOrange  ;
        couleurStringLettre_C= couleurLettreOption_C.toString();
        couleurSauvegardeLettreOption_C = couleurStringLettre_C.split('(0xff')[1].split(')')[0];

        if ((verif_b == b) & (verif_c == c)) {
          couleurApresSelection_OptionB = kcouleurVerte;
          couleurApresSelection_OptionC = kcouleurVerte;
          couleurPardefaulOptiont_A = kcouleurBlanche;



          couleurStringBouton_B=  couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurApresSelection_OptionC.toString();
          couleurStringBouton_A=  couleurPardefaulOptiont_A.toString();


          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


          couleurChoix = kcouleurVerte ;


        }

        else if (verif_b == b)
        {
          couleurApresSelection_OptionB = kcouleurVerte;
          couleurApresSelection_OptionC = kcouleurRouge ;
          couleurPardefaulOptiont_A = kcouleurBlanche;


          couleurStringBouton_B=  couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurApresSelection_OptionC.toString();
          couleurStringBouton_A=  couleurPardefaulOptiont_A.toString();


          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


        }
        else if (verif_c == c)
        {
          couleurApresSelection_OptionC = kcouleurVerte;
          couleurApresSelection_OptionB = kcouleurRouge;
          couleurPardefaulOptiont_A = kcouleurBlanche;

          couleurStringBouton_B=  couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurApresSelection_OptionC.toString();
          couleurStringBouton_A=  couleurPardefaulOptiont_A.toString();


          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


        }
        else {
          couleurPardefaulOptiont_A = kcouleurVerte;
          couleurApresSelection_OptionB = kcouleurRouge;
          couleurApresSelection_OptionC = kcouleurRouge;

          couleurStringBouton_B=  couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurApresSelection_OptionC.toString();
          couleurStringBouton_A=  couleurPardefaulOptiont_A.toString();


          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


        }




      }

      // --------------------------------------//
// ----- ON SELECTIONNE A  ET   B , C SONT NULL---- //
      // --------------------------------------//

      else if ((a != null) & (b == null) & (c == null))
      {
        verif_a = tampon.getReponseA();
        verif_b = tampon.getReponseB();
        verif_c = tampon.getReponseC();

        couleurSauvegardeLettreOption_A = "ffffff";
        couleurSauvegardeLettreOption_B = "ffffff";
        couleurSauvegardeLettreOption_C = "ffffff";

        couleurChoix = kcouleurRouge ;

        couleurLettreOption_A = kcouleurOrange  ;
        couleurStringLettre_A= couleurLettreOption_A.toString();
        couleurSauvegardeLettreOption_A = couleurStringLettre_A.split('(0xff')[1].split(')')[0];


        if ((verif_a == a) & (verif_b == true)) {

          couleurApresSelection_OptionA = kcouleurVerte;
          couleurPardefaultOption_B = kcouleurVerte;
          couleurPardefaultOption_C = kcouleurBlanche;

          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_B=  couleurPardefaultOption_B.toString();
          couleurStringBouton_C=  couleurPardefaultOption_C.toString();


          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


          couleurChoix = kcouleurVerte ;


        } else if ((verif_b == true) & (verif_c == true)) {
          couleurApresSelection_OptionA = kcouleurRouge;
          couleurPardefaultOption_B = kcouleurVerte;
          couleurPardefaultOption_C = kcouleurVerte;

          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_B=  couleurPardefaultOption_B.toString();
          couleurStringBouton_C=  couleurPardefaultOption_C.toString();


          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];

          couleurChoix = kcouleurRouge ;


        } else if ((verif_a == a) & (verif_c == true)) {
          couleurApresSelection_OptionA =kcouleurVerte;
          couleurPardefaultOption_B = kcouleurBlanche;
          couleurPardefaultOption_C = kcouleurVerte;

          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_B=  couleurPardefaultOption_B.toString();
          couleurStringBouton_C=  couleurPardefaultOption_C.toString();


          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];

          couleurChoix = kcouleurVerte ;


        } else  if (verif_a == a)  {
          couleurApresSelection_OptionA = kcouleurVerte;
          couleurPardefaultOption_B = kcouleurBlanche;
          couleurPardefaultOption_C = kcouleurBlanche;

          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_B=  couleurPardefaultOption_B.toString();
          couleurStringBouton_C=  couleurPardefaultOption_C.toString();


          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];

          couleurChoix = kcouleurVerte ;


        }
        else  if (verif_b == true)  {
          couleurApresSelection_OptionA = kcouleurRouge;
          couleurPardefaultOption_B = kcouleurVerte;
          couleurPardefaultOption_C = kcouleurBlanche;


          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_B=  couleurPardefaultOption_B.toString();
          couleurStringBouton_C=  couleurPardefaultOption_C.toString();


          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];





        }
        else {

          couleurApresSelection_OptionA = kcouleurRouge;
          couleurPardefaultOption_B = kcouleurBlanche;
          couleurPardefaultOption_C = kcouleurVerte;

          couleurStringBouton_A=  couleurApresSelection_OptionA.toString();
          couleurStringBouton_B=  couleurPardefaultOption_B.toString();
          couleurStringBouton_C=  couleurPardefaultOption_C.toString();


          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];




        }





      }

      // --------------------------------------//
// ----- ON  SELECTIONNE B  ET   A , C SONT NULL ---- //
      // --------------------------------------//

      else if ((b != null) & (a == null) & (c == null))
      {


        verif_a = tampon.getReponseA();
        verif_b = tampon.getReponseB();
        verif_c = tampon.getReponseC();

        couleurSauvegardeLettreOption_A = "ffffff";
        couleurSauvegardeLettreOption_B = "ffffff";
        couleurSauvegardeLettreOption_C = "ffffff";

        couleurChoix = kcouleurRouge ;


        couleurLettreOption_B = kcouleurOrange  ;
        couleurStringLettre_B= couleurLettreOption_B.toString();
        couleurSauvegardeLettreOption_B = couleurStringLettre_B.split('(0xff')[1].split(')')[0];



        if ((verif_b == b) & (verif_a == true)) {
          couleurApresSelection_OptionB = kcouleurVerte;
          couleurPardefaulOptiont_A =     kcouleurVerte;
          couleurPardefaultOption_C =     kcouleurBlanche;

          couleurStringBouton_A=  couleurPardefaulOptiont_A.toString();
          couleurStringBouton_B = couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurPardefaultOption_C.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


          couleurChoix = kcouleurVerte ;

        } else if ((verif_b == true) & (verif_c == true)) {

          couleurApresSelection_OptionB =kcouleurRouge;
          couleurPardefaulOptiont_A = kcouleurVerte;
          couleurPardefaultOption_C = kcouleurVerte;

          couleurStringBouton_A=  couleurPardefaulOptiont_A.toString();
          couleurStringBouton_B = couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurPardefaultOption_C.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];




        } else if ((verif_b == b) & (verif_c == true)) {
          couleurApresSelection_OptionB = kcouleurVerte;
          couleurPardefaulOptiont_A = kcouleurBlanche;
          couleurPardefaultOption_C = kcouleurVerte;


          couleurStringBouton_A=  couleurPardefaulOptiont_A.toString();
          couleurStringBouton_B = couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurPardefaultOption_C.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];



          couleurChoix = kcouleurVerte ;


        }  else  if (verif_b == b)  {
          couleurApresSelection_OptionB = kcouleurVerte;
          couleurPardefaulOptiont_A = kcouleurBlanche;
          couleurPardefaultOption_C = kcouleurBlanche;

          couleurStringBouton_A=  couleurPardefaulOptiont_A.toString();
          couleurStringBouton_B = couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurPardefaultOption_C.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];



          couleurChoix = kcouleurVerte ;

        }
        else  if (verif_a == true)  {
          couleurApresSelection_OptionB = kcouleurRouge;
          couleurPardefaulOptiont_A = kcouleurVerte;
          couleurPardefaultOption_C = kcouleurBlanche;

          couleurStringBouton_A=  couleurPardefaulOptiont_A.toString();
          couleurStringBouton_B = couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurPardefaultOption_C.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


        }
        else {
          couleurApresSelection_OptionB = kcouleurRouge;
          couleurPardefaulOptiont_A = kcouleurBlanche;
          couleurPardefaultOption_C = kcouleurVerte;

          couleurStringBouton_A=  couleurPardefaulOptiont_A.toString();
          couleurStringBouton_B = couleurApresSelection_OptionB.toString();
          couleurStringBouton_C=  couleurPardefaultOption_C.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];


        }


      }
      // --------------------------------------//
// ----- ON  SELECTIONNE C  ET   A , B SONT NULL---- //
      // --------------------------------------//

      else if ((c != null) & (a == null) & (b == null))
      {
        verif_a = tampon.getReponseA();
        verif_b = tampon.getReponseB();
        verif_c = tampon.getReponseC();

        couleurSauvegardeLettreOption_A = "ffffff";
        couleurSauvegardeLettreOption_B = "ffffff";
        couleurSauvegardeLettreOption_C = "ffffff";

        couleurChoix = kcouleurRouge ;

        couleurLettreOption_C  = kcouleurOrange  ;
        couleurStringLettre_C = couleurLettreOption_C.toString();
        couleurSauvegardeLettreOption_C = couleurStringLettre_C.split('(0xff')[1].split(')')[0];



        if ((verif_c == c) & (verif_a == true)) {


          couleurApresSelection_OptionC = kcouleurVerte;
          couleurPardefaulOptiont_A =     kcouleurVerte;
          couleurPardefaultOption_B =    kcouleurBlanche;

          couleurStringBouton_A=  couleurPardefaulOptiont_A.toString();
          couleurStringBouton_B = couleurPardefaultOption_B.toString();
          couleurStringBouton_C=  couleurApresSelection_OptionC.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];



          couleurChoix = kcouleurVerte;

        } else if ((verif_b == true) & (verif_a == true)) {

          couleurApresSelection_OptionC = kcouleurRouge;
          couleurPardefaulOptiont_A = kcouleurVerte;
          couleurPardefaultOption_B = kcouleurVerte;

          couleurStringBouton_A=  couleurPardefaulOptiont_A.toString();
          couleurStringBouton_B = couleurPardefaultOption_B.toString();
          couleurStringBouton_C=  couleurApresSelection_OptionC.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];



        } else if ((verif_c == c) & (verif_a == true)) {

          couleurApresSelection_OptionC = kcouleurVerte;
          couleurPardefaultOption_B = kcouleurBlanche;
          couleurPardefaulOptiont_A = kcouleurVerte;


          couleurStringBouton_A=  couleurPardefaulOptiont_A.toString();
          couleurStringBouton_B = couleurPardefaultOption_B.toString();
          couleurStringBouton_C=  couleurApresSelection_OptionC.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];

          couleurChoix = kcouleurVerte ;



        }  else  if (verif_c == c)  {
          couleurApresSelection_OptionC = kcouleurVerte;
          couleurPardefaultOption_B = kcouleurBlanche;
          couleurPardefaulOptiont_A = kcouleurBlanche;

          couleurStringBouton_A=  couleurPardefaulOptiont_A.toString();
          couleurStringBouton_B = couleurPardefaultOption_B.toString();
          couleurStringBouton_C=  couleurApresSelection_OptionC.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];

          couleurChoix = kcouleurVerte ;



        }
        else  if (verif_a == true)  {
          couleurApresSelection_OptionC = kcouleurRouge;
          couleurPardefaulOptiont_A = kcouleurVerte;
          couleurPardefaultOption_B = kcouleurBlanche;

          couleurStringBouton_A=  couleurPardefaulOptiont_A.toString();
          couleurStringBouton_B = couleurPardefaultOption_B.toString();
          couleurStringBouton_C=  couleurApresSelection_OptionC.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];



        }
        else {
          couleurApresSelection_OptionC = kcouleurRouge;
          couleurPardefaulOptiont_A = kcouleurBlanche;
          couleurPardefaultOption_B = kcouleurVerte;

          couleurStringBouton_A=  couleurPardefaulOptiont_A.toString();
          couleurStringBouton_B = couleurPardefaultOption_B.toString();
          couleurStringBouton_C=  couleurApresSelection_OptionC.toString();

          couleurSauvegardeOption_A = couleurStringBouton_A.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_B = couleurStringBouton_B.split('(0xff')[1].split(')')[0];
          couleurSauvegardeOption_C = couleurStringBouton_C.split('(0xff')[1].split(')')[0];




        }



      }

    });





    return couleurChoix ;
  }

// ----- REINITIALISATION DES COULEUR APRES LA PROCHAINE QUESTION ---- //

  void resetColor() {
    setState(() {
      couleurPardefaultOption_B = Colors.white;
      couleurPardefaulOptiont_A = Colors.white;
      couleurPardefaultOption_C = Colors.white;


      couleurApresSelection_OptionA = Colors.orangeAccent;
      couleurApresSelection_OptionB = Colors.orangeAccent;
      couleurApresSelection_OptionC = Colors.orangeAccent;

      couleurLettreOption_A = Colors.white  ;
      couleurLettreOption_B = Colors.white  ;
      couleurLettreOption_C = Colors.white  ;
    });
  }

  void BoutonSuivant() {


    resetColor();
    setState(() {

      if (tampon.FinTheme() == true) {


        _arretDeLaVOix();
         Utility.instance
            .setIntegerValue(RecupereCleQuestionDefinition, 0);
        Utility.instance
            .setIntegerValue(RecupereCleQuestionConducteurPass, 0);


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

                "THEMES",
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),


              onPressed:  () {
                _arretDeLaVOix();

                if ( widget.titrePage == "DEFINITION") {

                  Provider.of<ResultatDefinition>(context , listen: false).SuprimerLesResultat();

                  Provider.of<ResultatDefinition>(context , listen: false).reset();


                  Navigator.of(context, rootNavigator: true ).push(TransitionHaut(

                      page :  Accueil( 0 )));

                }




              },


              color: Colors.orangeAccent,

            ) ,

            DialogButton(
              //  padding: EdgeInsets.all(15),

              child: Text(
                "CORRECTION",
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),


              onPressed:  () {

                _arretDeLaVOix();
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

        visibilite_bouton_Valider = !visibilite_bouton_Valider; // le bouton valider est desactiver
        visibilite_bouton_Suivant = !visibilite_bouton_Suivant; // le bouton suivant est afficher
        visibilite_zoneExplication  = ! visibilite_zoneExplication ;
        desactive_boutonA = !desactive_boutonA;
        desactive_boutonB = !desactive_boutonB;
        desactive_boutonC = !desactive_boutonC;

        clic_bouton_A = false;
        clic_bouton_B = false;
        clic_bouton_C = false;

        tampon.questionSuivante();
        ActualisationValeurAnimations();

        MiseAjourVisibiliteAnimation();
        masqueBouton( ) ;
        resetColor();



      }

    });


  }

  void BoutonValider() {

    setState(() {
      choix_1 = null;
      choix_2 = null;
      choix_3 = null;


      visibilite_bouton_Valider = !visibilite_bouton_Valider;
      visibilite_bouton_Suivant = !visibilite_bouton_Suivant;
      visibilite_zoneExplication = ! visibilite_zoneExplication ;


    });


  }

  void _aChoisi(int value) {
  }

  bool valeurChoisiA() {
    if (clic_bouton_A == true) {
      valeur_choisi = true;
    } else {
      valeur_choisi = null;
    }

    return valeur_choisi;
  }

  bool valeurChoisiB() {
    if (clic_bouton_B == true) {
      valeur_choisi = true;
    } else {
      valeur_choisi = null;
    }

    return valeur_choisi;
  }

  bool valeurChoisiC() {
    if (clic_bouton_C == true) {
      valeur_choisi = true;
    } else {
      valeur_choisi = null;
    }

    return valeur_choisi;
  }

  void masqueBouton( ) {

    setState(() {

      if ( tampon.getOptionC()   == 'null' ) {
         visibilite_bouton_C = false ;

        _text_parler  = tampon.getQuestionText() +  ":" + "," + tampon.getOptionA() + " , Reponse A ,  "  + tampon.getOptionB() + " , Reponse B , "   ;

        _speak();

      }


      else {
        visibilite_bouton_C = true ;
        _text_parler  = tampon.getQuestionText()  + "," +tampon.getOptionA() + " ,  Reponse A , " +  tampon.getOptionB() + " , Reponse B , " +  tampon.getOptionC()+ " , Reponse C ";
        _speak();


      }


    });



  }







  Widget EcranFormulaireTextField(BuildContext context) {

    return Platform.isIOS ? buildShowCupertinoModalPopup(context) : ButtonBugMaterialDesing(context);

  }



  /////////////////////////////////////////////////////////////////////
  ///// ---------------   DESING ANDROID APPUIS SUR L'ICON BUG -------------- /////////
  /////////////////////////////////////////////////////////////////////

  String _choixItem = '';

  Widget ButtonBugMaterialDesing(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: 350,
            child: Container(
              child: _MenuNavigationMaterialDesing(),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
              ),
            ),
          );
        });
  }


  Column _MenuNavigationMaterialDesing() {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15));

    return Column(
      children: <Widget>[

        Text('Signaler un bug' ,
          style: TextStyle(
              fontSize: 15,) ,) ,
        Text('Quel est l\'element a l\'origine de votre probleme  ?' ,
            style: TextStyle(
              fontSize: 15,)),


        ListTile(
          leading: Icon(Icons.book),
          title: Text(' La Question ' ,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold),
    ),
          onTap: () => _selectionItem('Cooling'),
        ),


        ListTile(
          leading: Icon(Icons.question_answer),
          title: Text(' La ou Les reponses' ,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),),
          onTap: () => _selectionItem('People'),
        ),
         ListTile(
            leading: Icon(Icons.assessment),
            title: Text('L\'explication' ,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),),
            onTap: () => _selectionItem('Stats'),
          ),

        ListTile(
          leading: Icon(Icons.image),
          title: Text(' L\'image' ,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),),
          onTap: () => _selectionItem('People'),
        ),

            ElevatedButton(
            style: style ,
            onPressed: () {},
            child: const Text('ANNULER'),
          ),

      ],
    );
  }


  void _selectionItem(String nom) {
    Navigator.pop(context);
    setState(() {
      _choixItem = nom;
    });
  }


              /////////////////////////////////////////////////////////////////////
  // /// --------------- DESING ANDROID APPUIS SUR L'ICON BUG  -------------- /////////
            /////////////////////////////////////////////////////////////////////

  Future<void> buildShowCupertinoModalPopup(BuildContext context) {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Title'),
        message: const Text('Message'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: const Text('Action One'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Action Two'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],

        cancelButton: CupertinoActionSheetAction(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

    );
  }

  /////////////////////////////////////////////////////////////////////
  // /// --------------- MESSAGE A AFFICHER APRES SUPPRESSION OU SAUVEGARDE  -------------- /////////
  /////////////////////////////////////////////////////////////////////


   messageSupression() {

    Toast.show("Message Supprimer 😥", context, duration: 1 , gravity: Toast.CENTER , backgroundColor : Colors.red , textColor : Colors.white  );

  }

  messageSauvegarder() {
     Toast.show("Message Sauvegarde 👌🏾", context, duration: 1 , gravity: Toast.CENTER , backgroundColor : Colors.green  , textColor : Colors.white  );

  }



  /////////////////////////////////////////////////////////////////////
  // /// --------------- BOUTTON   PLAY-STOP-------------- /////////
  /////////////////////////////////////////////////////////////////////



  Widget BoutonPlayStop(BuildContext context) {

    return  Container(

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: visibilite_bouton_Valider,

              child: Container(
                width: 100,
                 height: 65,

                child: FloatingActionButton(
                  backgroundColor: Colors.blue,

                  child: Icon (

                    Ionicons.play ,
                      size: 40 ,

                   ),

                  elevation: 0.1,

                  onPressed: () {

                    StatutQuestionSauvegarder();



                    CouleurAchoisi =  verificationDesReponses(choix_1, choix_2, choix_3);

                    couleurStringChoixUtilisateur= CouleurAchoisi.toString();
                    couleurSauvegarChoixUtilisateur = couleurStringChoixUtilisateur.split('(0xff')[1].split(')')[0];


                    if (  widget.titrePage   == "DEFINITION" ) {



                      setState(() {
                        Utility.instance
                            .setIntegerValue(RecupereCleQuestionDefinition ,  tampon.getNumQueDef);

                      });

                      Provider.of<ResultatDefinition>(context , listen: false).ajoutQuestionResultatSectionDefinition(
                          idQuestion , questionTexte ,reponse_A , reponse_B , reponse_C , fauteGrave, explication ,point , cheminImageSource , numeroImagesource  ,
                          option_A , option_B , option_C ,
                          couleurSauvegardeOption_A , couleurSauvegardeOption_B , couleurSauvegardeOption_C ,
                          couleurSauvegardeLettreOption_A , couleurSauvegardeLettreOption_B ,couleurSauvegardeLettreOption_C ,
                          couleurSauvegarChoixUtilisateur ,
                          cheminImageAnimations ,
                          numeroImageA , VisibiliteAnimation_A , DescriptionA, positionGaucheA , positionHautA , positionDroiteA , positionBasA , hauteurA , largeurA,
                          numeroImageB , VisibiliteAnimation_B , DescriptionB, positionGaucheB , positionHautB , positionDroiteB , positionBasB , hauteurB , largeurB,
                          numeroImageC , VisibiliteAnimation_C , DescriptionC, positionGaucheC , positionHautC , positionDroiteC , positionBasC , hauteurC , largeurC,
                          numeroImageD , VisibiliteAnimation_D , DescriptionD, positionGaucheD , positionHautD , positionDroiteD , positionBasD , hauteurD , largeurD,
                          numeroImageE , VisibiliteAnimation_E , DescriptionE, positionGaucheE , positionHautE , positionDroiteE , positionBasE , hauteurE , largeurE )  ;


                    }



                    BoutonValider();


                    _arretDeLaVOix();

                    setState(() {
                      _text_parler = explication ;
                      visibilite_bouton_explication = true ;
                      visibilite_bouton_sauvegarde = true ;

                    });
                    _speak() ;




                    setState(() {
                      desactive_boutonA = !desactive_boutonA;
                      desactive_boutonB = !desactive_boutonB;
                      desactive_boutonC = !desactive_boutonC;
                    });
                  },

                ),
              ),

            ),
            Visibility(
              visible: visibilite_bouton_Suivant,
               child: Container(
              width: 100,
              height: 65,

              child: FloatingActionButton(
                backgroundColor: Colors.blue,

                child: Icon (

                  Ionicons.play_skip_forward ,
                  size: 40 ,

                ),

                elevation: 0.1,

                onPressed: () {

                  setState(() {
                    visibilite_bouton_explication = false ;
                    visibilite_bouton_sauvegarde = false ;


                  });
                  BoutonSuivant();
                  _arretDeLaVOix();


                },

              ),
            ),
            ),
          ],
        ),





    );

  }






  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    final Size screenSize = MediaQuery.of(context).size;

    ActualisationDesvaleurAsauvegarder();







    //StatutFavoris() ;
     return Scaffold(
      extendBody: true,

      appBar: AppBar(
          toolbarHeight : 40 ,
        leading:   IconButton(
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            icon:   Icon(
              Icons.arrow_back,
              color: Colors.white ,
              size: 25,
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true ).push(TransitionGauche(

                  page :   Accueil(0)));


              _arretDeLaVOix() ;
            }
        ),


        title: Row(
          children: <Widget> [

            Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(widget.titrePage) ,


            ),

            Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 50),
        child: IconButton(

            icon:   Icon(
        Icons.ios_share,
        color: Colors.black ,
        size: 25,
        ),
        onPressed: () {


          _captureEcran();
          _arretDeLaVOix() ;


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
                      size: 27,
                    ),
                    onPressed: () {
                       _arretDeLaVOix() ;

                       EcranFormulaireTextField(context );
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

          color:  Color(0xfff3f8ff),


          height: hauteur,
          child: Stack(
            alignment :  AlignmentDirectional.bottomCenter,

            children: <Widget>[


              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[

                        /////////////////////////////////////////////////////////////////////
                        ///// ---------------   ZONE  IMAGE QUESTION -------------- /////////
                        /////////////////////////////////////////////////////////////////////

                        Expanded(
                          child: InteractiveViewer(

                             maxScale : 5.0,
                             child: Container(


                            child: Image.asset(
                                'assets/${tampon.getCheminImageSourceQuestion()}/source/${tampon.getNumeroImageSourceQuestion()}.webp',
                                height: 200,
                                fit: BoxFit.fill ,
                              ),
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
                                          tampon.getQuestionText() /*+ '$d '*/    ,
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
                                              elevation: 1.5,
                                              textColor: Colors.black,
                                              child: Text(
                                                tampon.getOptionA(),
                                                textAlign : TextAlign.center ,

                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  clic_bouton_A = !clic_bouton_A;
                                                });

                                                choix_1 = valeurChoisiA();



                                              },
                                              color: clic_bouton_A
                                                  ? couleurApresSelection_OptionA
                                                  : couleurPardefaulOptiont_A,
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
                                            textAlign : TextAlign.center ,

                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              clic_bouton_A = !clic_bouton_A;
                                            });


                                            choix_1 = valeurChoisiA();

                                          },
                                          color: clic_bouton_A
                                              ? couleurApresSelection_OptionA
                                              : couleurPardefaulOptiont_A,

                                        ),
                                      ),
                                      height:  35.0,
                                      width:   35.0,
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

                                        margin: EdgeInsets.fromLTRB(10, 40, 0, 50),
                                        child: AbsorbPointer(
                                          absorbing: desactive_boutonB,
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              // side: BorderSide(color: Colors.red)
                                            ),
                                            elevation: 1.5,
                                            textColor: Colors.black,
                                            child: Text(
                                              tampon.getOptionB(),
                                              textAlign : TextAlign.center ,

                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15 ,
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                clic_bouton_B = !clic_bouton_B;
                                              });


                                              choix_2 = valeurChoisiB();
                                            },
                                            color: clic_bouton_B ? couleurApresSelection_OptionB : couleurPardefaultOption_B,
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
                                              textAlign : TextAlign.center ,

                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              clic_bouton_B = !clic_bouton_B;
                                            });

                                            choix_2 = valeurChoisiB();
                                          },
                                          color: clic_bouton_B ? couleurApresSelection_OptionB : couleurPardefaultOption_B,
                                        ),
                                      ),
                                      height: 35.0,
                                      width:  35.0  ,
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
                                                  tampon.getOptionC() ,
                                                  textAlign : TextAlign.center ,

                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  setState(() {

                                                    clic_bouton_C = !clic_bouton_C;
                                                  });
                                                  choix_3 = valeurChoisiC();

                                                },
                                                color: clic_bouton_C ? couleurApresSelection_OptionC : couleurPardefaultOption_C,
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
                                            textAlign : TextAlign.center ,

                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {

                                              clic_bouton_C = !clic_bouton_C;
                                            });
                                            choix_3 = valeurChoisiC();

                                          },
                                          color: clic_bouton_C
                                              ? couleurApresSelection_OptionC
                                              : couleurPardefaultOption_C,
                                        ),
                                      ),
                                      height: 35.0,
                                      width:  35.0  ,
                                    ),
                                  ),
                                ],
                              ),

                              /////////////////////////////////////////////////////////////////////
                              ///// ---------------   ZONE  Explication  -------------- /////////
                              /////////////////////////////////////////////////////////////////////

                              Visibility(
                                visible: visibilite_zoneExplication,

                                child: Container(
                                    margin: EdgeInsets.fromLTRB(10, 50, 10, 20),

                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            '$explication + $verifExisteQuestion',
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


              Visibility(
                visible: VisibiliteAnimation_A ,
                child: Padding(
                  padding:   EdgeInsets.fromLTRB(positionGaucheA , positionHautA ,positionDroiteA , positionBasA ),
                      child: Image.asset(
                        'assets/$cheminImageAnimations/animation/$numeroImageA.webp',
                         height: hauteurA,
                         width: largeurA,

                        key : keyButton1 ,

                      ),


                ),
              ),


              Visibility(
                visible: VisibiliteAnimation_B,
                child: Padding(
                  padding:   EdgeInsets.fromLTRB(positionGaucheB , positionHautB ,positionDroiteB , positionBasB ),
                  child: Image.asset(
                    'assets/$cheminImageAnimations/animation/$numeroImageB.webp',
                    height: hauteurB,
                    width:  largeurB,

                    key : keyButton2 ,

                  ),

                ),
              ),
              

              Visibility(
                visible: VisibiliteAnimation_C,
                child: Padding(
                  padding:   EdgeInsets.fromLTRB(positionGaucheC , positionHautC ,positionDroiteC , positionBasC ),
                    child: Image.asset(
                      'assets/$cheminImageAnimations/animation/$numeroImageC.webp',
                      height: hauteurC,
                      width:  largeurC,
                      key : keyButton3 ,

                    ),
                ),
              ),
              Visibility(
                visible: VisibiliteAnimation_D,

                child: Padding(
                  padding:   EdgeInsets.fromLTRB(positionGaucheD , positionHautD ,positionDroiteD , positionBasD ),
                  child: Image.asset(
                    'assets/$cheminImageAnimations/animation/$numeroImageD.webp',
                    height: hauteurD,
                    width:  largeurD,
                    key : keyButton4 ,

                  ),
                ),
              ),
              Visibility(
                visible: VisibiliteAnimation_E,

                child: Padding(
                  padding:   EdgeInsets.fromLTRB(positionGaucheE , positionHautE ,positionDroiteE , positionBasE ),
                  child: Image.asset(
                    'assets/$cheminImageAnimations/animation/$numeroImageE.webp',
                    height: hauteurE,
                    width:  largeurE,
                    key : keyButton5 ,

                  ),
                ),
              ),
              CustomPaint(
                size: Size(screenSize.width, 90),
                painter:  DessinBasBarNavigation(),
              ),

                Positioned(
                  bottom: 45,
                   child: RawMaterialButton(
                     elevation: 2 ,
                    fillColor: Colors.white,
                    shape: CircleBorder(),
                    onPressed: () {  },
                    child:   BoutonPlayStop(context),




              ),
                ),
              Visibility(
                visible: visibilite_bouton_explication,

                child: AbsorbPointer(
                  absorbing: desactive_bouton_Explication,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 200, 10),
                    child: IconButton(
                      icon: Icon(
                        Icons.info_outline_rounded,
                        size : 30 ,
                        color: clic_bouton_explication
                            ? couleurApresSelection_bouton_Explication
                            : couleurPardefault_bouton_Explication,
                        //color: currentIndex == 0 ? Colors.white : Colors.blue,
                      ),
                      onPressed: () {
                        _arretDeLaVOix();
                        ActualisationValeurAnimations();
                        initialisationDesZoneDetailler() ;

                        LancerLeTutoriel() ;
                        if (  (targets[valuerActuelIndiceAnimation].identify) == "0") {


                          setState(() {
                            _text_parler =   DescriptionA ;

                          });

                          _speak();
                          // _text_parler
                        }
                        valuerActuelIndiceAnimation ++ ;

                        setState(() {
                          clic_bouton_explication = !clic_bouton_explication;
                        });

                      },
                      splashColor: Colors.white,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: visibilite_bouton_sauvegarde,

                child: AbsorbPointer(
                  absorbing: desactive_bouton_Sauvegarde,

                  child: Container(
                    padding: EdgeInsets.fromLTRB(200, 10, 0, 10),
                    child: IconButton(
                      icon: Icon(


                          Icons.save,
                          size : 30 ,
                          color:  verifExisteQuestion ? couleurBouton_ApresSauvegarde : couleurBouton_AvantSauvegarde

                        // color:currentIndex == 1 ? Colors.white : Colors.blue,
                      ),
                      onPressed: () {



                        if (verifExisteQuestion == false ) {





                          Provider.of<FavorisState>(context , listen: false).ajoutQuestionFavoris(
                            idQuestion , questionTexte ,reponse_A , reponse_B , reponse_C , fauteGrave, explication ,point , cheminImageSource , numeroImagesource  ,
                            option_A , option_B , option_C ,
                            cheminImageAnimations ,
                            numeroImageA , VisibiliteAnimation_A , DescriptionA, positionGaucheA , positionHautA , positionDroiteA , positionBasA , hauteurA , largeurA,
                            numeroImageB , VisibiliteAnimation_B , DescriptionB, positionGaucheB , positionHautB , positionDroiteB , positionBasB , hauteurB , largeurB,
                            numeroImageC , VisibiliteAnimation_C , DescriptionC, positionGaucheC , positionHautC , positionDroiteC , positionBasC , hauteurC , largeurC,
                            numeroImageD , VisibiliteAnimation_D , DescriptionD, positionGaucheD , positionHautD , positionDroiteD , positionBasD , hauteurD , largeurD,
                            numeroImageE , VisibiliteAnimation_E , DescriptionE, positionGaucheE , positionHautE , positionDroiteE , positionBasE , hauteurE , largeurE,


                          );




                          setState(() {

                            verifExisteQuestion = !verifExisteQuestion ;


                          });



                          messageSauvegarder() ;

                        }

                        else {




                          int indexQuestionAsuprimer = Provider.of<FavorisState>(context , listen: false).retourneIndiceQuestion(idQuestion) ;

                          Provider.of<FavorisState>(context , listen: false).SuprimerQuestionsFavoris(indexQuestionAsuprimer) ;

                          messageSupression() ;

                          setState(() {

                            verifExisteQuestion = !verifExisteQuestion ;


                          });





                        }



                        //   Provider.of<Favoris>(context , listen: false).ajouterQuestion( idQuestion , q ,  reponse_A , reponse_B , reponse_C , g , e , point , chemin_image , NumeroImage) ;




                        setBottomBarIndex(1);
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














