

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

import '../AnimerQuestion.dart';
import '../ConvertirCouleurHexaminale.dart';
import '../Option.dart';
import '../OptionSauvegarder.dart';
import '../Question.dart';
import '../QuestionSauvegarder.dart';



class ResultatDefinition extends  ChangeNotifier {


  List<QuestionSauvegarder> _listeSectionSauvegarder = [];

  var tampon ;

  String cleListeSectionDefinitionauvegarder = "clsd";


  ResultatDefinition();

  List _listTotalPoint = [];


  void SuprimerLesResultat() {

    _listeSectionSauvegarder = SpUtil.getObjList(cleListeSectionDefinitionauvegarder, (v) =>
        QuestionSauvegarder.fromJson(v as Map<String, dynamic>));


    _listeSectionSauvegarder.clear();

    _listTotalPoint.clear();


    SpUtil.putObjectList(cleListeSectionDefinitionauvegarder, _listeSectionSauvegarder);

  }


  void RestitutionDesValeurSauvegarder() {
    _listeSectionSauvegarder = SpUtil.getObjList(cleListeSectionDefinitionauvegarder, (v) =>
        QuestionSauvegarder.fromJson(v as Map<String, dynamic>));



  }


  Color getColoueurBoutonOptionA(int indexCourant) {
    var value = _listeSectionSauvegarder[indexCourant].optionsauvegarder
        .couleurOptionA;
    var couleurA = HexadecimalColor(value);

    return couleurA;
  }


  Color getColoueurBoutonOptionB(int indexCourant) {


    var value = _listeSectionSauvegarder[indexCourant].optionsauvegarder
        .couleurOptionB;
    var couleurB = HexadecimalColor(value);



    return couleurB;
  }


  Color getColoueurBoutonOptionC(int indexCourant) {
    var value = _listeSectionSauvegarder[indexCourant].optionsauvegarder
        .couleurOptionC;
    var couleurC = HexadecimalColor(value);

    return couleurC;
  }


  Color getColoueurBoutonLettreOptionA(int indexCourant) {
    var value = _listeSectionSauvegarder[indexCourant].optionsauvegarder
        .couleurOptionLettreA;
    var couleurLA = HexadecimalColor(value);

    return couleurLA;
  }


  Color getColoueurBoutonLettreOptionB(int indexCourant) {
    var value = _listeSectionSauvegarder[indexCourant].optionsauvegarder.couleurOptionLettreB;
    var couleurLB = HexadecimalColor(value);

    return couleurLB;
  }


  Color getColoueurBoutonLettreOptionC(int indexCourant) {
    var value = _listeSectionSauvegarder[indexCourant].optionsauvegarder.couleurOptionLettreC;
    var couleurLC = HexadecimalColor(value);

    return couleurLC;
  }


  Color getCouleurBoutonChoixUtulisateur(int indexCourant) {
    // _listeSectionDefinitionSauvegarder  = SpUtil.getObjList(_cleListeSectionDefinitionSauvegarder, (v) => QuestionSauvegarder.fromJson(v as Map<String, dynamic>));



    var value = _listeSectionSauvegarder[indexCourant].optionsauvegarder.couleurBoutonChoixUtulisateur;

    var couleurChoix = HexadecimalColor(value);


    return couleurChoix;
  }


  List getListQuestionResultatSectionDefinition() {
    _listeSectionSauvegarder = SpUtil.getObjList(cleListeSectionDefinitionauvegarder, (v) =>
        QuestionSauvegarder.fromJson(v as Map<String, dynamic>));


    return _listeSectionSauvegarder;
  }



  void ajoutQuestionResultatSectionDefinition(int idQuestion,
      String nouvelQuestion, bool choixA, bool choixB, bool choixC,
      bool nouvelFaute,
      String nouvelExplication, int nouveauPoint, String cheminImageSource,
      int numeroImageSource,

      String optionA, String optionB, String optionC,
      String couleurOptionA, String couleurOptionB, String couleurOptionC,
      String couleurOptionLettreA, String couleurOptionLettreB,
      String couleurOptionLettreC,
      String couleurBoutonChoixUtulisateur,

      String cheminImageAnimation,
      int numeroImageA, bool visibiliteA, String DescriptionA,
      double positionGaucheA, double positionHautA, double positionDroiteA,
      double positionBasA, double hauteurA, double largeurA,
      int numeroImageB, bool visibiliteB, String DescriptionB,
      double positionGaucheB, double positionHautB, double positionDroiteB,
      double positionBasB, double hauteurB, double largeurB,
      int numeroImageC, bool visibiliteC, String DescriptionC,
      double positionGaucheC, double positionHautC, double positionDroiteC,
      double positionBasC, double hauteurC, double largeurC,
      int numeroImageD, bool visibiliteD, String DescriptionD,
      double positionGaucheD, double positionHautD, double positionDroiteD,
      double positionBasD, double hauteurD, double largeurD,
      int numeroImageE, bool visibiliteE, String DescriptionE,
      double positionGaucheE, double positionHautE, double positionDroiteE,
      double positionBasE, double hauteurE, double largeurE,) {
    // var t = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

    OptionSauvegarder optionSauvegarder = OptionSauvegarder(
        optionA,
        optionB,
        optionC,
        couleurOptionA,
        couleurOptionB,
        couleurOptionC,
        couleurOptionLettreA,
        couleurOptionLettreB,
        couleurOptionLettreC,
        couleurBoutonChoixUtulisateur

    );
    AnimerQuestion animaQuestion = AnimerQuestion(
      cheminImageAnimation,
      numeroImageA,
      visibiliteA,
      DescriptionA,
      positionGaucheA,
      positionHautA,
      positionDroiteA,
      positionBasA,
      hauteurA,
      largeurA,
      numeroImageB,
      visibiliteB,
      DescriptionB,
      positionGaucheB,
      positionHautB,
      positionDroiteB,
      positionBasB,
      hauteurB,
      largeurB,
      numeroImageC,
      visibiliteC,
      DescriptionC,
      positionGaucheC,
      positionHautC,
      positionDroiteC,
      positionBasC,
      hauteurC,
      largeurC,
      numeroImageD,
      visibiliteD,
      DescriptionD,
      positionGaucheD,
      positionHautD,
      positionDroiteD,
      positionBasD,
      hauteurD,
      largeurD,
      numeroImageE,
      visibiliteE,
      DescriptionE,
      positionGaucheE,
      positionHautE,
      positionDroiteE,
      positionBasE,
      hauteurE,
      largeurE,


    );

    final QuestionSauvegarder questionSauvegarder = QuestionSauvegarder(
      idQuestion,
      nouvelQuestion,
      choixA,
      choixB,
      choixC,
      nouvelFaute,
      nouvelExplication,
      nouveauPoint,
      cheminImageSource,
      numeroImageSource,
      optionSauvegarder,
      animaQuestion,

    );



    if (_listeSectionSauvegarder.isEmpty) {
      _listeSectionSauvegarder.add(questionSauvegarder);

      SpUtil.putObjectList(cleListeSectionDefinitionauvegarder, _listeSectionSauvegarder);


    }

    else {

       tampon =   _listeSectionSauvegarder = SpUtil.getObjList(cleListeSectionDefinitionauvegarder, (v) =>
          QuestionSauvegarder.fromJson(v as Map<String, dynamic>));


      print( "Taille De la liste  AVANT l AJOUT TAMPON" ) ;
      print( tampon.length) ;

      tampon.add(questionSauvegarder);

      print( "Taille De la liste  APRES AVOIR FAIT TAMPON" ) ;
      print( tampon.length) ;
      _listeSectionSauvegarder = tampon ;
       // _listeSectionSauvegarder.addAll(tampon);

      SpUtil.putObjectList(cleListeSectionDefinitionauvegarder, _listeSectionSauvegarder);



    }


    notifyListeners();
  }

  void ajoutQuestionExamen(int idQuestion, String nouvelQuestion, bool choixA,
      bool choixB, bool choixC, bool nouvelFaute,
      String nouvelExplication, int nouveauPoint, String cheminImageSource,
      int numeroImageSource,
      String optionA, String optionB, String optionC) {
    // var t = SpUtil.getObjList(_cleListeQuestionSauvegarder, (v) => Question.fromJson(v as Map<String, dynamic>));

    Option option = Option(optionA, optionB, optionC);


    final Question question = Question.C1(
      idQuestion,
      nouvelQuestion,
      choixA,
      choixB,
      choixC,
      nouvelFaute,
      nouvelExplication,
      nouveauPoint,
      cheminImageSource,
      numeroImageSource,
      option,

    );


    //_listeQuestionsUtilisateursExamen.add(QuestionSauvegarder) ;


    notifyListeners();
  }


  String get cleListeSectionDefinitionSauvegarder =>
      cleListeSectionDefinitionauvegarder;

  void ajouterTotal(int total) {
    _listTotalPoint.add(total);
    notifyListeners();
  }


  List listeQuestionResultat() {
    return _listeSectionSauvegarder;
  }


  int getTaillelisteResultatDefinition() {



    return _listeSectionSauvegarder.length;
  }


  ////----- Getter Question --- ////

  int getIdQuestion(int indexCourant) {


    return _listeSectionSauvegarder[indexCourant].id;
  }

  String getQuestionText(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].questionText;
  }


  bool getFauteGrave(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].fauteGrave;
  }


  String getExplication(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].explication;
  }

  String getCheminImageSourceQuestion(int indexCourant) {

    return _listeSectionSauvegarder[indexCourant].cheminImageSource;

  }

  int getNumeroImageSourceQuestion(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].numeroImageSource;

  }

  int getPoint(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].point;
  }


  //// ==== GETTER  OPTION ==== ////

  String getOptionA(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].optionsauvegarder.optionA;
  }


  String getOptionB(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].optionsauvegarder.optionB;
  }

  String getOptionC(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].optionsauvegarder.optionC;
  }


  //// ==== GETTER  ANIMATION  ==== ////

  String getCheminImageAnimations(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .cheminImageAnimations;
  }


  int getNumeroImageA(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .numeroImageA;
  }

  bool getVisibiliteA(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .visibiliteA;
  }

  double getpositionGaucheA(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionGaucheA;
  }

  double getpositionHautA(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionHautA;
  }

  double getpositionDroiteA(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionDroiteA;
  }


  double getpositionBasA(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionBasA;
  }

  double gethauteurA(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion.hauteurA;
  }

  double getlargeurA(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion.largeurA;
  }


  int getNumeroImageB(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .numeroImageB;
  }

  bool getVisibiliteB(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .visibiliteB;
  }

  double getpositionGaucheB(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionGaucheB;
  }

  double getpositionHautB(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionHautB;
  }

  double getpositionDroiteB(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionDroiteB;
  }


  double getpositionBasB(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionBasB;
  }

  double gethauteurB(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion.hauteurB;
  }

  double getlargeurB(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion.largeurB;
  }


  int getNumeroImageC(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .numeroImageC;
  }

  bool getVisibiliteC(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .visibiliteC;
  }

  double getpositionGaucheC(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionGaucheC;
  }

  double getpositionHautC(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionHautC;
  }

  double getpositionDroiteC(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionDroiteC;
  }


  double getpositionBasC(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionBasC;
  }

  double gethauteurC(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion.hauteurC;
  }

  double getlargeurC(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion.largeurC;
  }


  int getNumeroImageD(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .numeroImageD;
  }

  bool getVisibiliteD(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .visibiliteD;
  }

  double getpositionGaucheD(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionGaucheD;
  }

  double getpositionHautD(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionHautD;
  }

  double getpositionDroiteD(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionDroiteD;
  }


  double getpositionBasD(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionBasD;
  }

  double gethauteurD(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion.hauteurD;
  }

  double getlargeurD(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion.largeurD;
  }


  int getNumeroImageE(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .numeroImageE;
  }

  bool getVisibiliteE(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .visibiliteE;
  }

  double getpositionGaucheE(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionGaucheE;
  }

  double getpositionHautE(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionHautE;
  }

  double getpositionDroiteE(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionDroiteE;
  }


  double getpositionBasE(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion
        .positionBasE;
  }

  double gethauteurE(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion.hauteurE;
  }

  double getlargeurE(int indexCourant) {
    return _listeSectionSauvegarder[indexCourant].animationquestion.largeurE;
  }


  void reset() {
    _listeSectionSauvegarder.clear();
  }
}
