


import 'AnimerQuestion.dart';
import 'OptionSauvegarder.dart';



class QuestionSauvegarder {

  int _id;
  String _questionText;
  bool _reponseA;
  bool _reponseB;
  bool _reponseC;
  bool _fauteGrave;
  String _explication;
  int _point;
  String _cheminImageSource;
  int _numeroImageSource;

  OptionSauvegarder optionsauvegarder ;
  AnimerQuestion animationquestion  ;


  @override
  toString() =>

      '$_id -  $_questionText -$_reponseA - $_reponseB  - $_reponseC - $_fauteGrave -$_explication -$_point '
          '-$_cheminImageSource -$_numeroImageSource' ' - $optionsauvegarder'  '- $animationquestion';



  QuestionSauvegarder(
      this._id,
      this._questionText,
      this._reponseA,
      this._reponseB,
      this._reponseC,
      this._fauteGrave,
      this._explication,
      this._point,
      this._cheminImageSource,
      this._numeroImageSource,
      this.optionsauvegarder,
      this.animationquestion);





  QuestionSauvegarder.fromJson(Map<String, dynamic> json)
      : _id = json['_id'] ,
        _questionText = json['_questionText'],
        _reponseA = json['_reponseA'] ,
        _reponseB = json['_reponseB'] ,
        _reponseC = json['_reponseC'] ,
        _fauteGrave = json['_fauteGrave'] ,
        _explication = json['_explication'] ,
        _point = json['_point'] ,
        _cheminImageSource = json['_cheminImageSource'] ,
        _numeroImageSource = json['_numeroImageSource'] ,
        optionsauvegarder = OptionSauvegarder.fromJson( json['optionsauvegarder']) ,
        animationquestion = AnimerQuestion.fromJson( json['animationquestion'])

  ;


  Map<String, dynamic> toJson() =>

      {
        '_id': _id,
        '_questionText': _questionText,
        '_reponseA': _reponseA,
        '_reponseB': _reponseB,
        '_reponseC': _reponseC,
        '_fauteGrave': _fauteGrave,
        '_explication': _explication,
        '_point': _point,
        '_cheminImageSource': _cheminImageSource,
        '_numeroImageSource': _numeroImageSource,
        'optionsauvegarder': optionsauvegarder.toJson(),
        'animationquestion': animationquestion.toJson(),


      } ;

  int get numeroImageSource => _numeroImageSource;

  String get cheminImageSource => _cheminImageSource;

  int get point => _point;

  String get explication => _explication;

  bool get fauteGrave => _fauteGrave;

  bool get reponseC => _reponseC;

  bool get reponseB => _reponseB;

  bool get reponseA => _reponseA;

  String get questionText => _questionText;

  int get id => _id;


  set numeroImageSource(int value) {
    _numeroImageSource = value;
  }

  set cheminImageSource(String value) {
    _cheminImageSource = value;
  }

  set point(int value) {
    _point = value;
  }

  set explication(String value) {
    _explication = value;
  }

  set fauteGrave(bool value) {
    _fauteGrave = value;
  }

  set reponseC(bool value) {
    _reponseC = value;
  }

  set reponseB(bool value) {
    _reponseB = value;
  }

  set reponseA(bool value) {
    _reponseA = value;
  }

  set questionText(String value) {
    _questionText = value;
  }

  set id(int value) {
    _id = value;
  }
}