import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Animation_horizontal_des_liste.dart';
import 'BouttonTheme.dart';
import 'Constantes.dart';
import 'EcranProfil.dart';
import 'TrasitionPages.dart';
import 'Utility.dart';
import 'Animation_vertical_des_liste_.dart';

class EcranCours extends StatefulWidget {
  @override
  _EcranCoursState createState() => _EcranCoursState();
}

class ThemeCours {
  String balise ;
  String nom_image_svg;

  String nom_du_theme ;


  ThemeCours(this.balise , this.nom_image_svg, this.nom_du_theme);

}

class _EcranCoursState extends State<EcranCours> {

  Image img;
  String Nom ;
  String cleNom  ;
  String cleImageProfil  ;


@override
  void initState() {
  chargerImageDisque() ;

  cleNom = Provider.of<EcranProfilState>(context , listen: false).getcleNom();

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



  chargerImageDisque() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final imageKeyValue = prefs.getString(IMAGE_KEY);
    if (imageKeyValue != null) {
      final imageString = await Utility.loadImageFromPrefs();
      setState(() {
        img = Utility.imageFrom64BaseString(imageString);
      });
    }
  }

  @override
  void dispose() {
     super.dispose();
  }


List<ThemeCours> _themesCour = [
  ThemeCours('A','V', 'LA VOIE PUBLIQUE'),
  ThemeCours('B','U', 'LES USAGER DE LA ROUTE '),
  ThemeCours('C','V', 'LE VEHICULE'),
  ThemeCours('D','V', 'LA VITESSE'),
  ThemeCours('E','C', 'CROISEMENT ET DEPASSEMENT'),
  ThemeCours('F','P', 'LA PRIORITE'),
  ThemeCours('G','O', 'OU CIRCULER'),
  ThemeCours('H','R', 'LA REGLEMENTATION '),
  ThemeCours('I','A', 'ARRÊT ET STATIONNEMENT'),
  ThemeCours('J','D', 'DIVERS'),
  /*ThemeCours('J','I', 'INJONCTION'),
  ThemeCours('K','S', 'LES SIGNEAUX'),
  ThemeCours('L','M', 'MARQUES ROUTIERES'),
  ThemeCours('N','P', 'LA PRIORITE'),
  ThemeCours('O','C', 'CROISEMENT ET DEPASSEMENT'),
  ThemeCours('P','R', 'ROUTES ET AUTOROUTES'),
  ThemeCours('Q','P', 'PIETONS ET DEUX ROUES'),
  ThemeCours('R','T', 'TRAIN TRAM BUS '),
  ThemeCours('S','A', 'ARRET ET STATIONNEMT'),
  ThemeCours('T','Z', 'ZONES LENTE'),
  ThemeCours('U','P', 'PANNES ET ACCIDENTS'),*/






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
              BouttonProfil (
                imageFromPreferences: img ,
                nom  : Nom ,
                onPressed: ()  {

                  Navigator.of(context, rootNavigator: true ).push(TransitionBas(

                        page :  EcranProfil()));

                },

              ) ,

          ],

        ),
        backgroundColor: Colors.white ,
        shadowColor:Colors.transparent ,

      ),

      body:  SafeArea(

        child: Container(


          color: kCouleurBody,

          child: LiveGrid(
            padding: EdgeInsets.fromLTRB(2 , 8 , 2 , 6),
            showItemInterval: Duration(milliseconds: 50),
            showItemDuration: Duration(milliseconds: 150),
            visibleFraction: 0.001,
            itemCount: _themesCour.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.9,
              mainAxisSpacing: 5,
            ),
            itemBuilder: animationItemBuilder(
                    (index) => Animation_horizontal_ecran_cours( balise :_themesCour[index].balise ,  nom_image_svg : _themesCour[index].nom_image_svg , nom_theme : _themesCour[index].nom_du_theme  )),



          ),
        ),
      ),

    );
  }
}
