


class OptionSauvegarder {

  String _optionA;
  String _optionB;
  String _optionC;

  String _couleurOptionA  ;
  String _couleurOptionB  ;
  String _couleurOptionC  ;

  String _couleurOptionLettreA  ;
  String _couleurOptionLettreB  ;
  String _couleurOptionLettreC  ;

  String _couleurBoutonChoixUtulisateur ;

  OptionSauvegarder(
      this._optionA,
      this._optionB,
      this._optionC,
      this._couleurOptionA,
      this._couleurOptionB,
      this._couleurOptionC,
      this._couleurOptionLettreA,
      this._couleurOptionLettreB,
      this._couleurOptionLettreC ,
      this._couleurBoutonChoixUtulisateur );

  @override toString() =>
      'optionA - optionB - optionC - couleurOptionA - couleurOptionB - couleurOptionC - '
      'couleurOptionLettreA - _couleurOptionLettreB - _couleurOptionLettreC  - couleurBoutonChoixUtulisateur ==>  '
      '$_optionA - $_optionB - $_optionC - $_couleurOptionA - $_couleurOptionB - $_couleurOptionC - '
      '$_couleurOptionLettreA - $_couleurOptionLettreB - $_couleurOptionLettreC'
      '$_couleurBoutonChoixUtulisateur';


  OptionSauvegarder.fromJson(Map<String, dynamic> json)
      :
        _optionA = json['_optionA'] ,
        _optionB = json['_optionB'] ,
        _optionC = json['_optionC'] ,
        _couleurOptionA = json['_couleurOptionA'] ,
        _couleurOptionB = json['_couleurOptionB'] ,
        _couleurOptionC = json['_couleurOptionC'] ,
        _couleurOptionLettreA = json['_couleurOptionLettreA'] ,
        _couleurOptionLettreB = json['_couleurOptionLettreB'] ,
        _couleurOptionLettreC = json['_couleurOptionLettreC']  ,
        _couleurBoutonChoixUtulisateur = json['_couleurBoutonChoixUtulisateur']
  ;


  Map<String, dynamic> toJson() => {

    '_optionA': _optionA,
    '_optionB': _optionB,
    '_optionC': _optionC,
    '_couleurOptionA': _couleurOptionA,
    '_couleurOptionB': _couleurOptionB,
    '_couleurOptionC': _couleurOptionC,
    '_couleurOptionLettreA': _couleurOptionLettreA,
    '_couleurOptionLettreB': _couleurOptionLettreB,
    '_couleurOptionLettreC': _couleurOptionLettreC,
    '_couleurBoutonChoixUtulisateur': _couleurBoutonChoixUtulisateur,


  } ;



  String get couleurBoutonChoixUtulisateur => _couleurBoutonChoixUtulisateur;

  String get couleurOptionLettreC => _couleurOptionLettreC;

  String get couleurOptionLettreB => _couleurOptionLettreB;

  String get couleurOptionLettreA => _couleurOptionLettreA;

  String get couleurOptionC => _couleurOptionC;

  String get couleurOptionB => _couleurOptionB;

  String get couleurOptionA => _couleurOptionA;

  String get optionC => _optionC;

  String get optionB => _optionB;

  String get optionA => _optionA;


  set couleurBoutonChoixUtulisateur(String value) {
    _couleurBoutonChoixUtulisateur = value;
  }

  set couleurOptionLettreC(String value) {
    _couleurOptionLettreC = value;
  }

  set couleurOptionLettreB(String value) {
    _couleurOptionLettreB = value;
  }

  set couleurOptionLettreA(String value) {
    _couleurOptionLettreA = value;
  }

  set couleurOptionC(String value) {
    _couleurOptionC = value;
  }

  set couleurOptionB(String value) {
    _couleurOptionB = value;
  }

  set couleurOptionA(String value) {
    _couleurOptionA = value;
  }

  set optionC(String value) {
    _optionC = value;
  }

  set optionB(String value) {
    _optionB = value;
  }

  set optionA(String value) {
    _optionA = value;
  }


}