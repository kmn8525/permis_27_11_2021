
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';


 import 'AnimerQuestion.dart';
import 'Option.dart';
import 'Question.dart';
import 'AnimerQuestion.dart';



class Favoris extends StatefulWidget {
  const Favoris({Key key}) : super(key: key);

  @override
  FavorisState createState() => FavorisState();
}

class FavorisState extends State<Favoris> with  ChangeNotifier{


  List<Question> _listeQuestionFavoris =  [];



  List<Question> listTamponSauvegarder  = [];





  int _numeroQuestion = 0;
  String _cleListeQuestionFavorisSauvegarder = 'cqf';
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
   }

 /* Favoris( );

  Favoris.C1(int a ) {
  _numeroQuestion = a ;
  _numeroChoix = a ;
  }
*/


  int get getNumeroQuestion => _numeroQuestion;
  set numeroQuestion(int numeroQuestion) => _numeroQuestion = numeroQuestion;


  String get getCleListeSauvegarder => _cleListeQuestionFavorisSauvegarder;
  set cleListeSauvegarder(String cleListeSauvegarder) =>
  _cleListeQuestionFavorisSauvegarder = cleListeSauvegarder;

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



  @override
  void initState() {

    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));
print(_listeQuestionFavoris[_numeroQuestion].option.optionB)  ;

    super.initState();
  }

  /////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DES FONCTIONS POUR LES  ANIMATIONS -------------- /////////
  /////////////////////////////////////////////////////////////////////

  String getCheminImageAnimations() {
    return _listeQuestionFavoris[_numeroQuestion].animationquestion.cheminImageAnimations;
  }

  int  getNumeroImageA() {
    return _listeQuestionFavoris[_numeroQuestion].animationquestion.numeroImageA;
  }


  bool   getVisibiliteA() {
    return _listeQuestionFavoris[_numeroQuestion].animationquestion.visibiliteA;
  }


  String getDescriptionA() {
    return _listeQuestionFavoris[_numeroQuestion].animationquestion.DescriptionA;
  }


  double getPositionGaucheA() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionGaucheA;

  }

  double getPositionHautA() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionHautA;

  }

  double getPositionDroiteA() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionDroiteA;

  }

  double getPositionBasA() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionBasA;

  }

  double getHauteurA () {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.hauteurA;

  }


  double getLargeurA () {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.largeurA;

  }


  ///// *******************    B  *******************  /////////



  int  getNumeroImageB() {
    return _listeQuestionFavoris[_numeroQuestion].animationquestion.numeroImageB;
  }


  bool   getVisibiliteB() {
    return _listeQuestionFavoris[_numeroQuestion].animationquestion.visibiliteB;
  }


  String getDescriptionB() {
    return _listeQuestionFavoris[_numeroQuestion].animationquestion.DescriptionB;
  }


  double getPositionGaucheB() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionGaucheB;

  }

  double getPositionHautB() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionHautB;

  }

  double getPositionDroiteB() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionDroiteB;

  }

  double getPositionBasB() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionBasB;

  }

  double getHauteurB () {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.hauteurB;

  }


  double getLargeurB () {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.largeurB;

  }

  ///// *******************    C  *******************  /////////



  int  getNumeroImageC() {
    return _listeQuestionFavoris[_numeroQuestion].animationquestion.numeroImageC;
  }


  bool   getVisibiliteC() {
    return _listeQuestionFavoris[_numeroQuestion].animationquestion.visibiliteC;
  }


  String getDescriptionC() {
    return _listeQuestionFavoris[_numeroQuestion].animationquestion.DescriptionC;
  }


  double getPositionGaucheC() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionGaucheC;

  }

  double getPositionHautC() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionHautC;

  }

  double getPositionDroiteC() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionDroiteC;

  }

  double getPositionBasC() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionBasC;

  }

  double getHauteurC () {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.hauteurC;

  }


  double getLargeurC () {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.largeurC;

  }

  ///// *******************    D  *******************  /////////



  int  getNumeroImageD() {
    return _listeQuestionFavoris[_numeroQuestion].animationquestion.numeroImageD;
  }


  bool   getVisibiliteD() {
    return _listeQuestionFavoris[_numeroQuestion].animationquestion.visibiliteD;
  }


  String getDescriptionD() {
    return _listeQuestionFavoris[_numeroQuestion].animationquestion.DescriptionD;
  }


  double getPositionGaucheD() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionGaucheD;

  }

  double getPositionHautD() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionHautD;

  }

  double getPositionDroiteD() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionDroiteD;

  }

  double getPositionBasD() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionBasD;

  }

  double getHauteurD() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.hauteurD;

  }


  double getLargeurD() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.largeurD;

  }

  ///// *******************    E   *******************  /////////



  int  getNumeroImageE() {
    return _listeQuestionFavoris[_numeroQuestion].animationquestion.numeroImageE;
  }


  bool   getVisibiliteE() {
    return _listeQuestionFavoris[_numeroQuestion].animationquestion.visibiliteE;
  }


  String getDescriptionE() {
    return _listeQuestionFavoris[_numeroQuestion].animationquestion.DescriptionE;
  }


  double getPositionGaucheE() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionGaucheE;

  }

  double getPositionHautE() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionHautE;

  }

  double getPositionDroiteE() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionDroiteE;

  }

  double getPositionBasE() {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.positionBasE;

  }

  double getHauteurE () {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.hauteurE;

  }


  double getLargeurE () {

    return _listeQuestionFavoris[_numeroQuestion].animationquestion.largeurE;

  }





  /////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DES FONCTIONS POUR LES  QUESTIONS -------------- /////////
  /////////////////////////////////////////////////////////////////////


  void ajoutQuestionFavoris(
      int    idQuestion ,        String nouvelQuestion , bool choixA , bool choixB , bool choixC , bool nouvelFaute ,
      String nouvelExplication , int nouveauPoint ,      String cheminImageSource ,  int numeroImageSource  ,
      String optionA  ,          String optionB  ,       String optionC  ,           String cheminImageAnimation ,
      int    numeroImageA ,      bool   visibiliteA ,    String DescriptionA ,       double positionGaucheA , double positionHautA , double positionDroiteA , double positionBasA , double hauteurA , double largeurA ,
      int    numeroImageB ,      bool   visibiliteB ,    String DescriptionB ,       double positionGaucheB  ,double positionHautB , double positionDroiteB , double positionBasB  ,double hauteurB , double largeurB ,
      int    numeroImageC ,      bool   visibiliteC ,    String DescriptionC ,       double positionGaucheC , double positionHautC , double positionDroiteC , double positionBasC , double hauteurC , double largeurC ,
      int    numeroImageD ,      bool   visibiliteD ,    String DescriptionD ,       double positionGaucheD , double positionHautD , double positionDroiteD , double positionBasD , double hauteurD , double largeurD ,
      int    numeroImageE ,      bool   visibiliteE ,    String DescriptionE ,       double positionGaucheE , double positionHautE , double positionDroiteE , double positionBasE , double hauteurE , double largeurE , )

  {



  // var t = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

    Option option =  Option ( optionA , optionB , optionC) ;
    AnimerQuestion animaQuestion = AnimerQuestion(
      cheminImageAnimation,
        numeroImageA ,   visibiliteA , DescriptionA , positionGaucheA , positionHautA ,positionDroiteA , positionBasA , hauteurA ,largeurA ,
        numeroImageB,    visibiliteB , DescriptionB , positionGaucheB , positionHautB ,positionDroiteB , positionBasB , hauteurB ,largeurB ,
        numeroImageC,    visibiliteC , DescriptionC , positionGaucheC , positionHautC ,positionDroiteC , positionBasC , hauteurC ,largeurC ,
        numeroImageD,    visibiliteD , DescriptionD , positionGaucheD , positionHautD ,positionDroiteD  ,positionBasD , hauteurD ,largeurD ,
        numeroImageE ,   visibiliteE , DescriptionE , positionGaucheE , positionHautE ,positionDroiteE , positionBasE , hauteurE ,largeurE ,


    );

  Question question =   Question(idQuestion , nouvelQuestion , choixA , choixB ,  choixC ,
    nouvelFaute , nouvelExplication , nouveauPoint , cheminImageSource , numeroImageSource ,
    option , animaQuestion ,

  )  ;




    if ( _listeQuestionFavoris.isEmpty   ) {

      print( "_listeQuestionFavoris.Empty ");

      _listeQuestionFavoris.add(question) ;

      SpUtil.putObjectList(_cleListeQuestionFavorisSauvegarder, _listeQuestionFavoris);


    }

  else  {

      _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

      _listeQuestionFavoris.add(question) ;


      SpUtil.putObjectList(_cleListeQuestionFavorisSauvegarder, _listeQuestionFavoris);



    }



  notifyListeners() ;





  }


  bool   VerificationQuestionFavoris( int  value ) {


  if ( _listeQuestionFavoris.isEmpty   ) {

  verifiIdQuestion =  false ;



  }

  else  {


  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));



  if ((_listeQuestionFavoris.firstWhere((innerElement) => innerElement.id  == value,
  orElse: () => null)) != null) {

  verifiIdQuestion =  true ;


  }


  else {


  verifiIdQuestion =  false ;

  }


  }

  return verifiIdQuestion ;

  }



  void questionSuivante() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  if (_numeroQuestion <= _listeQuestionFavoris.length - 1) {
  _numeroQuestion++;
  }
  }


  void   modifierNumQuestion( int value ) {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));


  _numeroQuestion = value ;

  notifyListeners();

  }


  void SuprimerQuestionsFavoris( int IdAsuprimer) {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  _listeQuestionFavoris.removeAt(IdAsuprimer);


    SpUtil.putObjectList(_cleListeQuestionFavorisSauvegarder, _listeQuestionFavoris);



  }

  bool FinTheme() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  if (_numeroQuestion >= _listeQuestionFavoris.length - 1) {
  return true;
  } else {
  return false;
  }
  }



  List listeQuestionFavoris() {

  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));





  return _listeQuestionFavoris;


  }

  int getTailleQuestion() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris.length;
  }

  int getIdQuestion() {


  // _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v));

  return _listeQuestionFavoris[_numeroQuestion].id;
  }

  String getQuestionText() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].questionText;
  }

  bool getReponseA() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].reponseA;
  }

  bool getReponseB() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].reponseB;
  }

  bool getReponseC() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].reponseC;
  }


  bool getFauteGrave() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].fauteGrave;
  }

  String getExplication() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].explication;
  }

  int getPoint() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].point;
  }

  String getCheminImageSourceQuestion() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].cheminImageSource;
  }

  int getNumeroImageSourceQuestion() {
  _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

  return _listeQuestionFavoris[_numeroQuestion].numeroImageSource;
  }



  int retourneIndiceQuestion(int value)
  {


    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));


    var  indice =  _listeQuestionFavoris.indexWhere((innerElement) => innerElement.id == value);
    return indice ;
  }



  /////////////////////////////////////////////////////////////////////
  ///// ---------------   LISTE DES FONCTIONS  POUR LES OPTION -------------- /////////
  /////////////////////////////////////////////////////////////////////

  String getOptionA() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

    return _listeQuestionFavoris[_numeroQuestion].option.optionA;
  }



  String getOptionB() {
    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

    return _listeQuestionFavoris[_numeroQuestion].option.optionB;

  }

  String getOptionC() {

    _listeQuestionFavoris = SpUtil.getObjList(_cleListeQuestionFavorisSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

    return _listeQuestionFavoris[_numeroQuestion].option.optionC;
  }



  @override
  Widget build(BuildContext context) {
    return Container();
  }
}








