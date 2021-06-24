import 'dart:async';

import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permis/BouttonTheme.dart';
import 'package:provider/provider.dart';

import 'BouttonTheme.dart';
import 'Constantes.dart';
import 'EcranProfil.dart';
import 'ListeResultats.dart';
import 'Utility.dart';
import 'VerticalItem.dart';




class EcranRoute extends StatefulWidget   {
final String titrePage ;

  const EcranRoute({Key key, this.titrePage}) : super(key: key);

  @override
  EcranRouteState createState() => EcranRouteState();

}


class ThemeRoute {

  int numeros ;
  String nomTheme ;


  ThemeRoute(this.numeros  , this.nomTheme);


}

class EcranRouteState extends State<EcranRoute>  {
  Image img;
  String Nom ;
  String cleNom  ;
  String cleImageProfil  ;

  @override
  void initState() {

    super.initState();
  }


  @override
  void dispose() {

    super.dispose();
  }

  List<ThemeRoute> _themesroute = [
    ThemeRoute(1 , '1 - La signalisation de la route'),
    ThemeRoute(2 ,'2 - La route et les sigeaux'),
    ThemeRoute(3 ,'3 -  '),
    ThemeRoute(4 ,'4 -  '),

  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,


      appBar: AppBar(

        leading:   IconButton(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            icon:   Icon(
              Icons.arrow_back,
              color: Colors.blueAccent ,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);

            }
        ),
        title: Row(
          children: <Widget> [

            Container(
                padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Text(widget.titrePage)
            ),



          ],
        ),
      ),


      body:  SafeArea(

        child: Container(
          color: kCouleurBody,

          child: LiveList(
            showItemInterval: Duration(milliseconds: 150),
            showItemDuration: Duration(milliseconds: 350),
            padding: EdgeInsets.all(16),
            reAnimateOnVisibility: true,
            scrollDirection: Axis.vertical,
            itemCount: _themesroute.length,
            itemBuilder: animationItemBuilder(
                  (index) => VerticalItemRoute(nomTheme : _themesroute[index].nomTheme),
              padding: EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
      ),

    );

  }


}
