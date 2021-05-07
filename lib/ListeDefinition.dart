import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Option.dart';
import 'Question.dart';

 class Definition    with  ChangeNotifier , DiagnosticableTreeMixin {


   int _numeroQuestion  = 0 ;
   int _numeroChoix = 0  ;
   String cleNumQD = "qDef";
   bool serieFini = false;
   int total = 3;
   int NbBonneReponse = 0;
   int NbMovaiseReponse = 0;
   int NbQuestionReondue = 0;
   Color commencer = Colors.black;
   Color enCours = Colors.lightBlue;

     Definition.C1(int a) {
     _numeroQuestion = a ;
     _numeroChoix = a ;
    }

   Definition.C2( );


    void   SetNumQueOpt( int value ) {


    _numeroQuestion = value ;
    _numeroChoix = value ;

    notifyListeners();

  }

   void affihe(){
     print('------  definition ------ ');

      print(_listeQuestionDefinition.toString());
     print(_listeOptionDefinition.toString());




   }
   List<Option> _listeOptionDefinition = [
     Option('d_o1' ,'Un accotement en saillie', ' Un accotement de plain pied',
         'Une piste cyclable'),
     Option('d_o2','La voie publique', ' La chaussée', 'La bande de circulation'),
     Option('d_o3', 'Oui', ' Non', ' Non c’est une piste cyclable'),

   ] ;

   List<Question> _listeQuestionDefinition = [
     Question(
        'd_q1' ,
         ' Cette partie est : ',
         false,
         false,
         true,
         false,
         ' Une piste Cyclable ',
         1 ,
       'imageDefinition',
       1 ,

       'explicationA',
       1 ,
       'explication1',
       2 ,
       'explication1',
       3 ,
       'explication1',
       4 ,
       'explication1',
       5 ,

     ),

     Question(
         'd_q2' , 'Cette partie est : ',
         true,
         false,
         false,
         false,
         ' La voie publique',
         1 ,
         'imageDefinition' ,
         2 ,
       'explication2',
       1 ,
       'explication2',
       2 ,
       'explication2',
       3 ,
       'explication2',
       0 ,
       'explication2',
       0  ,

     ),

     Question(
         'd_q3'  , 'Cette bande rouge fait partie de la chaussée',
         true,
         false,
         false,
         false,
         ' On parle parfois de piste cyclable suggérée',
         1 ,
         'imageDefinition' ,
     3 ,
       'explication3',
       1 ,
       'explication3',
       0 ,
       'explication3',
       0 ,
       'explication3',
       0 ,
       'explication3',
       0


     ),


   ];


   String get getCleNumQueDef =>  cleNumQD ;
   int get getNumQueDef =>  _numeroQuestion ;
   int get getNumChoDef =>  _numeroChoix ;



/////////////////////////////////////////////////////////////////////
   ///// ---------------   LISTE DES FONCTIONS  QUESTIONS -------------- /////////
   /////////////////////////////////////////////////////////////////////

   int retourneIndiceQuestion( String value){

     var  indice =  _listeQuestionDefinition.indexWhere((innerElement) => innerElement.id == value);

     return indice ;
   }

   void questionSuivante() {
     if (_numeroQuestion <= _listeQuestionDefinition.length - 1) {
       _numeroQuestion++;
     }
   }

   void optionSuivante() {
     if (_numeroChoix <= _listeOptionDefinition.length - 1) {
       _numeroChoix++;
     }
   }

   bool FinTheme() {
     if (_numeroQuestion >= _listeQuestionDefinition.length - 1) {
       return true;
     } else {
       return false;
     }
   }

   List listeQuestionDefinition() {
     return _listeQuestionDefinition;
   }

   int getTaille() {
     return _listeQuestionDefinition.length;
   }

   String getIdQuestion() {
     return _listeQuestionDefinition[_numeroQuestion].id;
   }

   String getQuestionText() {
     return _listeQuestionDefinition[_numeroQuestion].questionText;
   }

   bool getReponseA() {
     return _listeQuestionDefinition[_numeroQuestion].reponseA;
   }

   bool getReponseB() {
     return _listeQuestionDefinition[_numeroQuestion].reponseB;
   }

   bool getReponseC() {
     return _listeQuestionDefinition[_numeroQuestion].reponseC;
   }


   bool getFauteGrave() {
     return _listeQuestionDefinition[_numeroQuestion].fauteGrave;
   }

   String getExplication() {
     return _listeQuestionDefinition[_numeroQuestion].explication;
   }

   int getPoint() {
     return _listeQuestionDefinition[_numeroQuestion].point;
   }

   String getCheminImageSourceQuestion() {
     return _listeQuestionDefinition[_numeroQuestion].cheminImageSource;
   }

   int getNumeroImageSourceQuestion() {
     return _listeQuestionDefinition[_numeroQuestion].numeroImageSource;
   }

   String getCheminImageExplicationQuestionA() {
     return _listeQuestionDefinition[_numeroQuestion].cheminImageExplicationA;
   }

   int getNumeroImageExplicationQuestionA() {
     return _listeQuestionDefinition[_numeroQuestion].numeroImageExplicationA;
   }

   String getCheminImageExplicationQuestionB() {
     return _listeQuestionDefinition[_numeroQuestion].cheminImageExplicationB;
   }

   int getNumeroImageExplicationQuestionB() {
     return _listeQuestionDefinition[_numeroQuestion].numeroImageExplicationB;
   }

   String getCheminImageExplicationQuestionC() {
     return _listeQuestionDefinition[_numeroQuestion].cheminImageExplicationC;
   }

   int getNumeroImageExplicationQuestionC() {
     return _listeQuestionDefinition[_numeroQuestion].numeroImageExplicationC;
   }

   String getCheminImageExplicationQuestionD() {
     return _listeQuestionDefinition[_numeroQuestion].cheminImageExplicationD;
   }

   int getNumeroImageExplicationQuestionD() {
     return _listeQuestionDefinition[_numeroQuestion].numeroImageExplicationD;
   }

   String getCheminImageExplicationQuestionE() {
     return _listeQuestionDefinition[_numeroQuestion].cheminImageExplicationE;
   }

   int getNumeroImageExplicationQuestionE() {
     return _listeQuestionDefinition[_numeroQuestion].numeroImageExplicationE;
   }

   /////////////////////////////////////////////////////////////////////
   ///// ---------------   LISTE DES FONCTIONS  OPTION -------------- /////////
   /////////////////////////////////////////////////////////////////////


   String getIdOption() {
     return _listeOptionDefinition[_numeroChoix].id;
   }

   String getOptionA() {
     return _listeOptionDefinition[_numeroChoix].optionA;
   }

   String getOptionB() {
     return _listeOptionDefinition[_numeroChoix].optionB;
   }

   String getOptionC() {
     return _listeOptionDefinition[_numeroChoix].optionC;
   }


   List listeOptionDefinition() {
     return _listeOptionDefinition;
   }


     void reset() {
       _numeroQuestion = 0;
       _numeroChoix = 0;
     }







   }












