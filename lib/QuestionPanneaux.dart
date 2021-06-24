


class QuestionPanneaux {
  String _id;
   String _cheminImageSourceA;
  String _nomImageSourceA;
  bool _reponseA ;
  String _cheminImageSourceB;
  String _nomImagesourceB;
  bool _reponseB ;
  String _cheminImageSourceC;
  String _nomImageSourceC;
  bool _reponseC ;
  String _cheminImageSourceD;
  String _nomImageSourceD;
  bool _reponseD;
  String _cheminImageSourceE;
  String _nomImageSourceE;
  bool _reponseE;
  String _cheminImageSourceF;
  String _nomImageSourceF;
  bool _reponseF;
  String _cheminImageSourceG;
  String _nomImageSourceG;
  bool _reponseG ;
  String _cheminImageSourceH;
  String _nomImageSourceH;
  bool _reponseH;
  String _cheminImageSourceI;
  String _nomImageSourceI;
  bool _reponseI ;
  String _explication;


  QuestionPanneaux(
      this._id,
      this._cheminImageSourceA,
      this._nomImageSourceA,
      this._reponseA,
      this._cheminImageSourceB,
      this._nomImagesourceB,
      this._reponseB,
      this._cheminImageSourceC,
      this._nomImageSourceC,
      this._reponseC,
      this._cheminImageSourceD,
      this._nomImageSourceD,
      this._reponseD,
      this._cheminImageSourceE,
      this._nomImageSourceE,
      this._reponseE,
      this._cheminImageSourceF,
      this._nomImageSourceF,
      this._reponseF,
      this._cheminImageSourceG,
      this._nomImageSourceG,
      this._reponseG,
      this._cheminImageSourceH,
      this._nomImageSourceH,
      this._reponseH,
      this._cheminImageSourceI,
      this._nomImageSourceI,
      this._reponseI,
      this._explication);

  QuestionPanneaux.fromJson(Map<String, dynamic> json )
      : _id = json['_id'] ,
         _cheminImageSourceA = json['_cheminImageSourcA'] ,
       _nomImageSourceA = json['_nomImageSourceA'] ,
        _reponseA = json['_reponseA'] ,
      _cheminImageSourceB = json['_cheminImageSourceB'] ,
        _nomImagesourceB = json['_nomImagesourceB'] ,
        _reponseB = json['_reponseB'] ,
      _cheminImageSourceC = json['_cheminImageSourceC'] ,
        _nomImageSourceC = json['_nomImageSourceC'] ,
     _reponseC = json['_reponseC'] ,
        _cheminImageSourceD = json['_cheminImageSourceD'] ,
        _nomImageSourceD = json['_nomImageSourceD'] ,
        _reponseD = json['_reponseD'] ,
        _cheminImageSourceE = json['_cheminImageSourceE'] ,
        _nomImageSourceE = json['_nomImageSourceE'] ,
        _reponseE = json['_reponseE'] ,
        _cheminImageSourceF = json['_cheminImageSourceF'] ,
        _nomImageSourceF = json['_nomImageSourceF'] ,
        _reponseF = json['_reponseF'] ,
        _cheminImageSourceG = json['_cheminImageSourceG'] ,
        _nomImageSourceG = json['_nomImageSourceG'] ,
        _reponseG = json['_reponseG'] ,
        _cheminImageSourceH = json['_cheminImageSourceH'] ,
        _nomImageSourceH = json['_nomImageSourceH'] ,
        _reponseH = json['_reponseH'] ,
        _cheminImageSourceI = json['_cheminImageSourceI'] ,
        _nomImageSourceI = json['_nomImageSourceI'] ,
        _reponseI = json['_reponseI'] ,
        _explication = json['_explication'] ;






  Map<String, dynamic> toJson() => {

    '_id' : _id ,
     '_cheminImageSourceA' : _cheminImageSourceA ,
    '_nomImageSourceA' : _nomImageSourceA ,
    '_reponseA' : _reponseA ,
    '_cheminImageSourceB' : _cheminImageSourceB ,
    '_nomImagesourceB' : _nomImagesourceB ,
    '_reponseB' : _reponseB ,
    '_cheminImageSourceC' : _cheminImageSourceC ,
    '_nomImageSourceC' : _nomImageSourceC ,
    '_reponseC' : _reponseC ,

    '_cheminImageSourceD' : _cheminImageSourceD ,
       '_nomImageSourceD' :    _nomImageSourceD ,
              '_reponseD' :           _reponseD ,

    '_cheminImageSourceE' : _cheminImageSourceE ,
    '_nomImageSourceE' :    _nomImageSourceE ,
    '_reponseE' :           _reponseE ,

    '_cheminImageSourceF' : _cheminImageSourceF ,
    '_nomImageSourceF' :    _nomImageSourceF,
    '_reponseF' :           _reponseF,

    '_cheminImageSourceG' : _cheminImageSourceG ,
    '_nomImageSourceG' :    _nomImageSourceG ,
    '_reponseG' :           _reponseG ,

    '_cheminImageSourceH' : _cheminImageSourceH ,
    '_nomImageSourceH' :    _nomImageSourceH ,
    '_reponseH' :           _reponseH ,

    '_cheminImageSourceI' : _cheminImageSourceI ,
    '_nomImageSourceI' :    _nomImageSourceI,
    '_reponseI' :           _reponseI ,

    '_explication' :          _explication ,


  } ;

  String get explication => _explication;

  bool get reponseI => _reponseI;

  String get nomImageSourceI => _nomImageSourceI;

  String get cheminImageSourceI => _cheminImageSourceI;

  bool get reponseH => _reponseH;

  String get nomImageSourceH => _nomImageSourceH;

  String get cheminImageSourceH => _cheminImageSourceH;

  bool get reponseG => _reponseG;

  String get nomImageSourceG => _nomImageSourceG;

  String get cheminImageSourceG => _cheminImageSourceG;

  bool get reponseF => _reponseF;

  String get nomImageSourceF => _nomImageSourceF;

  String get cheminImageSourceF => _cheminImageSourceF;

  bool get reponseE => _reponseE;

  String get nomImageSourceE => _nomImageSourceE;

  String get cheminImageSourceE => _cheminImageSourceE;

  bool get reponseD => _reponseD;

  String get nomImageSourceD => _nomImageSourceD;

  String get cheminImageSourceD => _cheminImageSourceD;

  bool get reponseC => _reponseC;

  String get nomImageSourceC => _nomImageSourceC;

  String get cheminImageSourceC => _cheminImageSourceC;

  bool get reponseB => _reponseB;

  String get nomImagesourceB => _nomImagesourceB;

  String get cheminImageSourceB => _cheminImageSourceB;

  bool get reponseA => _reponseA;

  String get nomImageSourceA => _nomImageSourceA;

  String get cheminImageSourceA => _cheminImageSourceA;

  String get id => _id;



  set explication(String value) {
    _explication = value;
  }

  set reponseI(bool value) {
    _reponseI = value;
  }

  set nomImageSourceI(String value) {
    _nomImageSourceI = value;
  }

  set cheminImageSourceI(String value) {
    _cheminImageSourceI = value;
  }

  set reponseH(bool value) {
    _reponseH = value;
  }

  set nomImageSourceH(String value) {
    _nomImageSourceH = value;
  }

  set cheminImageSourceH(String value) {
    _cheminImageSourceH = value;
  }

  set reponseG(bool value) {
    _reponseG = value;
  }

  set nomImageSourceG(String value) {
    _nomImageSourceG = value;
  }

  set cheminImageSourceG(String value) {
    _cheminImageSourceG = value;
  }

  set reponseF(bool value) {
    _reponseF = value;
  }

  set nomImageSourceF(String value) {
    _nomImageSourceF = value;
  }

  set cheminImageSourceF(String value) {
    _cheminImageSourceF = value;
  }

  set reponseE(bool value) {
    _reponseE = value;
  }

  set nomImageSourceE(String value) {
    _nomImageSourceE = value;
  }

  set cheminImageSourceE(String value) {
    _cheminImageSourceE = value;
  }

  set reponseD(bool value) {
    _reponseD = value;
  }

  set nomImageSourceD(String value) {
    _nomImageSourceD = value;
  }

  set cheminImageSourceD(String value) {
    _cheminImageSourceD = value;
  }

  set reponseC(bool value) {
    _reponseC = value;
  }

  set nomImageSourceC(String value) {
    _nomImageSourceC = value;
  }

  set cheminImageSourceC(String value) {
    _cheminImageSourceC = value;
  }

  set reponseB(bool value) {
    _reponseB = value;
  }

  set nomImagesourceB(String value) {
    _nomImagesourceB = value;
  }

  set cheminImageSourceB(String value) {
    _cheminImageSourceB = value;
  }

  set reponseA(bool value) {
    _reponseA = value;
  }

  set nomImageSourceA(String value) {
    _nomImageSourceA = value;
  }

  set cheminImageSourceA(String value) {
    _cheminImageSourceA = value;
  }

  set id(String value) {
    _id = value;
  }



}

