


class AnimerQuestion {

  @override toString() =>  ' /--- AnimerQuestion --/ '
      '  $_cheminImageAnimations -'
      '** AnimerQuestion A **  $_numeroImageA - $_visibiliteA -$_DescriptionA - $_positionGaucheA - $_positionHautA - '
      '$_positionDroiteA  - $_positionBasA - $_hauteurA  - $_largeurA '
       ' ** AnimerQuestion B  **    $_numeroImageA - $_visibiliteA ' ;


  String _cheminImageAnimations;

  int    _numeroImageA;
  bool   _visibiliteA ;
  String _DescriptionA;
  double _positionGaucheA ;
  double _positionHautA ;
  double _positionDroiteA ;
  double _positionBasA ;
  double _hauteurA ;
  double _largeurA ;

  int    _numeroImageB;
  bool   _visibiliteB;
  String _DescriptionB;
  double _positionGaucheB ;
  double _positionHautB ;
  double _positionDroiteB ;
  double _positionBasB ;
  double _hauteurB ;
  double _largeurB ;


  int   _numeroImageC;
  bool   _visibiliteC ;
  String _DescriptionC;
  double _positionGaucheC ;
  double _positionHautC ;
  double _positionDroiteC;
  double _positionBasC ;
  double _hauteurC ;
  double _largeurC ;

   int   _numeroImageD;
  bool   _visibiliteD ;
  String _DescriptionD;
  double _positionGaucheD ;
  double _positionHautD ;
  double _positionDroiteD ;
  double _positionBasD ;
  double _hauteurD ;
  double _largeurD ;

   int   _numeroImageE;
  bool   _visibiliteE ;
  String _DescriptionE;
  double _positionGaucheE ;
  double _positionHautE ;
  double _positionDroiteE ;
  double _positionBasE ;
  double _hauteurE ;
  double _largeurE ;


  AnimerQuestion(
      this._cheminImageAnimations,

      this._numeroImageA,
      this._visibiliteA,
      this._DescriptionA,
      this._positionGaucheA,
      this._positionHautA,
      this._positionDroiteA,
      this._positionBasA,
      this._hauteurA,
      this._largeurA,


      this._numeroImageB,
      this._visibiliteB,
      this._DescriptionB,
      this._positionGaucheB,
      this._positionHautB,
      this._positionDroiteB,
      this._positionBasB,
      this._hauteurB,
      this._largeurB,


      this._numeroImageC,
      this._visibiliteC,
      this._DescriptionC,
      this._positionGaucheC,
      this._positionHautC,
      this._positionDroiteC,
      this._positionBasC,
      this._hauteurC,
      this._largeurC,


      this._numeroImageD,
      this._visibiliteD,
      this._DescriptionD,
      this._positionGaucheD,
      this._positionHautD,
      this._positionDroiteD,
      this._positionBasD,
      this._hauteurD,
      this._largeurD,


      this._numeroImageE,
      this._visibiliteE,
      this._DescriptionE,
      this._positionGaucheE,
      this._positionHautE,
      this._positionDroiteE,
      this._positionBasE,
      this._hauteurE,
      this._largeurE);




  AnimerQuestion.fromJson(Map<String, dynamic> json)
      : _cheminImageAnimations = json['_cheminImageAnimations'] ,

        _numeroImageA = json['_numeroImageA'],
        _visibiliteA = json['_visibiliteA'] ,
        _DescriptionA = json['_DescriptionA'] ,
        _positionGaucheA = json['_positionGaucheA'] ,
        _positionHautA = json['_positionHautA'] ,
        _positionDroiteA = json['_positionDroiteA'] ,
        _positionBasA = json['_positionBasA'] ,
        _hauteurA = json['_hauteurA'],
        _largeurA = json['_largeurA'],

        _numeroImageB = json['_numeroImageB'] ,
        _visibiliteB = json['_visibiliteB'] ,
        _DescriptionB = json['_DescriptionB'] ,
        _positionGaucheB = json['_positionGaucheB'] ,
        _positionHautB = json['_positionHautB'] ,
        _positionDroiteB = json['_positionDroiteB'],
        _positionBasB = json['_positionBasB'] ,
        _hauteurB = json['_hauteurB'] ,
        _largeurB = json['_largeurB'],

        _numeroImageC = json['_numeroImageC'],
        _visibiliteC = json['_visibiliteC'] ,
        _DescriptionC = json['_DescriptionC'] ,
        _positionGaucheC = json['_positionGaucheC'] ,
        _positionHautC = json['_positionHautC'] ,
        _positionDroiteC = json['_positionDroiteC'] ,
        _positionBasC = json['_positionBasC'] ,
        _hauteurC = json['_hauteurC'],
        _largeurC = json['_largeurC'],


        _numeroImageD = json['_numeroImageD'],
        _visibiliteD = json['_visibiliteD'] ,
        _DescriptionD = json['_DescriptionD'] ,
        _positionGaucheD = json['_positionGaucheD'] ,
        _positionHautD = json['_positionHautD'] ,
        _positionDroiteD = json['_positionDroiteD'] ,
        _positionBasD = json['_positionBasD'] ,
        _hauteurD = json['_hauteurD'],
        _largeurD = json['_largeurD'],


        _numeroImageE = json['_numeroImageE'],
        _visibiliteE = json['_visibiliteE'] ,
        _DescriptionE = json['_DescriptionE'] ,
        _positionGaucheE = json['_positionGaucheE'] ,
        _positionHautE = json['_positionHautE'] ,
        _positionDroiteE = json['_positionDroiteE'] ,
        _positionBasE = json['_positionBasE'] ,
        _hauteurE = json['_hauteurE'],
        _largeurE = json['_largeurE'];


  Map<String, dynamic> toJson() =>

      {
        '_cheminImageAnimations': _cheminImageAnimations,


        '_numeroImageA': _numeroImageA,
        '_visibiliteA': _visibiliteA,
        '_DescriptionA' :  _DescriptionA ,
        '_positionHautA': _positionHautA,
        '_positionGaucheA': _positionGaucheA,
        '_positionDroiteA': _positionDroiteA,
        '_positionBasA': _positionBasA,
        '_hauteurA': _hauteurA,
        '_largeurA': _largeurA,


        '_numeroImageB': _numeroImageB,
        '_visibiliteB': _visibiliteB,
        '_DescriptionB' :  _DescriptionB ,
        '_positionHautB': _positionHautB,
        '_positionGaucheB': _positionGaucheB,
        '_positionDroiteB': _positionDroiteB,
        '_positionBasB': _positionBasB,
        '_hauteurB': _hauteurB,
        '_largeurB': _largeurB,


        '_numeroImageC': _numeroImageC,
        '_visibiliteC': _visibiliteC,
        '_DescriptionC' :  _DescriptionC,
        '_positionHautC': _positionHautC,
        '_positionGaucheC': _positionGaucheC,
        '_positionDroiteC': _positionDroiteC,
        '_positionBasC': _positionBasC,
        '_hauteurC': _hauteurC,
        '_largeurC': _largeurC,


        '_numeroImageD': _numeroImageD,
        '_visibiliteD': _visibiliteD,
        '_DescriptionD' :  _DescriptionD ,
        '_positionHautD': _positionHautD,
        '_positionGaucheD': _positionGaucheD,
        '_positionDroiteD': _positionDroiteD,
        '_positionBasD': _positionBasD,
        '_hauteurD': _hauteurD,
        '_largeurD': _largeurD,


        '_numeroImageE': _numeroImageE,
        '_visibiliteE': _visibiliteE,
        '_DescriptionE' :  _DescriptionE ,
        '_positionHautE': _positionHautE,
        '_positionGaucheE': _positionGaucheE,
        '_positionDroiteE': _positionDroiteE,
        '_positionBasE': _positionBasE,
        '_hauteurE': _hauteurE,
        '_largeurE': _largeurE,


      } ;


  /////////////////////////////////////////////////////////////////////
  ///// ---------------    GETTER -------------- /////////
  /////////////////////////////////////////////////////////////////////


  double get largeurE => _largeurE;

  double get hauteurE => _hauteurE;

  double get positionBasE => _positionBasE;

  double get positionDroiteE => _positionDroiteE;

  double get positionHautE => _positionHautE;

  double get positionGaucheE => _positionGaucheE;

  String get DescriptionE => _DescriptionE;

  bool get visibiliteE => _visibiliteE;

  int get numeroImageE => _numeroImageE;

  double get largeurD => _largeurD;

  double get hauteurD => _hauteurD;

  double get positionBasD => _positionBasD;

  double get positionDroiteD => _positionDroiteD;

  double get positionHautD => _positionHautD;

  double get positionGaucheD => _positionGaucheD;

  String get DescriptionD => _DescriptionD;

  bool get visibiliteD => _visibiliteD;

  int get numeroImageD => _numeroImageD;

  double get largeurC => _largeurC;

  double get hauteurC => _hauteurC;

  double get positionBasC => _positionBasC;

  double get positionDroiteC => _positionDroiteC;

  double get positionHautC => _positionHautC;

  double get positionGaucheC => _positionGaucheC;

  String get DescriptionC => _DescriptionC;

  bool get visibiliteC => _visibiliteC;

  int get numeroImageC => _numeroImageC;

  double get largeurB => _largeurB;

  double get hauteurB => _hauteurB;

  double get positionBasB => _positionBasB;

  double get positionDroiteB => _positionDroiteB;

  double get positionHautB => _positionHautB;

  double get positionGaucheB => _positionGaucheB;

  String get DescriptionB => _DescriptionB;

  bool get visibiliteB => _visibiliteB;

  int get numeroImageB => _numeroImageB;

  double get largeurA => _largeurA;

  double get hauteurA => _hauteurA;

  double get positionBasA => _positionBasA;

  double get positionDroiteA => _positionDroiteA;

  double get positionHautA => _positionHautA;

  double get positionGaucheA => _positionGaucheA;

  String get DescriptionA => _DescriptionA;

  bool get visibiliteA => _visibiliteA;

  int get numeroImageA => _numeroImageA;

  String get cheminImageAnimations => _cheminImageAnimations;


  /////////////////////////////////////////////////////////////////////
///// ---------------    SETTER -------------- /////////
/////////////////////////////////////////////////////////////////////


  set largeurE(double value) {
    _largeurE = value;
  }

  set hauteurE(double value) {
    _hauteurE = value;
  }

  set positionBasE(double value) {
    _positionBasE = value;
  }

  set positionDroiteE(double value) {
    _positionDroiteE = value;
  }

  set positionHautE(double value) {
    _positionHautE = value;
  }

  set positionGaucheE(double value) {
    _positionGaucheE = value;
  }

  set DescriptionE(String value) {
    _DescriptionE = value;
  }

  set visibiliteE(bool value) {
    _visibiliteE = value;
  }

  set numeroImageE(int value) {
    _numeroImageE = value;
  }

  set largeurD(double value) {
    _largeurD = value;
  }

  set hauteurD(double value) {
    _hauteurD = value;
  }

  set positionBasD(double value) {
    _positionBasD = value;
  }

  set positionDroiteD(double value) {
    _positionDroiteD = value;
  }

  set positionHautD(double value) {
    _positionHautD = value;
  }

  set positionGaucheD(double value) {
    _positionGaucheD = value;
  }

  set DescriptionD(String value) {
    _DescriptionD = value;
  }

  set visibiliteD(bool value) {
    _visibiliteD = value;
  }

  set numeroImageD(int value) {
    _numeroImageD = value;
  }

  set largeurC(double value) {
    _largeurC = value;
  }

  set hauteurC(double value) {
    _hauteurC = value;
  }

  set positionBasC(double value) {
    _positionBasC = value;
  }

  set positionDroiteC(double value) {
    _positionDroiteC = value;
  }

  set positionHautC(double value) {
    _positionHautC = value;
  }

  set positionGaucheC(double value) {
    _positionGaucheC = value;
  }

  set DescriptionC(String value) {
    _DescriptionC = value;
  }

  set visibiliteC(bool value) {
    _visibiliteC = value;
  }

  set numeroImageC(int value) {
    _numeroImageC = value;
  }

  set largeurB(double value) {
    _largeurB = value;
  }

  set hauteurB(double value) {
    _hauteurB = value;
  }

  set positionBasB(double value) {
    _positionBasB = value;
  }

  set positionDroiteB(double value) {
    _positionDroiteB = value;
  }

  set positionHautB(double value) {
    _positionHautB = value;
  }

  set positionGaucheB(double value) {
    _positionGaucheB = value;
  }

  set DescriptionB(String value) {
    _DescriptionB = value;
  }

  set visibiliteB(bool value) {
    _visibiliteB = value;
  }

  set numeroImageB(int value) {
    _numeroImageB = value;
  }

  set largeurA(double value) {
    _largeurA = value;
  }

  set hauteurA(double value) {
    _hauteurA = value;
  }

  set positionBasA(double value) {
    _positionBasA = value;
  }

  set positionDroiteA(double value) {
    _positionDroiteA = value;
  }

  set positionHautA(double value) {
    _positionHautA = value;
  }

  set positionGaucheA(double value) {
    _positionGaucheA = value;
  }

  set DescriptionA(String value) {
    _DescriptionA = value;
  }

  set visibiliteA(bool value) {
    _visibiliteA = value;
  }

  set numeroImageA(int value) {
    _numeroImageA = value;
  }

  set cheminImageAnimations(String value) {
    _cheminImageAnimations = value;
  }




}


