

class Reponse {
  String _choix1;
  String _choix2;
  String _choix3;

  Reponse({String choix1, String choix2, String choix3}) {
    this._choix1 = choix1;
    this._choix2 = choix2;
    this._choix3 = choix3;
  }

  String get choix1 => _choix1;
  set choix1(String choix1) => _choix1 = choix1;
  String get choix2 => _choix2;
  set choix2(String choix2) => _choix2 = choix2;
  String get choix3 => _choix3;
  set choix3(String choix3) => _choix3 = choix3;

  Reponse.fromJson(Map<String, dynamic> json) {
    _choix1 = json['choix_1'];
    _choix2 = json['choix_2'];
    _choix3 = json['choix_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['choix_1'] = this._choix1;
    data['choix_2'] = this._choix2;
    data['choix_3'] = this._choix3;
    return data;
  }
}

