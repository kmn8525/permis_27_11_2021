import 'dart:async';

import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permis/BouttonTheme.dart';
import 'package:provider/provider.dart';

import 'BouttonTheme.dart';
import 'Constantes.dart';
import 'EcranProfil.dart';
import 'TrasitionPages.dart';
import 'Utility.dart';
import 'VerticalItem.dart';




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
  }


   @override
   void dispose() {

          super.dispose();
   }

   List<Theme> _themes = [
    Theme('informations', 'DEFINITION'),
    Theme('conducteur', 'CONDUCTEUR'),
    Theme('policiere', 'INJONCTIONS'),
    Theme('feuxControl', 'FEUX'),
     Theme('disk', 'FAVORIS'),
    Theme('danger', 'SIGNAUX'),
     Theme('paint', 'MARQUES_ROUTIERES'),
    Theme('chantier', 'VOIE_PUBLIC'),
    Theme('priorites', 'PRIORITES'),
    Theme('pieton', 'USAGERS_FAIBLES'),
    Theme('train4', 'AUTRES_USAGERS'),
    Theme('vitesse', 'VITESSE'),
    Theme('depacement', 'CROISEMENT_DEPACEMENT'),
    Theme('direction', 'PARTAGER_ROUTE'),
    Theme('escargot', 'ZONE_LENTE'),
    Theme('lieu', 'OU_CIRCULER'),
    Theme('autoroute', 'ROUTES_AUTOROUTES'),
    Theme('stopss', 'INTERDICTION'),
    Theme('accident', 'PANNE_ACCIDENT'),
    Theme('pas_alcool', 'ALCOOL_IMPREGNATION'),
    Theme('vest', 'EQUIPEMENTS_GENERAL'),
    Theme('mainvolant', 'TECHNIQUE_CONDUITE'),
    Theme('battery', 'MECANIQUE_VEHICULE'),
    Theme('parkingss', 'ARRET_STATIONEMENT'),
    Theme('ecologie', 'ECOLOGIE'),
     Theme('ampoule', 'DIVERS'),



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
        backgroundColor: kCouleurBlancGeneral ,
      ),


      body:  SafeArea(

        child: Container(
          color: kCouleurBody,

          child: LiveGrid(
            padding: EdgeInsets.fromLTRB(0 , 10 , 0 , 80),
            showItemInterval: Duration(milliseconds: 45),
            showItemDuration: Duration(milliseconds: 100),
            visibleFraction: 0.001,
            itemCount: _themes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemBuilder: animationItemBuilder(
                    (index) => HorizontalItemQuestion( NomImageSVG : _themes[index].NomImageSVG , nomTheme : _themes[index].nomTheme  )),



          ),
        ),
      ),

    );

  }


}
