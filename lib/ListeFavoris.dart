
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';


import 'Option.dart';
import 'Question.dart';


class Favoris extends StatefulWidget {
  const Favoris({Key key}) : super(key: key);

  @override
  FavorisState createState() => FavorisState();
}

class FavorisState extends State<Favoris> with  ChangeNotifier{


  List<Question> _listeQuestionFavoris =  [];


  List<Option> _listeDeChoixFavoris = [] ;






  int _numeroQuestion = 0;
  int _numeroChoix = 0;
  String _cleListeQuestionSauvegarder = 'cqf';
  String _cleListeOptionSauvegarder = 'cof';
  bool _serieFini;
  int _total;
  int _nbBonneReponse;
  int _nbMauvaiseReponse;
  int _nbQuestionRepondue;

  bool verifiIdQuestion = false  ;
  FavorisState();
  FavorisState.C1(int a) {

    _numeroQuestion = a ;
    _numeroChoix = a ;
  }

 /* Favoris( );

  Favoris.C1(int a ) {
  _numeroQuestion = a ;
  _numeroChoix = a ;
  }
*/


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





  /////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DES FONCTIONS POUR LES  QUESTIONS -------------- /////////
  /////////////////////////////////////////////////////////////////////


  void ajoutQuestionFavoris( String idQuestion , String nouvelQuestion , bool choixA , bool choixB , bool choixC , bool nouvelFaute ,  String nouvelExplication , int nouveauPoint , String cheminImageSource , int numeroImageSource  ,
  String cheminQuestionImageExplicationA ,   int numeroQuestionImageExplication  )
  {



  // var t = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));


  Question tampon = new  Question(idQuestion , nouvelQuestion , choixA , choixB ,  choixC , nouvelFaute , nouvelExplication , nouveauPoint ,
  cheminImageSource , numeroImageSource , cheminQuestionImageExplicationA ,numeroQuestionImageExplication  )  ;





  _listeQuestionFavoris.add(tampon) ;


  SpUtil.putObjectList(_cleListeQuestionSauvegarder, _listeQuestionFavoris);

  notifyListeners() ;







  }


  bool   VerificationQuestionFavoris( String  value ) {


  if ( _listeQuestionFavoris.isEmpty   ) {

  verifiIdQuestion =  false ;



  }

  else  {


  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));



  if ((_listeQuestionFavoris.firstWhere((innerElement) => innerElement.id == value,
  orElse: () => null)) != null) {

  verifiIdQuestion =  true ;


  }
  else {


  verifiIdQuestion =  false ;

  }


  }

  return verifiIdQuestion ;

  }

  int retourneIndiceQuestion(String value)
  {


  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));


  var  indice =  _listeQuestionFavoris.indexWhere((innerElement) => innerElement.id == value);
  return indice ;
  }


  void questionSuivante() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  if (_numeroQuestion <= _listeQuestionFavoris.length - 1) {
  _numeroQuestion++;
  }
  }


  void   modifierNumQuestion( int value ) {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));


  _numeroQuestion = value ;
  _numeroChoix = value ;

  notifyListeners();

  }


  void SuprimerQuestionsFavoris( int IdAsuprimer) {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  _listeQuestionFavoris.removeAt(IdAsuprimer);


    SpUtil.putObjectList(_cleListeQuestionSauvegarder, _listeQuestionFavoris);



  }

  bool FinTheme() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  if (_numeroQuestion >= _listeQuestionFavoris.length - 1) {
  return true;
  } else {
  return false;
  }
  }



  List listeQuestionFavoris() {

  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));





  return _listeQuestionFavoris;


  }

  int getTailleQuestion() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris.length;
  }

  String getIdQuestion() {


  // _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

  return _listeQuestionFavoris[_numeroQuestion].id;
  }

  String getQuestionText() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].questionText;
  }

  bool getReponseA() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].reponseA;
  }

  bool getReponseB() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].reponseB;
  }

  bool getReponseC() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].reponseC;
  }


  bool getFauteGrave() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].fauteGrave;
  }

  String getExplication() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].explication;
  }

  int getPoint() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].point;
  }

  String getCheminImageSourceQuestion() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].cheminImageSource;
  }

  int getNumeroImageSourceQuestion() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].numeroImageSource;
  }

  String getCheminQuestionAnimationExplication() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].cheminQuestionAnimationExplication;
  }

  int getNumeroQuestionAnimationExplication() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].numeroQuestionAnimationExplication;
  }




  /////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DES FONCTIONS POUR LES OPTION -------------- /////////
  /////////////////////////////////////////////////////////////////////

  void ajoutOptionFavoris(  String idChoix ,  String reponseA , String reponseB ,  String reponseC ){

  if (_listeDeChoixFavoris.length == 0 ) {
  Option tampon = new Option( idChoix , reponseA , reponseB , reponseC ) ;
  _listeDeChoixFavoris.add(tampon) ;
  SpUtil.putObjectList(_cleListeOptionSauvegarder, _listeDeChoixFavoris);

  }
  else {
  _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v as Map<String, dynamic>));

  Option tampon = new Option( idChoix , reponseA , reponseB , reponseC ) ;
  _listeDeChoixFavoris.add(tampon) ;
  SpUtil.putObjectList(_cleListeOptionSauvegarder, _listeDeChoixFavoris);


  }

  notifyListeners() ;

  }




  int retourneIndiceOption(String value)
  {
  _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v as Map<String, dynamic>));

  var  indice =  _listeDeChoixFavoris.indexWhere((innerElement) => innerElement.id == value);
  return indice ;
  }

  void SuprimerOptionFavoris( int IdAsuprimer) {
  _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v as Map<String, dynamic>));


  _listeDeChoixFavoris.removeAt(IdAsuprimer);

  SpUtil.putObjectList(_cleListeOptionSauvegarder , _listeDeChoixFavoris);

  }


  List<Option>  get  getListeDeChoixFavoris {

  _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v as Map<String, dynamic>));

  return _listeDeChoixFavoris;
  }


  void setListeOptionFavoris(List<Option> listeDeChoixFavoris) {


  _listeDeChoixFavoris = listeDeChoixFavoris;


  }
  int getTailleOption() {
  _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris.length;
  }

  String getIdOption() {
  _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v as Map<String, dynamic>));

  return _listeDeChoixFavoris[_numeroChoix].id;
  }

  String getOptionA() {
  _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v as Map<String, dynamic>));

  return _listeDeChoixFavoris[_numeroChoix].optionA;
  }

  String getOptionB() {
  _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v as Map<String, dynamic>));

  return _listeDeChoixFavoris[_numeroChoix].optionB;
  }

  String getOptionC() {
  _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v as Map<String, dynamic>));

  return _listeDeChoixFavoris[_numeroChoix].optionC;
  }


  List listeOptionFavoris() {
  _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v as Map<String, dynamic>));

  return _listeDeChoixFavoris;
  }

  void optionSuivante() {
  _listeDeChoixFavoris = SpUtil.getObjList(_cleListeOptionSauvegarder, (v) => Option.fromJson(v as Map<String, dynamic>));

  if (_numeroChoix <= _listeDeChoixFavoris.length - 1) {
  _numeroChoix++;
  }
  }

  void reset() {
  _numeroQuestion = 0;
  _numeroChoix = 0;
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}








