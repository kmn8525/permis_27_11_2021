import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'AnimerQuestion.dart';
import 'Option.dart';
import 'Question.dart';

class QuestionExamen    with  ChangeNotifier , DiagnosticableTreeMixin {


  int _numeroQuestion  = 0 ;
  int _numeroChoix = 0  ;
  String cleNumQE = "qExam";
  bool serieFini = false;
  int total = 3;
  int NbBonneReponse = 0;
  int NbMovaiseReponse = 0;
  int NbQuestionReondue = 0;
  Color commencer = Colors.black;
  Color enCours = Colors.lightBlue;

  QuestionExamen.C1(int a) {
    _numeroQuestion = a ;
    _numeroChoix = a ;
  }

  QuestionExamen.C2( );


  void   SetNumQueOpt( int value ) {


    _numeroQuestion = value ;
    _numeroChoix = value ;

    notifyListeners();

  }

  void affihe(){





  }


  List<Question> _listeQuestionExamen = [


    Question(1, 'Cette partie est  : ', false, false, true, false,
      ' partie de la voie publique réservée aux cyclistes et cyclomotoristes classe A . ',
      1 , 'imageDefinition', 1 ,

      Option( 'Un baccotement en saillie  ', ' Un accotement de plain pied',
          'Une piste cyclable'),

      AnimerQuestion ("imageDefinition",
        1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
        2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
        3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
        4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
        0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
      ) ,
    ),

    Question(
      2 , 'Cette  partie est    : ',
      true,
      false,
      false,
      false,
      ' La voie publique',
      1 ,
      'imageDefinition' ,
      2 ,

      Option( 'La voie publique', ' La chaussée', 'La bande de circulation'),

      AnimerQuestion ("imageDefinition",
        1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
        2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
        3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
        4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
        0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
      ) ,

    ),

    Question(
      3 , 'Je peut dépasser le cycliste sur ce ralentisseur de trafic',
      false,
      true,
      false,
      false,
      'tous les dépassement sont interdits sur un ralentisseur de trafic  ',
      1 ,
      'imageDefinition' ,
      3 ,

      Option(  'oui en m\'écartant suffisament ', ' Non', 'null'),

      AnimerQuestion ("imageDefinition",
        1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
        2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
        3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
        4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
        0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
      ) ,


    ),
    Question(
      4  , 'je peut pour tourner a gauche dans ce carrefour ',
      true,
      false,
      false,
      false,
      ' On parle parfois de piste cyclable suggérée',
      1 ,
      'imageDefinition' ,
      4 ,

      Option( 'je passe a droit de l\'ilo', ' je passe a gauche de l\'ilo', ' je tourne avant   l\'ilo'),

      AnimerQuestion ("imageDefinition",
        1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
        2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
        3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
        4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
        0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
      ) ,


    ),

    Question(
      5 , '  en contournant ce camion a l\'arret , j\'effectue un A depassement  ',
      true,
      false,
      null,
      false,
      ' vous pouvez',
      1 ,
      'imageDefinition' ,
      5 ,

      Option( 'oui', 'non', 'null'),
      AnimerQuestion ("imageDefinition",
        1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
        2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
        3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
        4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
        0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
      ) ,


    ),

    Question(
      6  , ' le vehicule qui me precede reste au milieu de la chaussée , je peut le depasser par la droite   ',
      true,
      false,
      null,
      false,
      'le depassement s\'effectue par la gauche',
      1 ,
      'imageDefinition' ,
      6 ,

      Option( 'oui', 'non', 'null'),
      AnimerQuestion ("imageDefinition",
        1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
        2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
        3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
        4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
        0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
      ) ,


    ),

    Question(
      7 , ' je peut tourner a droite a ce carrefour',
      true,
      false,
      null,
      false,
      ' On parle parfois de piste cyclable suggérée',
      1 ,
      'imageDefinition' ,
      7,

      Option( 'oui', 'non', 'null'),
      AnimerQuestion ("imageDefinition",
        1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
        2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
        3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
        4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
        0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
      ) ,

    ),
    Question(
      8  , ' Je peux emprunter la bande de bus pour effectuer un dépassement ',
      true,
      false,
      null,
      false,
      ' La bande « bus », lorsqu\'elle est à gauche, ne peut être utilisée que pourtourner à gauche au prochain carrefour, pas pour dépasser',
      1 ,
      'imageDefinition' ,
      8,

      Option(  'oui', 'non', 'null'),
      AnimerQuestion ("imageDefinition",
        1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
        2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
        3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
        4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
        0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
      ) ,

    ),

    Question(
      9 , ' Dans cette situation ',
      true,
      false,
      null,
      false,
      'le feu vert prime sur le signal , routier vous pouvez donc continuer le signal ne servira que si le signal ne fonctionne pas   ',
      1 ,
      'imageDefinition' ,
      9,

      Option( 'oui', 'non', 'null'),
      AnimerQuestion ("imageDefinition",
        1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
        2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
        3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
        4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
        0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
      ) ,


    ),

  ];


  String get getCleNumQueDef =>  cleNumQE ;
  int get getNumQueDef =>  _numeroQuestion ;
  int get getNumChoDef =>  _numeroChoix ;



  /////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DES FONCTIONS POUR LES  ANIMATIONS -------------- /////////
  /////////////////////////////////////////////////////////////////////

  String getCheminImageAnimations() {
    return _listeQuestionExamen[_numeroQuestion].animationquestion.cheminImageAnimations;
  }

  int  getNumeroImageA() {
    return _listeQuestionExamen[_numeroQuestion].animationquestion.numeroImageA;
  }


  bool   getVisibiliteA() {
    return _listeQuestionExamen[_numeroQuestion].animationquestion.visibiliteA;
  }


  String getDescriptionA() {
    return _listeQuestionExamen[_numeroQuestion].animationquestion.DescriptionA;
  }


  double getPositionGaucheA() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionGaucheA;

  }

  double getPositionHautA() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionHautA;

  }

  double getPositionDroiteA() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionDroiteA;

  }

  double getPositionBasA() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionBasA;

  }

  double getHauteurA () {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.hauteurA;

  }


  double getLargeurA () {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.largeurA;

  }


  ///// *******************    B  *******************  /////////



  int  getNumeroImageB() {
    return _listeQuestionExamen[_numeroQuestion].animationquestion.numeroImageB;
  }


  bool   getVisibiliteB() {
    return _listeQuestionExamen[_numeroQuestion].animationquestion.visibiliteB;
  }


  String getDescriptionB() {
    return _listeQuestionExamen[_numeroQuestion].animationquestion.DescriptionB;
  }


  double getPositionGaucheB() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionGaucheB;

  }

  double getPositionHautB() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionHautB;

  }

  double getPositionDroiteB() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionDroiteB;

  }

  double getPositionBasB() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionBasB;

  }

  double getHauteurB () {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.hauteurB;

  }


  double getLargeurB () {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.largeurB;

  }

  ///// *******************    C  *******************  /////////



  int  getNumeroImageC() {
    return _listeQuestionExamen[_numeroQuestion].animationquestion.numeroImageC;
  }


  bool   getVisibiliteC() {
    return _listeQuestionExamen[_numeroQuestion].animationquestion.visibiliteC;
  }


  String getDescriptionC() {
    return _listeQuestionExamen[_numeroQuestion].animationquestion.DescriptionC;
  }


  double getPositionGaucheC() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionGaucheC;

  }

  double getPositionHautC() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionHautC;

  }

  double getPositionDroiteC() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionDroiteC;

  }

  double getPositionBasC() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionBasC;

  }

  double getHauteurC () {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.hauteurC;

  }


  double getLargeurC () {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.largeurC;

  }

  ///// *******************    D  *******************  /////////



  int  getNumeroImageD() {
    return _listeQuestionExamen[_numeroQuestion].animationquestion.numeroImageD;
  }


  bool   getVisibiliteD() {
    return _listeQuestionExamen[_numeroQuestion].animationquestion.visibiliteD;
  }


  String getDescriptionD() {
    return _listeQuestionExamen[_numeroQuestion].animationquestion.DescriptionD;
  }


  double getPositionGaucheD() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionGaucheD;

  }

  double getPositionHautD() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionHautD;

  }

  double getPositionDroiteD() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionDroiteD;

  }

  double getPositionBasD() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionBasD;

  }

  double getHauteurD() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.hauteurD;

  }


  double getLargeurD() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.largeurD;

  }

  ///// *******************    E   *******************  /////////



  int  getNumeroImageE() {
    return _listeQuestionExamen[_numeroQuestion].animationquestion.numeroImageE;
  }


  bool   getVisibiliteE() {
    return _listeQuestionExamen[_numeroQuestion].animationquestion.visibiliteE;
  }


  String getDescriptionE() {
    return _listeQuestionExamen[_numeroQuestion].animationquestion.DescriptionE;
  }


  double getPositionGaucheE() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionGaucheE;

  }

  double getPositionHautE() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionHautE;

  }

  double getPositionDroiteE() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionDroiteE;

  }

  double getPositionBasE() {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.positionBasE;

  }

  double getHauteurE () {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.hauteurE;

  }


  double getLargeurE () {

    return _listeQuestionExamen[_numeroQuestion].animationquestion.largeurE;

  }




  /////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DES FONCTIONS POUR LES  QUESTIONS -------------- /////////
  /////////////////////////////////////////////////////////////////////

  int retourneIndiceQuestion( int value){

    var  indice =  _listeQuestionExamen.indexWhere((innerElement) => innerElement.id == value);

    return indice ;
  }

  void questionSuivante() {
    if (_numeroQuestion <= _listeQuestionExamen.length - 1) {
      _numeroQuestion++;
    }
  }




  bool FinTheme() {
    if (_numeroQuestion >= _listeQuestionExamen.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  List listeQuestion() {
    return _listeQuestionExamen;
  }

  int getTaille() {
    return _listeQuestionExamen.length;
  }

  int getIdQuestion() {
    return _listeQuestionExamen[_numeroQuestion].id;
  }

  String getQuestionText() {
    return _listeQuestionExamen[_numeroQuestion].questionText;
  }

  bool getReponseA() {
    return _listeQuestionExamen[_numeroQuestion].reponseA;
  }

  bool getReponseB() {
    return _listeQuestionExamen[_numeroQuestion].reponseB;
  }

  bool getReponseC() {
    return _listeQuestionExamen[_numeroQuestion].reponseC;
  }


  bool getFauteGrave() {
    return _listeQuestionExamen[_numeroQuestion].fauteGrave;
  }

  String getExplication() {
    return _listeQuestionExamen[_numeroQuestion].explication;
  }

  int getPoint() {
    return _listeQuestionExamen[_numeroQuestion].point;
  }

  String getCheminImageSourceQuestion() {
    return _listeQuestionExamen[_numeroQuestion].cheminImageSource;
  }

  int getNumeroImageSourceQuestion() {
    return _listeQuestionExamen[_numeroQuestion].numeroImageSource;
  }


  /////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DES FONCTIONS  POUR LES OPTION -------------- /////////
  /////////////////////////////////////////////////////////////////////

  String getOptionA() {
    return _listeQuestionExamen[_numeroQuestion].option.optionA;
  }



  String getOptionB() {
    return _listeQuestionExamen[_numeroQuestion].option.optionB;
  }

  String getOptionC() {
    return _listeQuestionExamen[_numeroQuestion].option.optionC;
  }


  void reset() {
    _numeroQuestion = 0;
  }

}










