import 'package:flutter/material.dart';

import 'Constantes.dart';
import 'Ecran_cour_voie_publique.dart';
import 'Ecran_la_chausse.dart';
import 'TrasitionPages.dart';



var tampon  ;
String CleTheme ;

class VerticalItem extends StatelessWidget {
  const VerticalItem({
    @required this.title,
    Key key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Container(
    height: 96,
    child: Card(
      child: Text(
        '$title a long title',
        style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
      ),
    ),
  );
}





/////////////////////////////////////////////////////////////////////
         ///// ------  EFFET ECRAN  ROUTE///////
/////////////////////////////////////////////////////////////////////


class Animation_verticale_voie_publique extends StatefulWidget {
     int numero_section_vp ;
     String nom_section_vp;

     Animation_verticale_voie_publique({Key key, this.numero_section_vp, this.nom_section_vp}) : super(key: key);

  @override
  Animation_verticale_voie_publiqueState createState() => Animation_verticale_voie_publiqueState();


}

class Animation_verticale_voie_publiqueState extends State<Animation_verticale_voie_publique> {




  @override
  void initState() {

    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return    GestureDetector(

      onTap: () {

        if  (widget.numero_section_vp == 1)

        {


          Navigator.of(context, rootNavigator: true ).push(TransitionDroit( page:
          Ecran_la_chausse(titrePage: '${ widget.nom_section_vp}'  )));


        }

        //  Navigator.push(context, SlideRightRoute(page: Screen2())),

      },

      child: Card(
        color: kCouleurBlancGeneral,
        elevation: 1.0,
        shadowColor : Colors.black ,
        margin: EdgeInsets.symmetric(vertical : 2 ,horizontal: 2),
        clipBehavior: Clip.antiAlias ,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
               Padding(
                  padding:  EdgeInsets.all(16.0),
                  child: Text(
                    '${widget.nom_section_vp}', style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),

                ),


             Padding(
                padding: const EdgeInsets.only(  right: 15),

                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.blueAccent ,
                  size: 15,
                ),
              ),

          ],
        ),
      ),

    );
  }
}



/////////////////////////////////////////////////////////////////////
              ///// ------  EFFET ECRAN EXAMEN///////
/////////////////////////////////////////////////////////////////////








/// Wrap Ui item with animation & padding
Widget Function(
    BuildContext context,
    int index,
    Animation<double> animation,
    ) animationItemBuilder(
    Widget Function(int index) child, {
      EdgeInsets padding = EdgeInsets.zero,
    }) =>
        (
        BuildContext context,
        int index,
        Animation<double> animation,
        ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child(index),
            ),
          ),
        );

Widget Function(
    BuildContext context,
    Animation<double> animation,
    ) animationBuilder(
    Widget child, {
      double xOffset = 0,
      EdgeInsets padding = EdgeInsets.zero,
    }) =>
        (
        BuildContext context,
        Animation<double> animation,
        ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(xOffset, 0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        );