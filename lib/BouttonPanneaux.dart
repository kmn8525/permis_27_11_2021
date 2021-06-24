import 'package:flutter/material.dart';
import 'BouttonTheme.dart';
import 'Constantes.dart';


class BoutonPanneaux extends StatelessWidget {
  BoutonPanneaux(
      {@required this.couleur, @required this.WidgetEnfant, this.apuyer, this.hauteur, this.largeur});

  final Color couleur;

  final Widget WidgetEnfant;

  final Function apuyer;
  final double  hauteur ;
  final double  largeur ;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: apuyer,
      child: Container(
        child: WidgetEnfant,
        margin: EdgeInsets.all(7),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
          color: couleur,
          boxShadow: [
            BoxShadow(
              color: kBoutonDegrade,
              offset: Offset(0, 1),
              blurRadius: 1,
            ),
          ],
        ),
        height: hauteur,
        width: largeur,
      ),
    );
  }
}
