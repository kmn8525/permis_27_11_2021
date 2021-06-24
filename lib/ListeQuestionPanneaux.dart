


import 'package:flutter/foundation.dart';
import 'QuestionPanneaux.dart';
class JeuxPanneaux  with  ChangeNotifier , DiagnosticableTreeMixin{

  int _numeroQuestion  = 0 ;
  String cleNumQPan = "qPan";




  JeuxPanneaux.C1() ;


  List<QuestionPanneaux> _listeQuestionPanneaux = [


    QuestionPanneaux( 'pan_q1' ,
                                 'imageJeuxPanneaux/imageA', '1' , true ,
                                  'imageJeuxPanneaux/imageB' ,'1', false ,
                                 'imageJeuxPanneaux/imageC' ,'1', false ,
                                 'imageJeuxPanneaux/imageD' ,'1', false ,
                                 'imageJeuxPanneaux/imageE' ,'1', true ,
                                  'imageJeuxPanneaux/imageF' ,'1', false ,
                                  'imageJeuxPanneaux/imageG' ,'1', false ,
                                  'imageJeuxPanneaux/imageH' ,'1', true ,
                                   'imageJeuxPanneaux/imageI' ,'1', false ,
        'Ce panneaux indique une obligation de  continuer tous Droit ' ,

    ) ,

    QuestionPanneaux( 'pan_q2' ,
      'imageJeuxPanneaux/imageA', '2' , false ,
      'imageJeuxPanneaux/imageB' ,'2', false ,
      'imageJeuxPanneaux/imageC' ,'2', true ,

      'imageJeuxPanneaux/imageD' ,'2', false ,
      'imageJeuxPanneaux/imageE' ,'2', false ,
      'imageJeuxPanneaux/imageF' ,'2', true ,

      'imageJeuxPanneaux/imageG' ,'2', true ,
      'imageJeuxPanneaux/imageH' ,'2', false ,
      'imageJeuxPanneaux/imageI' ,'2', false ,
      'Ce panneaux indique une priorité de droite ' ,

    ) ,



  ] ;


  String CheminImageCorrecte(){

    String cheminImageCorrect = ' ';
    if( (_listeQuestionPanneaux[_numeroQuestion].reponseG) == true ) {

      cheminImageCorrect  = _listeQuestionPanneaux[_numeroQuestion].cheminImageSourceG ;

    }

    else if ( (_listeQuestionPanneaux[_numeroQuestion].reponseH) ==  true  )  {

      cheminImageCorrect  = _listeQuestionPanneaux[_numeroQuestion].cheminImageSourceH ;


    }


    else if  ( (_listeQuestionPanneaux[_numeroQuestion].reponseI) ==  true  )  {

      cheminImageCorrect  = _listeQuestionPanneaux[_numeroQuestion].cheminImageSourceI ;



    }
return cheminImageCorrect ;


  }


  String CheminNumeroImageCorrecte(){

    String cheminNumeroImageCorrect = '';

    if( (_listeQuestionPanneaux[_numeroQuestion].reponseG) == true ) {

      cheminNumeroImageCorrect  = _listeQuestionPanneaux[_numeroQuestion].nomImageSourceG ;

    }

    else if ( (_listeQuestionPanneaux[_numeroQuestion].reponseH) ==  true  )  {

      cheminNumeroImageCorrect  = _listeQuestionPanneaux[_numeroQuestion].nomImageSourceH ;


    }


    else if  ( (_listeQuestionPanneaux[_numeroQuestion].reponseI) ==  true  )  {

      cheminNumeroImageCorrect  = _listeQuestionPanneaux[_numeroQuestion].nomImageSourceI ;


    }
    return cheminNumeroImageCorrect ;


  }

  int retourneIndiceQuestion( String value){

    var  indice =  _listeQuestionPanneaux.indexWhere((innerElement) => innerElement.id == value);

    return indice ;
  }

  void questionSuivante() {
    if (_numeroQuestion <= _listeQuestionPanneaux.length - 1) {
      _numeroQuestion++;
    }
  }

  bool FinTheme() {
    if (_numeroQuestion >= _listeQuestionPanneaux.length - 1) {
      return true;
    } else {
      return false;
    }
  }


  List listeQuestion() {
    return _listeQuestionPanneaux;
  }

  int getTaille() {
    return _listeQuestionPanneaux.length;
  }


  String getIdQuestion() {
    return _listeQuestionPanneaux[_numeroQuestion].id;
  }



  String getCheminImageSourceA() {
    return _listeQuestionPanneaux[_numeroQuestion].cheminImageSourceA;
  }

  String getNomImageSourceA() {
    return _listeQuestionPanneaux[_numeroQuestion].nomImageSourceA;
  }

  bool getReponseA() {
    return _listeQuestionPanneaux[_numeroQuestion].reponseA;
  }



  String getCheminImageSourceB() {
    return _listeQuestionPanneaux[_numeroQuestion].cheminImageSourceB;
  }

  String getNomImageSourceB() {
    return _listeQuestionPanneaux[_numeroQuestion].nomImagesourceB;
  }
  bool getReponseB() {
    return _listeQuestionPanneaux[_numeroQuestion].reponseB;
  }




  String getCheminImageSourceC() {
    return _listeQuestionPanneaux[_numeroQuestion].cheminImageSourceC;
  }

  String getNomImageSourceC() {
    return _listeQuestionPanneaux[_numeroQuestion].nomImageSourceC;
  }

  bool getReponseC() {
    return _listeQuestionPanneaux[_numeroQuestion].reponseC;
  }



  String getCheminImageSourceD() {
    return _listeQuestionPanneaux[_numeroQuestion].cheminImageSourceD;
  }

  String getNomImageSourceD() {
    return _listeQuestionPanneaux[_numeroQuestion].nomImageSourceD;
  }

  bool getReponseD() {
    return _listeQuestionPanneaux[_numeroQuestion].reponseD;
  }



  String getCheminImageSourceE() {
    return _listeQuestionPanneaux[_numeroQuestion].cheminImageSourceE;
  }

  String getNomImageSourceE() {
    return _listeQuestionPanneaux[_numeroQuestion].nomImageSourceE;
  }

  bool getReponseE() {
    return _listeQuestionPanneaux[_numeroQuestion].reponseE;
  }


  String getCheminImageSourceF() {
    return _listeQuestionPanneaux[_numeroQuestion].cheminImageSourceF;
  }

  String getNomImageSourceF() {
    return _listeQuestionPanneaux[_numeroQuestion].nomImageSourceF;
  }

  bool getReponseF() {
    return _listeQuestionPanneaux[_numeroQuestion].reponseF;
  }


  String getCheminImageSourceG() {
    return _listeQuestionPanneaux[_numeroQuestion].cheminImageSourceG;
  }

  String getNomImageSourceG() {
    return _listeQuestionPanneaux[_numeroQuestion].nomImageSourceG;
  }
  bool getReponseG() {
    return _listeQuestionPanneaux[_numeroQuestion].reponseG;
  }


  String getCheminImageSourceH() {
    return _listeQuestionPanneaux[_numeroQuestion].cheminImageSourceH;
  }

  String getNomImageSourceH() {
    return _listeQuestionPanneaux[_numeroQuestion].nomImageSourceH;
  }

  bool getReponseH() {
    return _listeQuestionPanneaux[_numeroQuestion].reponseH;
  }


  String getCheminImageSourceI() {
    return _listeQuestionPanneaux[_numeroQuestion].cheminImageSourceI;
  }

  String getNomImageSourceI() {
    return _listeQuestionPanneaux[_numeroQuestion].nomImageSourceI;
  }

  bool getReponseI() {
    return _listeQuestionPanneaux[_numeroQuestion].reponseI;
  }

  String getExplication() {
    return _listeQuestionPanneaux[_numeroQuestion].explication;
  }



  void reset() {
    _numeroQuestion = 0;
  }



}




