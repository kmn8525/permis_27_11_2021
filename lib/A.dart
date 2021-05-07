
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';


import 'Option.dart';
import 'Question.dart';

class Favoris  extends   ChangeNotifier   {


  List<Question> _listeQuestionFavoris = [];
  List<Option> _listeDeChoixFavoris =  [];




  int _numeroQuestion = 0;
  int _numeroChoix = 0;
  String _cleListeQuestionSauvegarder = 'cqf';
  String _cleListeOptionSauvegarder = 'cof';
  bool _serieFini;
  int _total;
  int _nbBonneReponse;
  int _nbMauvaiseReponse;
  int _nbQuestionRepondue;



  Favoris( );

  Favoris.C1(int a ) {
    _numeroQuestion = a ;
    _numeroChoix = a ;
  }



  int get getNumeroQuestion => _numeroQuestion;
  set numeroQuestion(int numeroQuestion) => _numeroQuestion = numeroQuestion;

  int get getNumeroChoix => _numeroChoix;
  set numeroChoix(int numeroChoix) => _numeroChoix = numeroChoix;

  String get getCleListeSauvegarder => _cleListeQuestionSauvegarder;
  set cleListeSauvegarder(String cleListeSauvegarder) =>
      _cleListeQuestionSauvegarder = cleListeSauvegarder;

  bool get getSerieFini => _serieFini;
  set serieFini(bool serieFini) => _serieFini = serieFini;

  int get getTotal => _total;
  set total(int total) => _total = total;

  int get getNbBonneReponse => _nbBonneReponse;
  set nbBonneReponse(int nbBonneReponse) => _nbBonneReponse = nbBonneReponse;

  int get getNbMauvaiseReponse => _nbMauvaiseReponse;
  set nbMauvaiseReponse(int nbMauvaiseReponse) =>
      _nbMauvaiseReponse = nbMauvaiseReponse;

  int get getNbQuestionRepondue => _nbQuestionRepondue;
  set nbQuestionRepondue(int nbQuestionRepondue) =>
      _nbQuestionRepondue = nbQuestionRepondue;

  List<Question> get getListeQuestionFavoris=> _listeQuestionFavoris;

  void setListeQuestionFavoris(List<Question> listeQuestionFavoris) {
    _listeQuestionFavoris = listeQuestionFavoris;

  }

  List<Option> get getListeDeChoixFavoris => _listeDeChoixFavoris;
  void setListeOptionFavoris(List<Option> listeDeChoixFavoris) {


    _listeDeChoixFavoris = listeDeChoixFavoris;


  }




  /////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DES FONCTIONS POUR LES  QUESTIONS -------------- /////////
  /////////////////////////////////////////////////////////////////////

  void ajoutQuestionFavoris( String idQuestion , String nouvelQuestion , bool choixA ,
      bool choixB , bool choixC , bool nouvelFaute ,
      String nouvelExplication , int nouveauPoint ,
      String cheminImageSource , int numeroImageSource  ,
      String cheminImageExplicationA ,   int numeroImageExplicationA ,
      String cheminImageExplicationB , int numeroImageExplicationB ,
      String cheminImageExplicationC , int numeroImageExplicationC ,
      String cheminImageExplicationD  , int numeroImageExplicationD ,
      String cheminImageExplicationE , int numeroImageExplicationE)
  {


    final tampon =  Question(idQuestion , nouvelQuestion , choixA , choixB,
        choixC ,  nouvelFaute , nouvelExplication , nouveauPoint ,
        cheminImageSource , numeroImageSource , cheminImageExplicationA
        ,numeroImageExplicationA , cheminImageExplicationB , numeroImageExplicationB ,
        cheminImageExplicationC , numeroImageExplicationC ,
        cheminImageExplicationD , numeroImageExplicationD ,
        cheminImageExplicationE , numeroImageExplicationE )  ;

    _listeQuestionFavoris.add(tampon) ;

    notifyListeners() ;

    SpUtil.putObjectList(_cleListeQuestionSauvegarder, _listeQuestionFavoris);



  }

  bool   VerificationQuestionFavoris( String  value ) {
    // _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));
    print('----------value -----------') ;
    print(value) ;
    print('----------_listeQuestionFavoris  -----------') ;
    print(_listeQuestionFavoris.toString()) ;

    if ((_listeQuestionFavoris.singleWhere((innerElement) => innerElement.id == value,
        orElse: () => null)) != null) {



      return true ;
    }
    else {

      return false ;

    }

  }

  int retourneIndiceQuestion(String value)
  {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));


    var  indice =  _listeQuestionFavoris.indexWhere((innerElement) => innerElement.id == value);
    return indice ;
  }


  void questionSuivante() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    if (_numeroQuestion <= _listeQuestionFavoris.length - 1) {
      _numeroQuestion++;
    }
  }


  void   modifierNumQuestion( int value ) {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));


    _numeroQuestion = value ;
    _numeroChoix = value ;

    notifyListeners();

  }


  void SuprimerQuestionsFavoris( int IdAsuprimer) {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    _listeQuestionFavoris.removeAt(IdAsuprimer);

    SpUtil.putObjectList(_cleListeQuestionSauvegarder, _listeQuestionFavoris);

  }

  bool FinTheme() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    if (_numeroQuestion >= _listeQuestionFavoris.length - 1) {
      return true;
    } else {
      return false;
    }
  }



  List listeQuestionDefinition() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris;
  }

  int getTailleQuestion() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris.length;
  }

  String getIdQuestion() {


    // _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));
    print('getIdQuestion');
    print(_listeQuestionFavoris.toString()) ;
    return _listeQuestionFavoris[_numeroQuestion].id;
  }

  String getQuestionText() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].questionText;
  }

  bool getReponseA() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].reponseA;
  }

  bool getReponseB() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].reponseB;
  }

  bool getReponseC() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].reponseC;
  }


  bool getFauteGrave() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].fauteGrave;
  }

  String getExplication() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].explication;
  }

  int getPoint() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].point;
  }

  String getCheminImageSourceQuestion() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].cheminImageSource;
  }

  int getNumeroImageSourceQuestion() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].numeroImageSource;
  }

  String getCheminImageExplicationQuestionA() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].cheminImageExplicationA;
  }

  int getNumeroImageExplicationQuestionA() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].numeroImageExplicationA;
  }

  String getCheminImageExplicationQuestionB() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].cheminImageExplicationB;
  }

  int getNumeroImageExplicationQuestionB() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].numeroImageExplicationB;
  }

  String getCheminImageExplicationQuestionC() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].cheminImageExplicationC;
  }

  int getNumeroImageExplicationQuestionC() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].numeroImageExplicationC;
  }

  String getCheminImageExplicationQuestionD() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].cheminImageExplicationD;
  }

  int getNumeroImageExplicationQuestionD() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].numeroImageExplicationD;
  }

  String getCheminImageExplicationQuestionE() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].cheminImageExplicationE;
  }

  int getNumeroImageExplicationQuestionE() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

    return _listeQuestionFavoris[_numeroQuestion].numeroImageExplicationE;
  }

  /////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DES FONCTIONS POUR LES OPTION -------------- /////////
  /////////////////////////////////////////////////////////////////////

  void ajoutOptionFavoris(  String idChoix ,  String reponseA , String reponseB ,  String reponseC ){
    _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v));

    final tampon = Option( idChoix , reponseA , reponseB , reponseC ) ;
    print(_listeDeChoixFavoris) ;

    _listeDeChoixFavoris.add(tampon) ;
    SpUtil.putObjectList(_cleListeOptionSauvegarder, _listeDeChoixFavoris);

    notifyListeners() ;

  }

  bool   VerificationOptionFavoris( String  value ) {
    _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v));

    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));
    print('----------value -----------') ;
    print(value) ;
    print('----------_listeQuestionFavoris  -----------') ;
    print(_listeDeChoixFavoris.toString()) ;

    if ((_listeDeChoixFavoris.singleWhere((innerElement) => innerElement.id == value,
        orElse: () => null)) != null) {



      return true ;
    }
    else {

      return false ;

    }

  }

  int retourneIndiceOption(String value)
  {
    _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v));

    var  indice =  _listeDeChoixFavoris.indexWhere((innerElement) => innerElement.id == value);
    return indice ;
  }

  void SuprimerOptionFavoris( int IdAsuprimer) {
    _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v));


    _listeDeChoixFavoris.removeAt(IdAsuprimer);

    SpUtil.putObjectList(_cleListeOptionSauvegarder , _listeDeChoixFavoris);

  }

  int getTailleOption() {
    _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v));

    return _listeQuestionFavoris.length;
  }

  String getIdOption() {
    _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v));

    return _listeDeChoixFavoris[_numeroChoix].id;
  }

  String getOptionA() {
    _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v));

    return _listeDeChoixFavoris[_numeroChoix].optionA;
  }

  String getOptionB() {
    _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v));

    return _listeDeChoixFavoris[_numeroChoix].optionB;
  }

  String getOptionC() {
    _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v));


    print('_numeroChoix') ;
    print(_numeroChoix) ;
    print('_listeDeChoixFavoris[_numeroChoix]') ;
    print(_listeDeChoixFavoris.toString()) ;



    return _listeDeChoixFavoris[_numeroChoix].optionC;
  }


  List listeOptionDefinition() {
    return _listeDeChoixFavoris;
  }

  void optionSuivante() {
    _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v));

    if (_numeroChoix <= _listeDeChoixFavoris.length - 1) {
      _numeroChoix++;
    }
  }

  void reset() {
    _numeroQuestion = 0;
    _numeroChoix = 0;
  }




}






