/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'Option.dart';
import 'Question.dart';
part 'ListeFavoriState.g.dart';

class Favoris extends StatefulWidget {
  @override
  FavorisState createState() => FavorisState.C1();
}

@HiveType(typeId: 0)
class FavorisState extends State<Favoris>   with HiveObject   ,  ChangeNotifier , DiagnosticableTreeMixin{

  @HiveField(0)
  int _numeroQuestion = 0;

  @HiveField(1)
  int _numeroChoix = 0;

  @HiveField(2)
  String _cleListeSauvegarder;

  @HiveField(3)
  bool _serieFini;

  @HiveField(4)
  int _total;

  @HiveField(5)
  int _nbBonneReponse;

  @HiveField(6)
  int _nbMauvaiseReponse;

  @HiveField(7)
  int _nbQuestionRepondue;

  @HiveField(8)
  List<Question> _listeQuestionFavoris =[];

  @HiveField(9)
  List<Option> _listeDeChoixFavoris = [];


  FavorisState.C1();
  FavorisState(
      this._numeroQuestion,
      this._numeroChoix,
      this._cleListeSauvegarder,
      this._serieFini,
      this._total,
      this._nbBonneReponse,
      this._nbMauvaiseReponse,
      this._nbQuestionRepondue,
      this._listeQuestionFavoris,
      this._listeDeChoixFavoris);

  void init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(FavorisAdapter());
    var favQuestionsBox = await Hive.openBox<List<Question>>("fqb");
    var favOptionsBox = await Hive.openBox<List<Option>>("fob");

    _listeQuestionFavoris =  favQuestionsBox.get("fqb" , defaultValue : []).cast<Question>().toList();
    _listeDeChoixFavoris =  favOptionsBox.get("fob" , defaultValue : []).cast<Option>().toList();

    print('---- _listeQuestionFavoris  init ---');
    print(_listeQuestionFavoris.toString());


  }

  int get getNumeroQuestion => _numeroQuestion;
  set numeroQuestion(int numeroQuestion) => _numeroQuestion = numeroQuestion;

  int get getNumeroChoix => _numeroChoix;
  set numeroChoix(int numeroChoix) => _numeroChoix = numeroChoix;

  String get getCleListeSauvegarder => _cleListeSauvegarder;
  set cleListeSauvegarder(String cleListeSauvegarder) =>
      _cleListeSauvegarder = cleListeSauvegarder;

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
  set question(List<Question> listeQuestionFavoris) => _listeQuestionFavoris = listeQuestionFavoris;

  List<Option> get getListeDeChoixFavoris => _listeDeChoixFavoris;
  set option(List<Option> listeDeChoixFavoris) => _listeDeChoixFavoris = listeDeChoixFavoris;

  bool   VerificationQuestionFavoris( String  value ) {

    if ((_listeQuestionFavoris.singleWhere((innerElement) => innerElement.id == value,
        orElse: () => null)) != null) {
      print('------ value ------ ');
      print(value);


      return true ;
    }
    else {

      return false ;

    }

  }
  void affihe(){
    print('------ Fonction Affiche ------ ');

    print('------ _listeQuestionFavoris  Question ------ ');
    print(_listeQuestionFavoris.toString());

    print('-------- _listeQuestionFavoris  Choix ------------');

    print(_listeDeChoixFavoris.toString());

  }

  int retourneIndiceQuestion(String value)
  {

    var  indice =  _listeQuestionFavoris.indexWhere((innerElement) => innerElement.id == value);
    return indice ;
  }


  void ajoutQuestion( String idQuestion , String nouvelQuestion , bool choixA , bool choixB , bool choixC , bool nouvelFaute ,  String nouvelExplication , int nouveauPoint , String cheminImage , int numeroImage ){

    var tampon =  Question(idQuestion , nouvelQuestion , choixA , choixB ,  choixC , nouvelFaute , nouvelExplication , nouveauPoint , cheminImage ,numeroImage )  ;
    _listeQuestionFavoris.add(tampon) ;
    notifyListeners() ;
  }



  void ajoutOption(  String idChoix ,  String reponseA , String reponseB ,  String reponseC ){

    var tampon = Option( idChoix , reponseA , reponseB , reponseC ) ;
    _listeDeChoixFavoris.add(tampon) ;
    notifyListeners() ;

  }

  void   modifierNumQuestion( int value ) {


    _numeroQuestion = value ;
    _numeroChoix = value ;

    notifyListeners();

  }


  void SuprimerQuestions( int IdAsuprimer) {

    _listeQuestionFavoris.removeAt(IdAsuprimer);
  }




  String getIdQuestion() {
    return _listeQuestionFavoris[_numeroQuestion].id;
  }

  String getIdOption() {
    return _listeDeChoixFavoris[_numeroChoix].id;
  }


  List listeQuestionFavoris() {
    return _listeQuestionFavoris;
  }

  List listeOptionDefinition() {
    return _listeDeChoixFavoris;
  }

  int getTaille() {
    return _listeQuestionFavoris.length;
  }

  String getOptionA() {
    return _listeDeChoixFavoris[_numeroChoix].optionA;
  }

  String getOptionB() {
    return _listeDeChoixFavoris[_numeroChoix].optionB;
  }

  String getOptionC() {
    return _listeDeChoixFavoris[_numeroChoix].optionC;
  }


  String getQuestionText() {
    return _listeQuestionFavoris[_numeroQuestion].questionText;
  }

  int getNumeroImage() {
    return _listeQuestionFavoris[_numeroQuestion].numeroImage;
  }

  String getCheminImage() {
    return _listeQuestionFavoris[_numeroQuestion].cheminImage;
  }


  int getPoint() {
    return _listeQuestionFavoris[_numeroQuestion].point;
  }

  bool getBonneReponseA() {
    return _listeQuestionFavoris[_numeroQuestion].reponseA;
  }

  bool getBonneReponseB() {
    return _listeQuestionFavoris[_numeroQuestion].reponseB;
  }

  bool getBonneReponseC() {
    return _listeQuestionFavoris[_numeroQuestion].reponseC;
  }


  bool getFauteGrave() {
    return _listeQuestionFavoris[_numeroQuestion].fauteGrave;
  }

  String getExplication() {
    return _listeQuestionFavoris[_numeroQuestion].explication;
  }


  void questionSuivante() {
    if (_numeroQuestion <= _listeQuestionFavoris.length - 1) {
      _numeroQuestion++;
    }
  }

  void optionSuivante() {
    if (_numeroChoix <= _listeDeChoixFavoris.length - 1) {
      _numeroChoix++;
    }
  }

  bool FinTheme() {
    if (_numeroQuestion >= _listeQuestionFavoris.length - 1) {
      return true;
    } else {
      return false;
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





*/
