import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Option.dart';
import 'Question.dart';

class ConducteurPassager with  ChangeNotifier , DiagnosticableTreeMixin  {
  int _numeroQuestion = 0;
  int _numeroChoix = 0;

  String cleNumQcondPass = "qConPass";
  bool serieFini = false;
  int total = 15;
  int NbBonneReponse = 0;
  int NbMovaiseReponse = 0;
  int NbQuestionReondue = 0;
  Color commencer = Colors.black;
  Color enCours = Colors.lightBlue;

   ConducteurPassager.C1( int a ) {
    _numeroQuestion = a ;
    _numeroChoix = a ;

  }
  ConducteurPassager.C2( ) ;


  String get getCleNumQueCondPass =>  cleNumQcondPass ;
  int get getNumQuestionCondPass =>  _numeroQuestion ;
  int get getNumChoixCondPass=>  _numeroChoix ;

  void   SetNumQueCondPass( int value ) {


    _numeroQuestion = value ;
    _numeroChoix = value ;

    notifyListeners();

  }





  List<Option> _listeOptionConducteurPassager= [


  ] ;
  List<Question> _listeQuestionConducteurPassager = [


  ] ;



/////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DES FONCTIONS  QUESTIONS -------------- /////////
  /////////////////////////////////////////////////////////////////////

  int retourneIndiceQuestion( String value){

    var  indice =  _listeQuestionConducteurPassager.indexWhere((innerElement) => innerElement.id == value);

    return indice ;
  }

  void questionSuivante() {
    if (_numeroQuestion <= _listeQuestionConducteurPassager.length - 1) {
      _numeroQuestion++;
    }
  }

  void optionSuivante() {
    if (_numeroChoix <= _listeQuestionConducteurPassager.length - 1) {
      _numeroChoix++;
    }
  }

  bool FinTheme() {
    if (_numeroQuestion >= _listeQuestionConducteurPassager.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  List listeQuestion() {
    return _listeQuestionConducteurPassager;
  }

  int getTaille() {
    return _listeQuestionConducteurPassager.length;
  }

  int getIdQuestion() {
    return _listeQuestionConducteurPassager[_numeroQuestion].id;
  }

  String getQuestionText() {
    return _listeQuestionConducteurPassager[_numeroQuestion].questionText;
  }

  bool getReponseA() {
    return _listeQuestionConducteurPassager[_numeroQuestion].reponseA;
  }

  bool getReponseB() {
    return _listeQuestionConducteurPassager[_numeroQuestion].reponseB;
  }

  bool getReponseC() {
    return _listeQuestionConducteurPassager[_numeroQuestion].reponseC;
  }


  bool getFauteGrave() {
    return _listeQuestionConducteurPassager[_numeroQuestion].fauteGrave;
  }

  String getExplication() {
    return _listeQuestionConducteurPassager[_numeroQuestion].explication;
  }

  int getPoint() {
    return _listeQuestionConducteurPassager[_numeroQuestion].point;
  }

  String getCheminImageSourceQuestion() {
    return _listeQuestionConducteurPassager[_numeroQuestion].cheminImageSource;
  }

  int getNumeroImageSourceQuestion() {
    return _listeQuestionConducteurPassager[_numeroQuestion].numeroImageSource;
  }




  /////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DES FONCTIONS  OPTION -------------- /////////
  /////////////////////////////////////////////////////////////////////



  String getOptionA() {
    return _listeOptionConducteurPassager[_numeroChoix].optionA;
  }

  String getOptionB() {
    return _listeOptionConducteurPassager[_numeroChoix].optionB;
  }

  String getOptionC() {
    return _listeOptionConducteurPassager[_numeroChoix].optionC;
  }


  List listeOptionDefinition() {
    return _listeOptionConducteurPassager;
  }


  void reset() {
    _numeroQuestion = 0;
    _numeroChoix = 0;
  }






}

