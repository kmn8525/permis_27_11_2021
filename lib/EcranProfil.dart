

import 'dart:async';
import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:permis/Constantes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Acceuil.dart';
import 'BouttonTheme.dart';
import 'Dessiner.dart';
import 'EcranProfilBilan.dart';
import 'EcranProfilExamen.dart';
import 'EcranProfilHistorique.dart';
import 'EcranProfilTheme.dart';
import 'TrasitionPages.dart';
import 'Utility.dart';


class EcranProfil extends StatefulWidget  {
  @override
  EcranProfilState createState() => EcranProfilState();

}

class EcranProfilState extends State<EcranProfil>  with ChangeNotifier , DiagnosticableTreeMixin ,   SingleTickerProviderStateMixin   {


  Future<File> imageFile;
  Image image;
  String cleNom = "n";
  String cleImage = "i";
  String newTaskTitle = 'Entrez Votre Nom';

  TabController _tabController;
  final List<String> _tabs = <String>['PROFIL', 'THEME' , 'HISTORIQUE' , 'EXAMEN'];
  final TextEditingController _controller_texte_saisi = TextEditingController();




  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging)
        // Tab Changed tapping on new tab
        print("${_tabController.index}");
      else if(_tabController.index != _tabController.previousIndex)
        // Tab Changed swiping to a new tab
        print("${_tabController.index}");
    });

    Utility.instance.getStringValue(cleNom)
        .then((value) => setState(() {
      newTaskTitle = value;


    }));


    chargerImageDisque();

  }


  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }


  String getcleImage(){
    return cleImage ;
  }




  String getcleNom(){
    return cleNom ;
  }




  prendreUneImage(ImageSource source) async {
    final _image = await ImagePicker.pickImage(source: source);

    if (_image != null) {
      setState(() {
        image = Image.file(_image);
      });
      Utility.saveImageToPrefs(
          Utility.base64String(_image.readAsBytesSync()));
    } else {
      print('Error picking image!');
    }
  }

  chargerImageDisque() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final imageKeyValue = prefs.getString(IMAGE_KEY);
    if (imageKeyValue != null) {
      final imageString = await Utility.loadImageFromPrefs();
      setState(() {
        image = Utility.imageFrom64BaseString(imageString);
      });
    }
  }





  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    double hauteur = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: _tabs.length, // This is the number of tabs.
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: kCouleurBody ,


        appBar: AppBar(
          centerTitle: true,
           automaticallyImplyLeading: false ,
         // toolbarHeight : 40 ,
       backgroundColor: Colors.lightBlue,
shadowColor:Colors.transparent ,

          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                  textTheme: TextTheme().apply(bodyColor: Colors.red),
                  dividerColor: Colors.black,
                  iconTheme: IconThemeData(color: Colors.white)),
              child: PopupMenuButton<int>(
                color: Colors.white,
                itemBuilder: (context) => [
                  PopupMenuItem<int>(value: 0, child: Text(
                      "Modifier ma photo" ,
                  style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black),

              )),
                  PopupMenuDivider(),
                  PopupMenuItem<int>(
                      value: 1, child: Text(
                      "Modifier mes informations" ,
                    style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black),


                  )),

                ],
                offset: Offset(0, 50),

                onSelected: (item) => SelectedItem(context, item),
              ),
            ),
          ],
        ),










        body: Stack(
          alignment :  AlignmentDirectional.bottomCenter,

          children:<Widget> [

             NestedScrollView(
                floatHeaderSlivers: true,

                physics: NeverScrollableScrollPhysics(),

                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  // These are the slivers that show up in the "outer" scroll view.
                  return <Widget>[
                    SliverOverlapAbsorber(

                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                      sliver: SliverAppBar(
                      automaticallyImplyLeading: false ,
                         pinned: true,
                        expandedHeight: 250,
                        collapsedHeight: 120,
                        flexibleSpace:   Stack(
                          children: <Widget>[

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,                         children:<Widget> [


                             /* Center(
                                  child: IconCaptureImage(context),
                              ),*/
                                KmnAvatar2() ,


                              Center(

                                  child: Container(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),

                                      child: Text(
                                      '$newTaskTitle',

                                      style: TextStyle(
                                        fontFamily: 'Spectral',
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w300,
                                      ),

                                    ),
                                  ),

                              ),
                            ],
                            ),

                          ],
                        ) ,
                        forceElevated: innerBoxIsScrolled,
                        backgroundColor: Colors.lightBlue ,
                        floating: true,


                        bottom:   TabBar(
                          controller: _tabController ,
                          tabs: <Widget>[



                            Tab(
                              icon: Icon(Icons.person),
                            ),
                            Tab(
                              icon: Icon(Icons.border_outer),
                            ),
                            Tab(
                              icon: Icon(Icons.history),
                            ),
                            Tab(
                              icon: Icon(Icons.timer),
                            ),
                          ],
                          labelPadding: EdgeInsets.all( 10),
                          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),

                          indicatorColor: Colors.white,
                          unselectedLabelColor: Colors.white60,
                          labelColor: Colors.white,
                         ),
                      ),
                    ),
                  ];
                },
                body:   TabBarView(
                  controller: _tabController,

                  children: <Widget>[
                    Center(

                      child: ProfilUtilisateur(),
                    ),
                    Center(
                      child: ProfiTheme(),
                    ),
                    Center(
                      child: ProfiHistorique(),
                    ),
                    Center(
                      child: ProfilExamen(),
                    ),
                  ],
                ),
              ),

            Container(
              child: Positioned(

                child: Stack(
                  alignment :  AlignmentDirectional.topCenter,
                  overflow: Overflow.visible,

                  children:<Widget> [
                    Container(

                      child: CustomPaint(
                        size: Size(screenSize.width, 80),
                        painter:  DessinBasBarNavigation(),
                      ),
                    ),
                    Center(
                      heightFactor: 0.6,
                      child: FloatingActionButton(
                          backgroundColor: Colors.orange,
                          child: Icon(Icons.close
                          ),
                          elevation: 0.1,
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true ).push(TransitionBas(

                                page :   Accueil(0 )));

                          }),
                    ),



                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }








  Widget buildCircle({
    Widget child,
    double all,
    Color color,
    BuildContext context ,

   }) =>
        ClipOval(
          child: Container(
            padding: EdgeInsets.all(all),
            color: color,
            child: child,
          ),

      );





  Widget KmnAvatar1 () {

    return CircularProfileAvatar(
      '',
      borderColor: Colors.white,
      borderWidth: 1,
      elevation: 5,
      radius: 50,
      child:  image ,

    );
  }
  Widget KmnAvatar2 () {

    return CircularProfileAvatar(
      '',
      borderColor: Colors.white,
      borderWidth: 1,
      elevation: 5,
      radius: 50,
      child: image == null ? KmnAvatar3() : KmnAvatar1() ,


    );
  }

  Widget KmnAvatar3 () {

    return CircularProfileAvatar(
      '',
      borderColor: Colors.white,
      borderWidth: 1,
      elevation: 5,
      radius: 50,
      child: Icon(
      Icons.camera_alt,
      color: Colors.grey[800],
    ),


    );
  }

  Widget _editionPhotoProfil(){

    return Container(

      padding: EdgeInsets.fromLTRB(100, 0, 0, 80),
      child: ClipOval(
        child: Material(
          color: Colors.white, // button color
          child: InkWell(
            splashColor: Colors.blue, // inkwell color
            child: SizedBox(width: 50, height: 50,
                child: Container(
                  width: 500,
                  height: 500,
                  //padding:EdgeInsets.symmetric(horizontal: 200) ,
                  child: Icon(


                      Icons.edit),
                )
            ),
            onTap: (){

            },
          ),
        ),
      ),


    );


  }



  Widget _constructeurImageProfil(BuildContext context) {
    return Center(
      child: Row(

        children: <Widget>[


          KmnAvatar2() ,


        ],
      ),
    ) ;
  }





  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        ChoixPhotoCamera();
        break;
      case 1:
        Editionprofil();
        break;

    }
  }

  void Effacertextesaisi(){

      _controller_texte_saisi.clear();
      setState(() {
        newTaskTitle =  'Entrez Votre Nom' ;
      });


  }
void Editionprofil(){
  showModalBottomSheet(

    context: context,
    isScrollControlled: true,
    builder: (context) => SingleChildScrollView(
      child:Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: EcranModifierNomProfil(context ),
      ),
    ) ,
  );
}
  void  ChoixPhotoCamera () {
    showModalBottomSheet (
        enableDrag: true,
        isScrollControlled: true,

        context: context,
        elevation: 10,
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),

          ),
        ),
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
           // height: MediaQuery.of(context).size.height * 0.50,

            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.camera),
                  title: new Text('Camera'),
                  onTap: () {
                    prendreUneImage(ImageSource.camera);
                    // this is how you dismiss the modal bottom sheet after making a choice
                    Navigator.pop(context);
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.image),
                  title: new Text('Gallery'),
                  onTap: () {
                    prendreUneImage(ImageSource.gallery);
                    // dismiss the modal sheet
                    Navigator.pop(context);
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.delete_forever),
                  title: new Text('Effacer la photo'),
                  onTap: () {
                    Utility.emptyPrefs();
                    setState(() {
                      image = null;
                    });
                    Navigator.pop(context);

                  },
                ),
              ],
            ),
          );
        });
  }
  Widget EcranModifierNomProfil(BuildContext context) {

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Entren Votre Nom',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(

              controller: _controller_texte_saisi,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                suffixIcon: _controller_texte_saisi.text.length == 0
                    ? null // Show nothing if the text field is empty
                    : IconButton(
                  icon: Icon(Icons.clear ,
                  color: Colors.black,
                  size: 10,),
                  onPressed: (){
                    Effacertextesaisi();
                  }
                ), // Show the clear button if the text field has something
              ),


              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            FlatButton(
              child: Text(
                'Valider',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                Utility.instance
                    .setStringValue(cleNom, newTaskTitle);
                Navigator.pop(context);
                notifyListeners();
              },

            ),
          ],
        ),
      ),
    );
  }





}









