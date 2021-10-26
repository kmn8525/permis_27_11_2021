
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permis/BouttonTheme.dart';
import 'package:provider/provider.dart';

import 'Acceuil.dart';
import 'BouttonTheme.dart';
import 'Constantes.dart';
import 'EcranProfil.dart';
import 'Listes_section_theme_cours.dart';
import 'TrasitionPages.dart';
import 'Utility.dart';
import 'Animation_vertical_des_liste_.dart';




class Ecran_cour_voie_publique extends StatefulWidget   {
final String titrePage ;

    Ecran_cour_voie_publique({Key key, this.titrePage}) : super(key: key);

  @override
  Ecran_cour_voie_publiqueState createState() => Ecran_cour_voie_publiqueState();

}



class Ecran_cour_voie_publiqueState extends State<Ecran_cour_voie_publique>  {
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

  List<Listes_section_theme_cours> _liste_voie_publique = [
    Listes_section_theme_cours(1 ,'1 - La chaussée'),
    Listes_section_theme_cours(2 ,'2 - Bandes de circulation'),
    Listes_section_theme_cours(3 ,'3 - La piste cyclable'),
    Listes_section_theme_cours(4 ,'4 - L\'autoroute'),
    Listes_section_theme_cours(5 ,'5 - La route pour automobiles'),
    Listes_section_theme_cours(6 ,'6 - Endroits particuliers'),



  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,


      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
             icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .push(TransitionGauche(page: Accueil(1)));


            }),
        title:   Text(widget.titrePage),

        backgroundColor: Colors.lightGreen,

        shadowColor:Colors.transparent ,

        actions: <Widget>[ ],
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
            itemCount: _liste_voie_publique.length,
            itemBuilder: animationItemBuilder(
                  (index) => Animation_verticale_voie_publique(numero_section_vp: _liste_voie_publique[index].numero_section_vp ,nom_section_vp : _liste_voie_publique[index].nom_section_vp),
              padding: EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
      ),

    );

  }


}
