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
   Option('cp_o1' , 'Oui' , ' Non, je dois être titulaire d’un permis de conduire catégorie C	 ' , 'Non, je dois être titulaire d’un permis de conduire catégorie C ou D' ) ,
    Option( 'cp_o2' , '5 places passagers' , ' 8 places passagers  ' , ' 18 places passagers' ) ,
    Option( 'cp_o3' , '40 cm  ' , ' 45 cm' , ' 60 cm	' ) ,



  ] ;
  List<Question> _listeQuestionConducteurPassager = [
    Question('cp_q1' ,'Je peux conduire un véhicule affecté au transport de choses d’une MMA de 6 tonnes, avec un permis de conduire catégorie B '
          , true , false , false , false ,
        'Pour conduire un véhicule affecté au transport de choses dont la MMA '
            'dépasse 3500 kg, vous devez être titulaire d’un permis de conduire catégorie C. Ni le permis B ni le permis D ne sont valables.' ,
        1 ,
    'imageConducteurPassager' ,
    1 ,
      'animation',
      1 ,


    ),


    Question('cp_q2', 'Un permis de conduire valable pour la catégorie B permet de conduire un véhicule affecté au transport de personnes comprenant maximum'
        , false , true , false , false, 'Maximum 8 places non compris le siège du conducteur. Sinon , '
            'vous devez être titulaire d’un permis de conduire catégorie D.' ,
        1 ,
    'imageConducteurPassager',
    2 ,
      'animation',
      0 ,

    ),


    Question('cp_q3','L’espace latéral minimal pour le passager d’une place avant d’un véhicule automobile est de'
        , true , false , false , true,'Chaque passager prenant place à l’avant d’un véhicule doit disposer d’une largeur minimale de 40 cm.'
            ' Le chauffeur doit quant à lui, disposer de 55 cm minimum.' ,5 ,
        'imageConducteurPassager' ,
    3 ,
      'animation',
      0 ,


    ) ,

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

  String getIdQuestion() {
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

  String getCheminQuestionAnimationExplication() {
    return _listeQuestionConducteurPassager[_numeroQuestion].cheminQuestionAnimationExplication;
  }

  int getNumeroQuestionAnimationExplication() {
    return _listeQuestionConducteurPassager[_numeroQuestion].numeroQuestionAnimationExplication;
  }



  /////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DES FONCTIONS  OPTION -------------- /////////
  /////////////////////////////////////////////////////////////////////


  String getIdOption() {
    return _listeOptionConducteurPassager[_numeroChoix].id;
  }

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

