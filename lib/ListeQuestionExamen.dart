import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    print('------  definition ------ ');

    print(_listeQuestionExamen.toString());
    print(_listeOptionExamen.toString());




  }
  List<Option> _listeOptionExamen = [

    Option('d_o1','La voie publique', ' La chaussée', 'La bande de circulation'),
    Option('d_o2', 'Oui', ' Non', ' Non c’est une piste cyclable'),
    Option('d_o5', 'oui', 'non', 'null'),
    Option('d_o4', 'je passe a droit de l\'ilo', ' je passe a gauche de l\'ilo', ' je tourne avant   l\'ilo'),

    Option('d_o6', 'oui', 'non', 'null'),
    Option('d_o7', 'oui', 'non', 'null'),


  ] ;

  List<Question> _listeQuestionExamen = [


    Question(
      'd_q1' , 'Cette partie est : ',
      true,
      false,
      false,
      false,
      ' La voie publique',
      1 ,
      'imageDefinition' ,
      2 ,
      'animation',
      1 ,


    ),

    Question(
        'd_q2'  , 'Cette bande rouge fait partie de la chaussée',
        true,
        false,
        false,
        false,
        ' On parle parfois de piste cyclable suggérée',
        1 ,
        'imageDefinition' ,
        3 ,
        'animation',
        1 ,



    ),

    Question(
        'd_q4'  , 'pour tourner a gauche dans ce carrefour ',
        true,
        false,
        false,
        false,
        ' On parle parfois de piste cyclable suggérée',
        1 ,
        'imageDefinition' ,
        4 ,
        'animation',
        1 ,


    ),

    Question(
        'd_q5'  , '  en contournant ce camion a l\'arret , j\'effectue un depassement  ',
        true,
        false,
        null,
        false,
        ' vous pouvez',
        1 ,
        'imageDefinition' ,
        5 ,
        'animation',
        1 ,


    ),

    Question(
        'd_q6'  , ' le vehicule qui me precede reste au milieu de la chaussée , je peut le depasser par la droite   ',
        true,
        false,
        null,
        false,
        'le depassement s\'effectue par la gauche',
        1 ,
        'imageDefinition' ,
        6 ,
        'animation',
        1 ,


    ),
    Question(
        'd_q7'  , ' je peut tourner a droite  ',
        true,
        false,
        null,
        false,
        ' On parle parfois de piste cyclable suggérée',
        1 ,
        'imageDefinition' ,
        7,
        'animation',
         1 ,


    ),



  ];


  String get getCleNumQueDef =>  cleNumQE ;
  int get getNumQueDef =>  _numeroQuestion ;
  int get getNumChoDef =>  _numeroChoix ;



/////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DES FONCTIONS  QUESTIONS -------------- /////////
  /////////////////////////////////////////////////////////////////////

  int retourneIndiceQuestion( String value){

    var  indice =  _listeQuestionExamen.indexWhere((innerElement) => innerElement.id == value);

    return indice ;
  }

  void questionSuivante() {
    if (_numeroQuestion <= _listeQuestionExamen.length - 1) {
      _numeroQuestion++;
    }
  }

  void optionSuivante() {
    if (_numeroChoix <= _listeOptionExamen.length - 1) {
      _numeroChoix++;
    }
  }

  bool FinTheme() {
    if (_numeroQuestion >= _listeQuestionExamen.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  List listeQuestionDefinition() {
    return _listeQuestionExamen;
  }

  int getTaille() {
    return _listeQuestionExamen.length;
  }

  String getIdQuestion() {
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

  String getCheminQuestionAnimationExplication() {
    return _listeQuestionExamen[_numeroQuestion].cheminQuestionAnimationExplication;
  }

  int getNumeroQuestionAnimationExplication() {
    return _listeQuestionExamen[_numeroQuestion].numeroQuestionAnimationExplication;
  }


  /////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DES FONCTIONS  OPTION -------------- /////////
  /////////////////////////////////////////////////////////////////////


  String getIdOption() {
    return _listeOptionExamen[_numeroChoix].id;
  }

  String getOptionA() {
    return _listeOptionExamen[_numeroChoix].optionA;
  }

  String getOptionB() {
    return _listeOptionExamen[_numeroChoix].optionB;
  }

  String getOptionC() {
    return _listeOptionExamen[_numeroChoix].optionC;
  }


  List listeOptionDefinition() {
    return _listeOptionExamen;
  }


  void reset() {
    _numeroQuestion = 0;
    _numeroChoix = 0;
  }





}










