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
   int total ;
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



   List<Option> _listeOptionDefinition = [
     Option('d_o1' ,'Un baccotement en saillie', ' Un accotement de plain pied',
         'Une piste cyclable'),
     Option('d_o2','La voie publique', ' La chaussée', 'La bande de circulation'),
     Option('d_o3', 'oui en m\'écartant suffisament ', ' Non', 'null'),
     Option('d_o4', 'je passe a droit de l\'ilo', ' je passe a gauche de l\'ilo', ' je tourne avant   l\'ilo'),
     Option('d_o5', 'oui', 'non', 'null'),

     Option('d_o6', 'oui', 'non', 'null'),
     Option('d_o7', 'oui', 'non', 'null'),
     Option('d_o8', 'oui', 'non', 'null'),
     Option('d_o9', 'je peut passer et j\'ai la priorite', 'je doit m\'arreter', 'null'),



   ] ;

   List<Question> _listeQuestionDefinition = [
     Question(
        'd_q1' ,
         ' Cette  partie  est  boire : ',
         false,
         false,
         true,
         false,
         ' Une piste Cyclable ',
         1 ,
       'imageDefinition',
       1 ,

       'animation',
       1 ,


     ),

     Question(
         'd_q2' , 'Cette boire est manger  : ',
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
         'd_q3'  , 'Je peut dépasser le cycliste sur ce ralentisseur de trafic',
         false,
         true,
         false,
         false,
         'tous les dépassement sont interdits sur un ralentisseur de trafic  ',
         1 ,
         'imageDefinition' ,
     3 ,
       'animation',
       1 ,



     ),
     Question(
         'd_q4'  , 'je peut pour tourner a gauche dans ce carrefour ',
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
         'd_q5'  , '  en contournant ce camion a l\'arret , j\'effectue un A depassement  ',
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
         'd_q7'  , ' je peut tourner a droite a ce carrefour',
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
     Question(
       'd_q8'  , ' Je peux emprunter la bande de bus pour effectuer un dépassement ',
       true,
       false,
       null,
       false,
       ' La bande « bus », lorsqu\'elle est à gauche, ne peut être utilisée que pourtourner à gauche au prochain carrefour, pas pour dépasser',
       1 ,
       'imageDefinition' ,
       8,
       'animation',
       1 ,


     ),

     Question(
       'd_q9'  , ' Dans cette situation ',
       true,
       false,
       null,
       false,
       'le feu vert prime sur le signal , routier vous pouvez donc continuer le signal ne servira que si le signal ne fonctionne pas   ',
       1 ,
       'imageDefinition' ,
       9,
       'animation',
       1 ,


     ),

   ];


   String get getCleNumQueDef =>  cleNumQD ;
   int get getNumQueDef =>  _numeroQuestion ;
   int get getNumChoDef =>  _numeroChoix ;


     affiche(){
     print('///// ---------------  DEFINITION   -------------- /////////' ) ;

     print(_listeQuestionDefinition) ;


    }

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

   List listeQuestion() {
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

   String getCheminQuestionAnimationExplication() {
     return _listeQuestionDefinition[_numeroQuestion].cheminQuestionAnimationExplication;
   }

   int getNumeroQuestionAnimationExplication() {
     return _listeQuestionDefinition[_numeroQuestion].numeroQuestionAnimationExplication;
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




/*

   Card(
   child: IntrinsicHeight(
   child: Row(
   crossAxisAlignment: CrossAxisAlignment.stretch,
   children: <Widget>[
   Container(
   width: 20.0,
   color: Colors.amber,
   ),
   // Expanded(...)
   ],
   ),
   )
   )
*/
   }







