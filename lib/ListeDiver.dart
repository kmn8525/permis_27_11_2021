


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'QuestionPanneaux.dart';

class QuestionPanneauSignalisation  with  ChangeNotifier , DiagnosticableTreeMixin {


  int _numeroQuestion  = 0 ;
  String cleNumQD = "qQP";
  bool serieFini = false;

  QuestionPanneauSignalisation( );



  List<QuestionPanneaux > _listeQuestionPanneaux = [





  ] ;



}