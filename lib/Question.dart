

import 'package:flutter/cupertino.dart';

import 'Option.dart';

class Question     {
  String _id;
  String _questionText;
  bool _reponseA;
  bool _reponseB;
  bool _reponseC;
  bool _fauteGrave;
  String _explication;
  int _point;
  String _cheminImageSource;
  int _numeroImageSource;
  String _cheminQuestionAnimationExplication;
  int _numeroQuestionAnimationExplication;

  Question.C1();


  Question(
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
      this._cheminQuestionAnimationExplication,
      this._numeroQuestionAnimationExplication,
       );



  Question.fromJson(Map<String, dynamic> json)
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
        _cheminQuestionAnimationExplication = json['_cheminQuestionAnimationExplication'] ,
        _numeroQuestionAnimationExplication = json['_numeroQuestionAnimationExplication'] ;





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
        '_cheminQuestionAnimationExplication': _cheminQuestionAnimationExplication,
        '_numeroQuestionAnimationExplication': _numeroQuestionAnimationExplication,

      } ;



  @override
  toString() =>
      'Donnes ==> : id - questionText - reponse_A - reponse_B - reponse_C '
      '- fauteGrave - explication - point  - cheminImageSource - numeroImageSource -'
          ' _cheminQuestionAnimationExplication - _numeroQuestionAnimationExplication -  ==> '
      '$_id -  $_questionText -$_reponseA - $_reponseB  - $_reponseC - $_fauteGrave -$_explication -$_point '
      '-$_cheminImageSource -$_numeroImageSource -$_cheminQuestionAnimationExplication -$_numeroQuestionAnimationExplication';


  String get id => _id;
  String get questionText => _questionText;
  bool get reponseA => _reponseA;
  bool get reponseB => _reponseB;
  bool get reponseC => _reponseC;
  bool get fauteGrave => _fauteGrave;
  String get explication => _explication;
  int get point => _point;
  String get cheminImageSource => _cheminImageSource;
  int get numeroImageSource => _numeroImageSource;
  String get cheminQuestionAnimationExplication => _cheminQuestionAnimationExplication;
  int get numeroQuestionAnimationExplication => _numeroQuestionAnimationExplication;



  set id(String value) {
    _id = value;
  }
  set questionText(String value) {
    _questionText = value;
  }

  set reponseA(bool value) {
    _reponseA = value;
  }


  set reponseB(bool value) {
    _reponseB = value;
  }


  set reponseC(bool value) {
    _reponseC = value;
  }


  set fauteGrave(bool value) {
    _fauteGrave = value;
  }


  set explication(String value) {
    _explication = value;
  }


  set point(int value) {
    _point = value;
  }


  set cheminImageSource(String value) {
    _cheminImageSource = value;
  }


  set numeroImageSource(int value) {
    _numeroImageSource = value;
  }



  set numeroQuestionAnimationExplication(int value) {
    _numeroQuestionAnimationExplication = value;
  }

  set cheminQuestionAnimationExplication(String value) {
    _cheminQuestionAnimationExplication = value;
  }
}
