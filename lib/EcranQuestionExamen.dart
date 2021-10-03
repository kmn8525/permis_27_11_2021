


import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:permis/Acceuil.dart';
import 'package:permis/EcranExamen.dart';
import 'package:permis/EcranIntroExamen.dart';
import 'package:permis/resultat/resultatDefinition.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

import 'Dessiner.dart';
import 'EcranSolutions.dart';

import 'ListeQuestionExamen.dart';
import 'package:flutter/animation.dart';

import 'TrasitionPages.dart';




var listRep = [] ;



var tampon = null ;
String chemin ;
String Titre ;
int MoyennePoint = 0 ;

class EcranQuestionsExamen extends StatefulWidget  {


  String titrePage  = 'Question_Examen';
  int NumImage ;


  EcranQuestionsExamen({Key key , this.titrePage, this.NumImage}) : super(key: key);
  EcranQuestionsExamen.C1( );


  @override
  EcranQuestionsExamenState createState() => EcranQuestionsExamenState();


  Object chargementListesDeQuestion() {

      var e = new  QuestionExamen.C2();
      tampon = e;




    return tampon ;

  }
  Object chargementTitre() {

        Titre = 'Question_Examen' ;


    return Titre ;

  }



}



enum TtsState { playing, stopped, paused, continued }

class EcranQuestionsExamenState extends State<EcranQuestionsExamen>  with   SingleTickerProviderStateMixin {


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

  String IdQuestion ;
  String IdOption ;

  Color couleurPardefault_A = Color(0xffffffff) ;
  Color couleurPardefault_B =  Color(0xffffffff) ;
  Color couleurPardefault_C =  Color(0xffffffff) ;

  Color couleurPardefault_bouton_Explication =  Colors.blue;
  Color couleurApresSelection_bouton_Explication =  Colors.blue;
  Color couleurAvant_Sauvegarde =  Colors.grey;
  Color couleurApres_Sauvegarde  =  Colors.blue;


  Color couleurApresSelection_A = Colors.orange;
  Color couleurApresSelection_B = Colors.orange;
  Color couleurApresSelection_C = Colors.orange;


  bool val = false ;
  String f ;


  bool choix_1;
  bool choix_2;
  bool choix_3;
  bool valeur_choisi;
  int  point ;

  int indice  ;




  bool clic_bouton_A = false;
  bool clic_bouton_B = false;
  bool clic_bouton_C = false;
  bool clic_bouton_explication = false;
  bool clic_bouton_sauvegarde = false;
  bool clic_bouton_Volume = true;


  bool visibilite_bouton_Valider = true;
  bool visibilite_bouton_explication = false;
  bool visibilite_bouton_sauvegarde = false;

   bool visibilite_bouton_C = false;

  bool visibilite_imageExplication_1 = true;
  bool visibilite_imageExplication_2 = true;
  bool visibilite_imageExplication_3 = true;
  bool visibilite_imageExplication_4 = true;
  bool visibilite_imageExplication_5 = true;


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


  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  Color couleurChoix = Colors.red;



  FlutterTts flutterTts;
  dynamic languages;
  //String language;
  double volume = 1.0;
  double pitch = 1.1;
  double rate = 1.0;
  String _text_parler = " ";
  String  id = "";
  String RecuperCleListeFavoris=" " ;


  /////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DE VARIABLE  QUI PERMETEENT DE ///////
  // SAUVEGARDER LES QUESTION ET OPTION-------------- /////////
  /////////////////////////////////////////////////////////////////////

  int idQuestion ;
  String idOption;
  String question;
  bool grave;
  String explication;
  bool repA;
  bool repB;
  bool repC;
  String  cheminImageSource;
  int numeroImagesource;
  String  cheminQuestionAnimationExplication;
  int numeroQuestionAnimationExplication;

  String optionA;
  String optionB;
  String optionC;



  /////////////////////////////////////////////////////////////////////
  //---------/////////////////////////////////------------//

   double valeurAnimation = 0.0 ;
  Color couleurAnimations = Colors.blue ;
  double debut = 0.0 ;
  double fin  = 1.0 ;
  Animation<double> animer ;
  AnimationController animationController;

  final  _screenshotController = ScreenshotController();




  @override
  void initState() {


    animationController = AnimationController(
        duration: const Duration(seconds: 20), vsync: this) ;

     widget.chargementListesDeQuestion();
    widget.chargementTitre();
    ChargeTitrePages();
    resetColor();
    masqueBoutonOption_C( ) ;
     initTts() ;
     _speak() ;

    visibilite_bouton_explication = false ;
    visibilite_bouton_sauvegarde = false ;
    clic_bouton_Volume = false ;



    super.initState();


  }



  @override
  void dispose() {
    animationController.dispose();
     flutterTts.stop();
    super.dispose();

  }

  int getIndiceTotal()
  {
    return indice ;
  }



  void  afficher ( ){
    if(this.mounted) {

    }
    else {
      setState(() {

      });
    }


  }

  String liensImageImageSource (){

    return tampon.getCheminImageSourceQuestion() ;
  }



  String ChargeTitrePages (){

    return widget.titrePage ;
  }


  Future _getLanguages() async {
    languages = await flutterTts.setLanguage("fr-FR");
    // flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
    if (languages != null) setState(() => languages);
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


  Future   _arretVolume() async {
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




  Color verificationDesReponse(bool a, bool b, bool c) {
    bool verif_a;
    bool verif_b;
    bool verif_c;

    String tmp;

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
        couleurChoix = Colors.red ;




        if ((verif_a == true) & (verif_b == true)) {
          couleurPardefault_A = Colors.green;
          couleurPardefault_B = Colors.green;
        } else if ((verif_a == true) & (verif_c == true)) {
          couleurPardefault_A = Colors.green;
          couleurPardefault_C = Colors.green;
        } else if ((verif_b == true) & (verif_c == true)) {
          couleurPardefault_B = Colors.green;
          couleurPardefault_C = Colors.green;
        } else if (verif_a == true) {
          couleurPardefault_A = Colors.green;
        } else if (verif_b == true) {
          couleurPardefault_B = Colors.green;
        } else {
          couleurPardefault_C = Colors.green;
        }








      }

      // --------------------------------------//
// ----- ON TESTE SI TOUTE LES VALEURS  SONT SELECTIONNER ---- //
      // --------------------------------------//

      else if ((a != null) & (b != null) & (c != null))
      {


        couleurChoix = Colors.red ;

        verif_a = tampon.getReponseA();
        verif_b = tampon.getReponseB();
        verif_c = tampon.getReponseC();

        if ((verif_a == a) & (verif_b == b)) {
          couleurApresSelection_A = Colors.green;
          couleurApresSelection_B = Colors.green;
          couleurApresSelection_C = Colors.red;

        } else if ((verif_a == a) & (verif_c == c)) {
          couleurApresSelection_A = Colors.green;
          couleurApresSelection_C = Colors.green;
          couleurApresSelection_B = Colors.red;

        } else if ((verif_b == b) & (verif_c == c)) {
          couleurApresSelection_B = Colors.green;
          couleurApresSelection_C = Colors.green;
          couleurApresSelection_A = Colors.red;

        } else if (verif_a == a) {
          couleurApresSelection_A = Colors.green;
          couleurApresSelection_B = Colors.red;
          couleurApresSelection_C = Colors.red;


        } else if (verif_b == b) {
          couleurApresSelection_B = Colors.green;
          couleurApresSelection_C = Colors.red;
          couleurApresSelection_A = Colors.red;


        } else {
          couleurApresSelection_C = Colors.green;
          couleurApresSelection_B = Colors.red;
          couleurApresSelection_A = Colors.red;

        }




      }

      // --------------------------------------//
// ----- ON TESTE SI   A ET B  SONT SELECTIONNER ---- //
      // --------------------------------------//
      else if ((a != null) & (b != null) )
      {

        verif_a = tampon.getReponseA();
        verif_b = tampon.getReponseB();
        verif_c = tampon.getReponseC();
        couleurChoix = Colors.red ;



        if ((verif_a == a) & (verif_b == b)) {
          couleurApresSelection_A = Colors.green;
          couleurApresSelection_B = Colors.green;
          couleurApresSelection_C = Colors.white;

          couleurChoix = Colors.green ;



        }

        else if (verif_a == a)
        {
          couleurApresSelection_A = Colors.green;
          couleurApresSelection_B = Colors.red;
          couleurPardefault_C = Colors.white;



        }
        else if (verif_b == b )
        {
          couleurApresSelection_B = Colors.green;
          couleurApresSelection_A = Colors.red;
          couleurPardefault_C = Colors.white;

        }
        else
        {
          couleurApresSelection_B = Colors.red;
          couleurApresSelection_A = Colors.red;

          couleurPardefault_C = Colors.green;

        }



      }

      // --------------------------------------//
// ----- ON TESTE SI   A ET C  SONT SELECTIONNER ---- //
      // --------------------------------------//

      else if ((a != null) & (c != null) )
      {


        verif_a = tampon.getReponseA();
        verif_b = tampon.getReponseB();
        verif_c = tampon.getReponseC();
        couleurChoix = Colors.red ;


        if ((verif_a == a) & (verif_c == c)) {
          couleurApresSelection_A = Colors.green;
          couleurApresSelection_C = Colors.green;
          couleurPardefault_B = Colors.white;


          couleurChoix = Colors.green ;

        }

        else if (verif_a == a)
        {
          couleurApresSelection_A = Colors.green;
          couleurApresSelection_C = Colors.red;
          couleurPardefault_B = Colors.white;


        }
        else if (verif_c == c)
        {
          couleurApresSelection_C = Colors.green;
          couleurApresSelection_A = Colors.red;
          couleurPardefault_B = Colors.white;

        }
        else {
          couleurPardefault_B = Colors.green;
          couleurApresSelection_C = Colors.red;
          couleurApresSelection_A = Colors.red;


        }



      }

      // --------------------------------------//
// ----- ON TESTE SI   B ET C  SONT SELECTIONNER ---- //
      // --------------------------------------//
      else if ((b != null) & (c != null) )
      {


        verif_a = tampon.getReponseA();
        verif_b = tampon.getReponseB();
        verif_c = tampon.getReponseC();
        couleurChoix = Colors.red ;


        if ((verif_b == b) & (verif_c == c)) {
          couleurApresSelection_B = Colors.green;
          couleurApresSelection_C = Colors.green;
          couleurPardefault_C = Colors.white;


          couleurChoix = Colors.green ;

        }

        else if (verif_b == b)
        {
          couleurApresSelection_B = Colors.green;
          couleurApresSelection_C = Colors.red;
          couleurPardefault_A = Colors.white;


        }
        else if (verif_c == c)
        {
          couleurApresSelection_C = Colors.green;
          couleurApresSelection_B = Colors.red;
          couleurPardefault_A = Colors.white;


        }
        else {
          couleurPardefault_A = Colors.green;
          couleurApresSelection_B = Colors.red;
          couleurApresSelection_C = Colors.red;

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
        couleurChoix = Colors.red ;



        if ((verif_a == a) & (verif_b == true)) {
          couleurApresSelection_A = Colors.green;
          couleurPardefault_B = Colors.green;
          couleurPardefault_C = Colors.white;

          couleurChoix = Colors.green ;

        } else if ((verif_b == true) & (verif_c == true)) {
          couleurApresSelection_A = Colors.red;
          couleurPardefault_B = Colors.green;
          couleurPardefault_C = Colors.green;

        } else if ((verif_a == a) & (verif_c == true)) {
          couleurApresSelection_A = Colors.green;
          couleurPardefault_B = Colors.white;
          couleurPardefault_C = Colors.green;


          couleurChoix = Colors.green ;


        } else  if (verif_a == a)  {
          couleurApresSelection_A = Colors.green;
          couleurPardefault_B = Colors.white;
          couleurPardefault_C = Colors.white;
          couleurChoix = Colors.green ;


          couleurChoix = Colors.green ;

        }
        else  if (verif_b == true)  {
          couleurApresSelection_A = Colors.red;
          couleurPardefault_B = Colors.green;
          couleurPardefault_C = Colors.white;

        }
        else {
          couleurApresSelection_A = Colors.red;
          couleurPardefault_B = Colors.white;
          couleurPardefault_C = Colors.green;


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

        couleurChoix = Colors.red ;


        if ((verif_b == b) & (verif_a == true)) {
          couleurApresSelection_B = Colors.green;
          couleurPardefault_A = Colors.green;
          couleurPardefault_C = Colors.white;

          couleurChoix = Colors.green ;

        } else if ((verif_b == true) & (verif_c == true)) {
          couleurApresSelection_B = Colors.red;
          couleurPardefault_A = Colors.green;
          couleurPardefault_C = Colors.green;
        } else if ((verif_b == b) & (verif_c == true)) {
          couleurApresSelection_B = Colors.green;
          couleurPardefault_A = Colors.white;
          couleurPardefault_C = Colors.green;

          couleurChoix = Colors.green ;

        }  else  if (verif_b == b)  {
          couleurApresSelection_B = Colors.green;
          couleurPardefault_B = Colors.green;
          couleurPardefault_C = Colors.white;


          couleurChoix = Colors.green ;

        }
        else  if (verif_a == true)  {
          couleurApresSelection_B = Colors.red;
          couleurPardefault_A = Colors.green;
          couleurPardefault_C = Colors.white;
        }
        else {
          couleurApresSelection_B = Colors.red;
          couleurPardefault_A = Colors.white;
          couleurPardefault_C = Colors.green;

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

        couleurChoix = Colors.red ;


        if ((verif_c == c) & (verif_a == true)) {
          couleurApresSelection_C = Colors.green;
          couleurPardefault_A = Colors.green;
          couleurPardefault_B = Colors.white;

          couleurChoix = Colors.green ;

        } else if ((verif_b == true) & (verif_a == true)) {
          couleurApresSelection_C = Colors.red;
          couleurPardefault_A = Colors.green;
          couleurPardefault_B = Colors.green;
        } else if ((verif_c == c) & (verif_a == true)) {
          couleurApresSelection_C = Colors.green;
          couleurPardefault_B = Colors.white;
          couleurPardefault_A = Colors.green;

          couleurChoix = Colors.green ;

        }  else  if (verif_c == c)  {
          couleurApresSelection_C = Colors.green;
          couleurPardefault_B = Colors.white;
          couleurPardefault_A = Colors.white;

          couleurChoix = Colors.green ;

        }
        else  if (verif_a == true)  {
          couleurApresSelection_C = Colors.red;
          couleurPardefault_A = Colors.green;
          couleurPardefault_B = Colors.white;
        }
        else {
          couleurApresSelection_C = Colors.red;
          couleurPardefault_A = Colors.white;
          couleurPardefault_B = Colors.green;

        }



      }

    });





    return couleurChoix ;
  }

// ----- REINITIALISATION DES COULEUR APRES LA PROCHAINE QUESTION ---- //

  void resetColor() {

    setState(() {
      couleurPardefault_B = Colors.white;
      couleurPardefault_A = Colors.white;
      couleurPardefault_C = Colors.white;

      couleurApresSelection_A = Colors.orange;
      couleurApresSelection_B = Colors.orange;
      couleurApresSelection_C = Colors.orange;
    });
  }

  /*void startTimer() {
    const oneSec = const Duration(seconds: 5);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {

        if (_start == 1) {
          setState(() {
            couleurAnimation = Colors.red ;

          });
        } else {
          setState(() {
            couleurAnimation = Colors.blue ;

            _start--;
          });
        }
      },
    );

  }
*/
  void arretAnimation() {

    animationController.stop() ;
  }



  double  lancerAnimation(){

    animationController.forward();


    animer = Tween<double>(begin: debut, end: fin).animate(animationController) ;
    animer.addListener(() {

        setState(() {
        valeurAnimation = animer.value ;

      });





      if ( valeurAnimation  > 0.8) {

        setState(() {
          couleurAnimations = Colors.orange ;

        });


      }

          if    (animationController.status == AnimationStatus.completed) {



           Color CouleurAchoisi =  verificationDesReponse(choix_1, choix_2, choix_3);

         // Provider.of<Resultats>(context , listen: false).ajouterCouleurResultats(CouleurAchoisi);

          ValiderResultats();

          Provider.of<ResultatDefinition>(context , listen: false).ajoutQuestionExamen(
              idQuestion , question ,repA , repB , repC , grave,
              explication ,point , cheminImageSource , numeroImagesource ,
              optionA , optionB , optionC);


          setState(() {
            desactive_boutonA = !desactive_boutonA;
            desactive_boutonB = !desactive_boutonB;
            desactive_boutonC = !desactive_boutonC;

          });


           animationController.stop();

BoutonSuivant();


        }



        });


return valeurAnimation ;
  }




void restartAnimation(){

  animationController.value = 0.0;
  couleurAnimations = Colors.blue ;



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
  void masqueBoutonOption_C( ) {

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

  var IconSongAlumer =   Icon(
    Icons.volume_up,
    color: Colors.black ,
    size: 20,
  );
  var IconSongEteind = Icon(
    Icons.volume_mute,
    color: Colors.black ,
    size: 20,
  );


  /*void _captureEcran() async {
    final imageFile = await _screenshotController.capture();
    Share.shareFiles([imageFile.path] , subject :'envoie de la question $idQuestion' , text : 'voici de la question ');
  }
*/


  void ActulisationDesvaleurAsauvegarder(){
    idQuestion = tampon.getIdQuestion();
    question = tampon.getQuestionText();
    grave = tampon.getFauteGrave() ;
    explication = tampon.getExplication();
    repA = tampon.getReponseA() ;
    repB = tampon.getReponseB() ;
    repC = tampon.getReponseC() ;
    cheminImageSource = tampon.getCheminImageSourceQuestion() ;
    numeroImagesource = tampon.getNumeroImageSourceQuestion() ;

    optionA = tampon.getOptionA() ;
    optionB = tampon.getOptionB();
    optionC = tampon.getOptionC();
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
                color: Colors.white70,
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




  void BoutonSuivant() {


    resetColor();
    setState(() {

      if (tampon.FinTheme() == true) {

        animationController.stop();
        _arretVolume();



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
              //  margin: EdgeInsets.all(15),

                child: Text(
                  "ACCEUIL",
                  style: TextStyle(color: Colors.white, fontSize: 8),
                ),
                color: Color.fromRGBO(0, 179, 134, 1.0),

                onPressed: ()
                {
                  Provider.of<ResultatDefinition>(context , listen: false).SuprimerLesResultat();

                  Provider.of<ResultatDefinition>(context , listen: false).reset();

                  Navigator.pop(context);
                  resetColor();

                  // REINITIALISATION DE LA LISTE

                  tampon.reset();

                  // lire les texte apres avoir reset
                  masqueBoutonOption_C();

                  desactive_boutonA = !desactive_boutonA;
                  desactive_boutonB = !desactive_boutonB;
                  desactive_boutonC = !desactive_boutonC;

                  clic_bouton_A = false;
                  clic_bouton_B = false;
                  clic_bouton_C = false;


                }
            ),

            DialogButton(
              margin: EdgeInsets.all(15),

              child: Text(

                "EXAMEN",
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),


              onPressed:  () {
                _arretVolume();
                Provider.of<ResultatDefinition>(context , listen: false).SuprimerLesResultat();

                Provider.of<ResultatDefinition>(context , listen: false).reset();


                Navigator.of(context, rootNavigator: true ).push(TransitionHaut(

                    page :  Accueil( 2 )));




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

                _arretVolume();
                Navigator.of(context, rootNavigator: false ).push(MaterialPageRoute(
                    builder: (BuildContext context  ) =>
                        EcranSolutions(TitreTheme: '${Titre}' )));

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

        desactive_boutonA = !desactive_boutonA;
        desactive_boutonB = !desactive_boutonB;
        desactive_boutonC = !desactive_boutonC;

        clic_bouton_A = false;
        clic_bouton_B = false;
        clic_bouton_C = false;

        tampon.questionSuivante();
        tampon.optionSuivante();
        masqueBoutonOption_C( ) ;

        restartAnimation();
        resetColor();



      }

    });


  }

  void ValiderResultats() {
    setState(() {
      choix_1 = null;
      choix_2 = null;
      choix_3 = null;
 
    });


  }

  Future<dynamic> awaitSpeakCompletion(bool awaitCompletion) async {
    await flutterTts.awaitSpeakCompletion(awaitCompletion);

  }

  Widget BoutonPlay(BuildContext context) {



     return  GestureDetector(
      child: SizedBox(
        width: 65,
        height: 65 ,
        child: LiquidCircularProgressIndicator(
          value: valeurAnimation   ,
          direction: Axis.vertical,
          backgroundColor: Colors.white54,
          valueColor: AlwaysStoppedAnimation(couleurAnimations),
          center: Row(
            children:  [
              Visibility(
                visible: visibilite_bouton_Valider,

                child: Expanded(
                  child: Container(
                    child: FlatButton(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),

                      child: SvgPicture.asset(
                        'assets/icons/play.svg',
                        height: 35.0,
                        width:  35.0,
                        allowDrawingOutsideViewBox: true,
                      ),
                      onPressed: () {

                        Color CouleurAchoisi =  verificationDesReponse(choix_1, choix_2, choix_3);

                       // Provider.of<Resultats>(context , listen: false).ajouterCouleurResultats(CouleurAchoisi);

                        ValiderResultats();
                        Provider.of<ResultatDefinition >(context , listen: false).ajoutQuestionExamen(
                            idQuestion , question ,repA , repB , repC , grave,
                            explication ,point , cheminImageSource , numeroImagesource ,
                            optionA , optionB , optionC);



                        setState(() {
                          desactive_boutonA = !desactive_boutonA;
                          desactive_boutonB = !desactive_boutonB;
                          desactive_boutonC = !desactive_boutonC;

                        });
                        animationController.stop();

                        BoutonSuivant();
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


  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    final Size size = MediaQuery.of(context).size;


    ActulisationDesvaleurAsauvegarder();


    return Scaffold(
      extendBody: true,

      appBar: AppBar(
        toolbarHeight : 40 ,

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

            Center(
              child: Container(
                 child: Text(widget.titrePage) ,


              ),
            ),


            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),

                child: IconButton(
                    icon:   Icon(
                      Icons.bug_report_outlined,
                      color: Colors.black ,
                      size: 25,
                    ),
                    onPressed: () {
                      _arretVolume() ;

                      EcranFormulaireTextField(context) ;
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
            alignment :  AlignmentDirectional.center,

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
                          child: Container(

                            child: Image.asset(
                              'assets/${tampon.getCheminImageSourceQuestion()}/source/${tampon.getNumeroImageSourceQuestion()}.webp',
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
                                                  ? couleurApresSelection_A
                                                  : couleurPardefault_A,
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
                                              ? couleurApresSelection_A
                                              : couleurPardefault_A,

                                        ),
                                      ),
                                      height: 35.0,
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
                                            color: clic_bouton_B ? couleurApresSelection_B : couleurPardefault_B,
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
                                          color: clic_bouton_B ? couleurApresSelection_B : couleurPardefault_B,
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
                                                color: clic_bouton_C ? couleurApresSelection_C : couleurPardefault_C,
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
                                              ? couleurApresSelection_C
                                              : couleurPardefault_C,
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





                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: visibilite_imageExplication_1,
                child: Positioned(
                  bottom: 600 ,
                  left: 100,
                  child :  SvgPicture.asset(
                    'assets/profil/nuage.svg',
                    height: 100.0,
                    width: 100.0,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
              ) ,

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
                        child:   BoutonPlay(context),


                      ),

                    ),


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




}














/*
void startAnimation (){




  controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this);
  _animationController.forward();

  _animationController.addStatusListener((status) {


    valeurProgression =  _animationController.value ;
    if (_animationController.value == 3 ) {
      couleurAnimation = Colors.red;
    }

    else {

      couleurAnimation = Colors.blue;


    }



    setState(() {

      if ( status == AnimationStatus.completed) {
        Color CouleurAchoisi =  verificationDesReponse(choix_1, choix_2, choix_3);

        Provider.of<Resultats>(context , listen: false).ajouterCouleurResultats(CouleurAchoisi);

        BoutonValider();

        Provider.of<Resultats>(context , listen: false).ajoutQuestionResultat(idQuestion , q ,repA , repB , repC , g
            , e ,point , cheminImageSource , numImagesource ,cheminImageExplicationA ,numeroImageExplicationA ,
            cheminImageExplicationB ,numeroImageExplicationB , cheminImageExplicationC ,numeroImageExplicationC ,
            cheminImageExplicationD ,numeroImageExplicationD , cheminImageExplicationE , numeroImageExplicationE);

        Provider.of<Resultats>(context , listen: false).ajoutOptionResultat(idOption ,optionA, optionB, optionC);


        desactive_boutonA = !desactive_boutonA;
        desactive_boutonB = !desactive_boutonB;
        desactive_boutonC = !desactive_boutonC;

        clic_bouton_Volume = false ;
        visibilite_bouton_explication = false ;
        visibilite_bouton_sauvegarde = false ;

        BoutonSuivant();


        // context.read<EcranQuestionsState>().BoutonSuivant();

        */
/*BoutonPlayStop(context) ;

            BoutonSuivant();*//*

        //_ecqBloc.aficherStream.listen((event) { }) ;
        // cleEcranQuestions.currentState.aficher();
        // couleur = Colors.blueAccent ;
        // cleEcranQuestions.currentState.aficher ();




        //_animationController.repeat();
      }
    });


  }) ;



}


*/

