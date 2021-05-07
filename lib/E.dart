/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'Option.dart';
import 'Question.dart';

class Favoris     with  ChangeNotifier , DiagnosticableTreeMixin  {

  Box QuestionsBox ;
  Box OptionsBox;

  int _numeroQuestion = 0;

  int _numeroChoix = 0;
  String _cleListeSauvegarder;
  bool _serieFini;
  int _total;
  int _nbBonneReponse;
  int _nbMauvaiseReponse;
  int _nbQuestionRepondue;


  List<Question> _listeQuestionFavoris = [];

  List<Option> _listeDeChoixFavoris = [];

  var  QuestionFavoris = Question.C1() ;
  var  OptionFavoris = Option.C1() ;

  Favoris.C1();

  Favoris(
      this._numeroQuestion,
      this._numeroChoix,
      this._cleListeSauvegarder,
      this._serieFini,
      this._total,
      this._nbBonneReponse,
      this._nbMauvaiseReponse,
      this._nbQuestionRepondue);



  void init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    Hive.registerAdapter(QuestionAdapter());
    Hive.registerAdapter(OptionAdapter());

    QuestionsBox  = await Hive.openBox<Question>("fqb");
    OptionsBox    = await Hive.openBox<Option>("fob");


  }


  void chargementQuestionSauvegarder() {

    QuestionsBox.addAll([QuestionFavoris]) ;
    OptionsBox.addAll([OptionFavoris]) ;

    QuestionFavoris.listeQuestion = HiveList(QuestionsBox) ;
    OptionFavoris.listeOption = HiveList(OptionsBox) ;

    _listeQuestionFavoris = QuestionFavoris.listeQuestion.cast<Question>().toList() ;
    _listeDeChoixFavoris = OptionFavoris.listeOption.cast<Option>().toList() ;


  }

  void SuprimerQuestionsOptionFavoris( String  idQuestion  ) {

    Map<dynamic, Question> questionMap = QuestionsBox.toMap();
    dynamic cleQuestionAsuprimer;

    questionMap.forEach((key, value){
      if (value.id == idQuestion)
        cleQuestionAsuprimer = key;
    });

    QuestionsBox.delete(cleQuestionAsuprimer);

  }
  void SuprimerOptionOptionFavoris( String  idOption  ) {

    Map<dynamic, Question> questionMap = OptionsBox.toMap();
    dynamic cleQuestionAsuprimer;

    questionMap.forEach((key, value){
      if (value.id == idOption)
        cleQuestionAsuprimer = key;
    });

    OptionsBox.delete(cleQuestionAsuprimer);

  }

  int minimumNumeroImage () {


    Map<dynamic, Question> questionMap =  QuestionsBox.toMap();
    questionMap.forEach((key, value){
      if (value.id == x) {

        existe =  true ;
      }
      else {
        existe = false ;
      }
    });
  }
  bool verifiQuestionFavoris( String  x )  {

    bool existe = true ;
    if (( QuestionsBox.isEmpty) && ( OptionsBox.isEmpty)) {
      existe = false  ;

    }
    else {
      Map<dynamic, Question> questionMap =  QuestionsBox.toMap();
      questionMap.forEach((key, value){
        if (value.id == x) {

          existe =  true ;
        }
        else {
          existe = false ;
        }
      });

    }
    // _listeQuestionFavoris =   QuestionFavoris._h1.cast<Question>().toList() ;
    return existe ;
  }
  bool verifiBox()  {

    bool ok = true ;
    if ((  QuestionsBox.isEmpty) && ( OptionsBox.isEmpty)) {
      ok = false  ;

    }
    else {
      ok = true ;

    }
    // _listeQuestionFavoris =   QuestionFavoris._h1.cast<Question>().toList() ;
    return ok ;
  }

  void ajoutQuestionFavris( String idQuestion , String nouvelQuestion , bool choixA , bool choixB , bool choixC , bool nouvelFaute ,  String nouvelExplication , int nouveauPoint , String cheminImage , int numeroImage ){
    var tampon =  Question(idQuestion , nouvelQuestion , choixA , choixB ,  choixC , nouvelFaute , nouvelExplication , nouveauPoint , cheminImage ,numeroImage )  ;
    QuestionsBox.addAll([tampon]) ;
    QuestionFavoris.listeQuestion = HiveList(QuestionsBox) ;

    _listeQuestionFavoris = QuestionFavoris.listeQuestion.cast<Question>().toList() ;

    notifyListeners() ;
  }

  void ajoutOptionFavoris(  String idChoix ,  String reponseA , String reponseB ,  String reponseC ){
    var tampon = Option( idChoix , reponseA , reponseB , reponseC ) ;
    OptionsBox.addAll([tampon]) ;

    notifyListeners() ;

  }



  //persons.addAll([mario, luna, alex]);


  // favQuestionsBox.addAll(values)

  //favQuestionsBox. ;

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





  void affihe(){
    print('------ Fonction Affiche ------ ');

    print('------ _listeQuestionFavoris  Question ------ ');
    print(_listeQuestionFavoris.toString());

    print('-------- _listeQuestionFavoris  Choix ------------');

    print(_listeDeChoixFavoris.toString());

  }



  void   modifierNumQuestion( int value ) {


    _numeroQuestion = value ;
    _numeroChoix = value ;

    notifyListeners();

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


}





*/
