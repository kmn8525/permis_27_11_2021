/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'Option.dart';
import 'Question.dart';
part 'ListeFavoris.g.dart';

@HiveType(typeId: 0)
class Favoris  extends HiveObject   with  ChangeNotifier , DiagnosticableTreeMixin  {

  Box favQuestionsBox ;
  Box favOptionsBox  ;

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
  HiveList _h1  ;

  @HiveField(9)
  HiveList _h2 ;


  List<Question> _listeQuestionFavoris = [];

  List<Option> _listeDeChoixFavoris = [];

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
    Hive.registerAdapter(FavorisAdapter());
    favQuestionsBox = await Hive.openBox<Question>("fqb");
    favOptionsBox = await Hive.openBox<Option>("fob");


  }

  void UpdateDonnes() {

    var  QuestionFavoris = Favoris.C1() ;
    var  OptionFavoris = Favoris.C1() ;
    //mario.friends = HiveList(persons); // Create a HiveList
    _listeQuestionFavoris = QuestionFavoris._h1.cast<Question>().toList() ;
    _listeDeChoixFavoris = OptionFavoris._h2.cast<Option>().toList() ;

  }
  void SuprimerQuestionsOptionFavoris( String  idQuestion  ) {

    Map<dynamic, Question> questionMap = favQuestionsBox.toMap();
    dynamic cleQuestionAsuprimer;

    questionMap.forEach((key, value){
      if (value.id == idQuestion)
        cleQuestionAsuprimer = key;
    });

    favQuestionsBox.delete(cleQuestionAsuprimer);

  }
  void SuprimerOptionOptionFavoris( String  idOption  ) {

    Map<dynamic, Question> questionMap = favQuestionsBox.toMap();
    dynamic cleQuestionAsuprimer;

    questionMap.forEach((key, value){
      if (value.id == idOption)
        cleQuestionAsuprimer = key;
    });

    favQuestionsBox.delete(cleQuestionAsuprimer);

  }


  bool verifiQuestionFavoris( String  x )  {

    bool existe = true ;
    if (( favQuestionsBox.isEmpty) && (favOptionsBox.isEmpty)) {
      existe = false  ;

    }
    else {
      Map<dynamic, Question> questionMap = favQuestionsBox.toMap();
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
    if (( favQuestionsBox.isEmpty) && (favOptionsBox.isEmpty)) {
      ok = false  ;

    }
    else {
      ok = true ;

    }
    // _listeQuestionFavoris =   QuestionFavoris._h1.cast<Question>().toList() ;
    return ok ;
  }

  void ajoutQuestionFavris( String idQuestion , String nouvelQuestion , bool choixA , bool choixB , bool choixC , bool nouvelFaute ,  String nouvelExplication , int nouveauPoint , String cheminImage , int numeroImage ){
    var  QuestionFavoris = Favoris.C1() ;
    var tampon =  Question(idQuestion , nouvelQuestion , choixA , choixB ,  choixC , nouvelFaute , nouvelExplication , nouveauPoint , cheminImage ,numeroImage )  ;
    favQuestionsBox.addAll([tampon]) ;
    QuestionFavoris._h1 = HiveList(favQuestionsBox) ;

    notifyListeners() ;
  }

  void ajoutOptionFavoris(  String idChoix ,  String reponseA , String reponseB ,  String reponseC ){
    var  OptionFavoris = Favoris.C1() ;
    var tampon = Option( idChoix , reponseA , reponseB , reponseC ) ;
    favOptionsBox.addAll([tampon]) ;
    OptionFavoris._h2 = HiveList(favOptionsBox) ;

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
