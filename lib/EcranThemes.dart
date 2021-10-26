import 'dart:async';

import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permis/BouttonTheme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Animation_horizontal_des_liste.dart';
import 'BouttonTheme.dart';
import 'Constantes.dart';
import 'EcranProfil.dart';
import 'TrasitionPages.dart';
import 'Utility.dart';
import 'Animation_vertical_des_liste_.dart';




class EcranTheme extends StatefulWidget   {
  //static  const String id = 'EcranThemes' ;


  @override
  EcranThemeState createState() => EcranThemeState();
}


class Theme {
  String NomImageSVG;

  String nomTheme ;


  Theme(this.NomImageSVG, this.nomTheme);


}

class EcranThemeState extends State<EcranTheme>  {
   Image img;
   String Nom ;
   String cleNom  ;
   String cleImageProfil  ;

  @override
  void initState() {
    chargerImageDisque();

    cleNom = Provider.of<EcranProfilState>(context , listen: false).getcleNom();

    Utility.instance.getStringValue(cleNom)
        .then((value) => setState(() {
      Nom = value;


    }));




    Future.delayed(Duration(milliseconds: 500) * 5, () {
      if (!mounted) {
        return;
      }

    });


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

   List<Theme> _themes = [
    Theme('definition', 'DEFINITION'),
    Theme('homme_au_volant', ' CONDUCTEUR ET PASSAGER'),
    Theme('policiere', 'PERSONNES QUALIFIÉES'),
    Theme('feuxControl', ' FEUX'),
    Theme('panneaux_ensemble', 'SIGNAUX'),
     Theme('paint', 'MARQUES ROUTIERES'),
   // Theme('chantier', 'VOIE_PUBLIC'),
    Theme('direction', 'PRIORITES'),
    Theme('pieton', 'USAGERS FAIBLES'),
    Theme('tramway', 'AUTRES USAGERS'),
    Theme('vitesse', 'VITESSE'),
    Theme('depasse', 'CROISEMENT ET  DEPACEMENT'),
    Theme('escargot', 'ENDROITS PARTICLIERS'),
     Theme('lieu', 'OU CIRCULER'),
     Theme('wiper', 'VISIBILITER REDUITE'),
     Theme('autoroute', 'ROUTES ET AUTOROUTES'),
     Theme('accident', 'PANNE ET ACCIDENT'),
    Theme('pas_alcool', 'ALCOOL ET DROGUES'),
    Theme('vest', 'EQUIPEMENTS GENERAL'),
    Theme('main_volant', 'TECHNIQUE DE CONDUITE'),
    Theme('battery', 'VEHICULE ET MECANIQUE  '),
    Theme('parking_voiture', 'ARRET ET STATIONEMENT'),
     Theme('chantier', 'FAUTES GRAVES'),
     Theme('ecologie', 'ECOLOGIE'),
     Theme('disk', 'FAVORIS'),





   ];




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
        backgroundColor: Colors.white,

        shadowColor:Colors.transparent ,
      ),


      body:  SafeArea(

        child: Container(
          color: Colors.white30,

          child: LiveGrid(
         //   padding: EdgeInsets.fromLTRB(0 , 5 , 0 , 50),
            showItemInterval: Duration(milliseconds: 45),
            showItemDuration: Duration(milliseconds: 100),
            visibleFraction: 0.001,
            itemCount: _themes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemBuilder: animationItemBuilder(
                    (index) => Animation_horizontale_ecran_theme( NomImageSVG : _themes[index].NomImageSVG , nomTheme : _themes[index].nomTheme  )),



          ),
        ),
      ),

    );

  }


}
