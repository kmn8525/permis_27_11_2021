

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
  String _cheminImageExplicationA;
  int _numeroImageExplicationA;
  String _cheminImageExplicationB;
  int _numeroImageExplicationB;
  String _cheminImageExplicationC;
  int _numeroImageExplicationC;
  String _cheminImageExplicationD;
  int _numeroImageExplicationD;
  String _cheminImageExplicationE;
  int _numeroImageExplicationE;

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
      this._cheminImageExplicationA,
      this._numeroImageExplicationA,
      this._cheminImageExplicationB,
      this._numeroImageExplicationB,
      this._cheminImageExplicationC,
      this._numeroImageExplicationC,
      this._cheminImageExplicationD,
      this._numeroImageExplicationD,
      this._cheminImageExplicationE,
      this._numeroImageExplicationE);



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
        _cheminImageExplicationA = json['_cheminImageExplicationA'] ,
        _numeroImageExplicationA = json['_numeroImageExplicationA'] ,
        _cheminImageExplicationB = json['_cheminImageExplicationB'] ,
        _numeroImageExplicationB = json['_numeroImageExplicationB'] ,
        _cheminImageExplicationC = json['_cheminImageExplicationC'] ,
        _numeroImageExplicationC = json['_numeroImageExplicationC'] ,
        _cheminImageExplicationD = json['_cheminImageExplicationD'] ,
        _numeroImageExplicationD = json['_numeroImageExplicationD'] ,
        _cheminImageExplicationE = json['_cheminImageExplicationE'] ,
        _numeroImageExplicationE = json['_numeroImageExplicationE'] ;





  Map<String, dynamic> toJson() => {
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
    '_cheminImageExplicationA': _cheminImageExplicationA,
    '_numeroImageExplicationA': _numeroImageExplicationA,
    '_cheminImageExplicationB': _cheminImageExplicationB,
    '_numeroImageExplicationB': _numeroImageExplicationB,
    '_cheminImageExplicationC': _cheminImageExplicationC,
    '_numeroImageExplicationC': _numeroImageExplicationC,
    '_cheminImageExplicationD': _cheminImageExplicationD,
    '_numeroImageExplicationD': _numeroImageExplicationD,
    '_cheminImageExplicationE': _cheminImageExplicationE,
    '_numeroImageExplicationE': _numeroImageExplicationE,


  };

  @override
  toString() =>
      'Donnes ==> : id - questionText - reponse_A - reponse_B - reponse_C '
      '- fauteGrave - explication - point  - cheminImageSource - numeroImageSource -'
          ' cheminImageExplicationA - numeroImageExplicationA - cheminImageExplicationB - numeroImageExplicationB'
          ' - cheminImageExplicationC - numeroImageExplicationC - cheminImageExplicationD - numeroImageExplicationD - cheminImageExplicationE - numeroImageExplicationE ==> '
      '$_id -  $_questionText -$_reponseA - $_reponseB  - $_reponseC - $_fauteGrave -$_explication -$_point '
      '-$_cheminImageSource -$_numeroImageSource -$_cheminImageExplicationA -$_numeroImageExplicationA - $_cheminImageExplicationB -$_numeroImageExplicationB -'
          ' $_cheminImageExplicationC -$_numeroImageExplicationC - $_cheminImageExplicationD -$_numeroImageExplicationD - $_cheminImageExplicationE - $_numeroImageExplicationE';


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
  String get cheminImageExplicationA => _cheminImageExplicationA;
  int get numeroImageExplicationA => _numeroImageExplicationA;
  String get cheminImageExplicationB => _cheminImageExplicationB;
  int get numeroImageExplicationB => _numeroImageExplicationB;
  String get cheminImageExplicationC => _cheminImageExplicationC;
  int get numeroImageExplicationC => _numeroImageExplicationC;
  String get cheminImageExplicationD => _cheminImageExplicationD;
  int get numeroImageExplicationD => _numeroImageExplicationD;
  String get cheminImageExplicationE => _cheminImageExplicationE;
  int get numeroImageExplicationE => _numeroImageExplicationE;



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

  set numeroImageExplicationE(int value) {
    _numeroImageExplicationE = value;
  }

  set cheminImageExplicationE(String value) {
    _cheminImageExplicationE = value;
  }

  set numeroImageExplicationD(int value) {
    _numeroImageExplicationD = value;
  }

  set cheminImageExplicationD(String value) {
    _cheminImageExplicationD = value;
  }

  set numeroImageExplicationC(int value) {
    _numeroImageExplicationC = value;
  }

  set cheminImageExplicationC(String value) {
    _cheminImageExplicationC = value;
  }

  set numeroImageExplicationB(int value) {
    _numeroImageExplicationB = value;
  }

  set cheminImageExplicationB(String value) {
    _cheminImageExplicationB = value;
  }

  set numeroImageExplicationA(int value) {
    _numeroImageExplicationA = value;
  }

  set cheminImageExplicationA(String value) {
    _cheminImageExplicationA = value;
  }
}
