import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'BouttonTheme.dart';
import 'Constantes.dart';
import 'EcranProfil.dart';
import 'TrasitionPages.dart';
import 'Utility.dart';
import 'VerticalItem.dart';

class EcranCours extends StatefulWidget {
  @override
  _EcranCoursState createState() => _EcranCoursState();
}

class ThemeCour {
  String NomImageSVG;

  String nomTheme ;

  ThemeCour(this.NomImageSVG, this.nomTheme);

}

class _EcranCoursState extends State<EcranCours> {

  Image img;
  String Nom ;
  String cleNom  ;
  String cleImageProfil  ;


@override
  void initState() {

  cleNom = Provider.of<EcranProfilState>(context , listen: false).getcleNom();
  cleImageProfil = Provider.of<EcranProfilState>(context , listen: false).getcleImage();


  Utility.instance.getStringValue(cleNom)
      .then((value) => setState(() {
    Nom = value;


  }));


  Utility.getImageFromPreferences(cleImageProfil).then((value) {
    if (null == value) {
      return;
    }
    setState(() {
      img = Utility.imageFromBase64String(value);
    });
  });

  Future.delayed(Duration(milliseconds: 500) * 5, () {
    if (!mounted) {
      return;
    }

  });


  super.initState();
     super.initState();
  }

  @override
  void dispose() {
     super.dispose();
  }


List<ThemeCour> _themesCour = [
  ThemeCour('A', 'ROUTE'),
  ThemeCour('B', 'USAGER'),
  ThemeCour('C', 'VOITURE'),
  ThemeCour('D', 'CROISEMENT'),
  ThemeCour('E', 'DEPASSEMENT'),
  ThemeCour('F', 'USAGER'),
  ThemeCour('G', 'VOITURE'),
  ThemeCour('H', 'CONDUCTEUR'),
  ThemeCour('I', 'VELO'),





] ;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,

      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Container(
              child: BouttonProfil (
                imageFromPreferences: img ,
                nom  : Nom ,
                onPressed: ()  {

                  Navigator.of(context, rootNavigator: true ).push(TransitionBas(

                        page :  EcranProfil()));

                },

              ) ,
            ) ,
          ],

        ),
        backgroundColor: kCouleurBlancGeneral ,
      ),

      body:  SafeArea(

        child: Container(
          color: kCouleurBody,

          child: LiveGrid(
            padding: EdgeInsets.fromLTRB(0 , 6 , 0 , 6),
            showItemInterval: Duration(milliseconds: 50),
            showItemDuration: Duration(milliseconds: 150),
            visibleFraction: 0.001,
            itemCount: _themesCour.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemBuilder: animationItemBuilder(
                    (index) => HorizontalItemCourAcceuil( NomImageSVG : _themesCour[index].NomImageSVG , nomTheme : _themesCour[index].nomTheme  )),



          ),
        ),
      ),

    );
  }
}
