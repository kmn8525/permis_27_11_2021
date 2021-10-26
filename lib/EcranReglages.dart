import 'package:flutter/material.dart';

import 'Acceuil.dart';
import 'Constantes.dart';
import 'TrasitionPages.dart';

class EcranReglages extends StatefulWidget {


   EcranReglages({Key key}) : super(key: key);

  @override
  _EcranReglagesState createState() => _EcranReglagesState();
}

class _EcranReglagesState extends State<EcranReglages> {
  String titrePage = "Reglage";

  final groupe_langue = ['Francais '];

  final icons_groupe_langue = [ Icons.map];
  final couleur_groupe_langue = [ Colors.blue];


  final groupe_partage = ['Aide un ami' , 'Groupe d\'entraide Facebook'];

  final icons_groupe_partage = [ Icons.share_rounded , Icons.facebook];
  final couleur_groupe_partage = [ Colors.purple, Colors.deepOrangeAccent];

  final groupe_droit = ['Mention legales' , 'FAQ' , 'Signaler un probleme' , ];

  final icons_groupe_droit = [ Icons.wysiwyg , Icons.info_outline , Icons.mail_outline ];
  final couleur_groupe_droit = [ Colors.lightGreen, Colors.red , Colors.blueGrey];

  final groupe_media = ['Son' , 'Mode sombre'  , ];

  final icons_groupe_media = [ Icons.volume_up_outlined , Icons.dark_mode  ];

  final couleur_groupe_media = [ Colors.amber, Colors.black12 , Colors.orange];


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      extendBody: true,

      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false ,
        title: Container(
          child: Center(
              child: Text("Reglage")),
        ),
        backgroundColor: Colors.lightBlue,
        shadowColor:Colors.transparent ,


      ),

        body: Container(
          color: Colors.white12,
          child: SingleChildScrollView(

            physics: ScrollPhysics(),
            child: Column(
              children: <Widget>[
                 Widget_groupe_langue() ,
                Widget_groupe_partage() ,
                Widget_groupe_droit(),
                Widget_groupe_media(),
              ],
            ),
          ),
        ),
    );
  }





   Widget  Widget_groupe_langue( ) {

    return    Container(

      margin: EdgeInsets.all(7),
             decoration: BoxDecoration(
              color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                    width: 1.0

                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0) //                 <--- border radius here
                ),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              padding: const EdgeInsets.all(1),
              itemCount: groupe_langue.length,
              itemBuilder: (BuildContext context, int index) {
                return Card( //
                  shadowColor: Colors.transparent,//                           <-- Card widget
                  child: ListTile(

                    leading: Container(
                    padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                shape: BoxShape.circle,

                color: couleur_groupe_langue[index],
                ) ,
                        child: Icon(

                            icons_groupe_langue[index] ,
                          color: Colors.white,
                        )
                    ),
                    title: Text(groupe_langue[index]),
                    trailing: Container(
                        padding: const EdgeInsets.only(  right: 8),

                        child: Icon(Icons.arrow_forward_ios_sharp ,
                          size: 10,
                          color: Colors.black,
                        )
                    ),
                    onTap: () {

                      if (groupe_langue[index] == 'bike' ) {
                        print('bike') ;
                      }
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(
               color: Colors.black,
                height:   2 ,
                indent: 65,
                endIndent: 30,
              ),
            ),


    );
  }

  Widget  Widget_groupe_partage( ) {

    return    Container(

      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.white ,
            width: 1.0
        ),
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
        ),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),

        padding: const EdgeInsets.all(1),
        itemCount: groupe_partage.length,
        itemBuilder: (BuildContext context, int index) {
          return Card( //
            shadowColor: Colors.transparent,//                           <-- Card widget
            child: ListTile(
              leading: Container(
              padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: couleur_groupe_partage[index],

          ),

                  child: Icon(icons_groupe_partage[index] ,
                      color : Colors.white ,
                  )
              ),
              title: Text(groupe_partage[index]),
              trailing: Container(
                  padding: const EdgeInsets.only(  right: 8),

                  child: Icon(Icons.arrow_forward_ios_sharp ,
                    size: 10,
                    color: Colors.black,
                  )
              ),
              onTap: () {

                if (groupe_partage[index] == 'bike' ) {
                  print('bike') ;
                }
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.black,
          height:   2 ,
          indent: 65,
          endIndent: 30,
        ),
      ),


    );
  }
  Widget  Widget_groupe_droit( ) {

    return    Container(

      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Colors.white ,
            width: 1.0
        ),
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
        ),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),

        padding: const EdgeInsets.all(1),
        itemCount: groupe_droit.length,
        itemBuilder: (BuildContext context, int index) {
          return Card( //
            shadowColor: Colors.transparent,//                           <-- Card widget
            child: ListTile(
              leading: Container(
              padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: couleur_groupe_droit[index],
          ),
                  child: Icon(icons_groupe_droit[index] ,
                    color: Colors.white,
                  )
              ),
              title: Text(groupe_droit[index]),
              trailing: Container(
                  padding: const EdgeInsets.only(  right: 8),

                  child: Icon(Icons.arrow_forward_ios_sharp ,
                    size: 10,
                    color: Colors.black,
                  )
              ),
              onTap: () {

                if (groupe_droit[index] == 'bike' ) {
                  print('bike') ;
                }
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.black,
          height:   2 ,
          indent: 65,
          endIndent: 30,
        ),
      ),


    );
  }





  Widget  Widget_groupe_media( ) {

    return    Container(

      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Colors.white ,
            width: 1.0
        ),
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
        ),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),

        padding: const EdgeInsets.all(1),
        itemCount: groupe_media.length,
        itemBuilder: (BuildContext context, int index) {
          return Card( //
            shadowColor: Colors.transparent,//                           <-- Card widget
            child: ListTile(
              leading: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: couleur_groupe_media[index],
                  ),
                  child: Icon(icons_groupe_media[index],
                  color: Colors.white),
              ),
              title: Text(groupe_media[index]),
              trailing: Container(
                  padding: const EdgeInsets.only(  right: 8),

                  child: Icon(Icons.arrow_forward_ios_sharp ,
                    size: 10,
                    color: Colors.black,
                  )
              ),
              onTap: () {

                if (groupe_media[index] == 'bike' ) {
                  print('bike') ;
                }
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.black,
          height:   2 ,
          indent: 65,
          endIndent: 30,
        ),
      ),


    );
  }


}
