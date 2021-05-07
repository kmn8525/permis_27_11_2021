

 class Option {


  String _id;
  String _optionA;
  String _optionB;
  String _optionC;

  Option.C1();
  Option(
      this._id, this._optionA, this._optionB, this._optionC );

  @override toString() =>  '  id_Option - optionA - optionB - optionC  ==>  '
      '$id-  $_optionA - $_optionB - $_optionC . ' ;



  String get id => _id;
  String get optionA => _optionA;
  String get optionB => _optionB;
  String get optionC => _optionC;


  set id(String id) => _id = id;
  set optionA(String optionA) => _optionA = optionA;
  set optionB(String optionB) => _optionB = optionB;
  set optionC(String optionC) => _optionC = optionC;

  Option.fromJson(Map<String, dynamic> json)
      : _id = json['_id'] ,
        _optionA = json['_optionA'] ,
        _optionB = json['_optionB'] ,
        _optionC = json['_optionC'] ;


  Map<String, dynamic> toJson() => {
    '_id': _id,
    '_optionA': _optionA,
    '_optionB': _optionB,
    '_optionC': _optionC,


  } ;

  }


 /*Option.fromJson(Map<String, dynamic> json) {
 _id = json['id'];
 _optionA = json['option_A'];
 _optionB = json['option_B'];
 _optionC = json['option_C'];
 }

 Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = new Map<String, dynamic>();
   data['id'] = this._id;
   data['option_A'] = this._optionA;
   data['option_B'] = this._optionB;
   data['option_C'] = this._optionC;
   return data;
 }
  */
