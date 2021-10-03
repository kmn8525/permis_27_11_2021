import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TutorialCoachMark Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = List();

  GlobalKey keyButton = GlobalKey();
  GlobalKey keyButton1 = GlobalKey();
  GlobalKey keyButton2 = GlobalKey();
  GlobalKey keyButton3 = GlobalKey();
  GlobalKey keyButton4 = GlobalKey();
  GlobalKey keyButton5 = GlobalKey();

  String tmp = "null" ;
  String text5 = " ";
  int tailleList = 0 ;
  bool  viskey3 = true ;

  @override
  void initState() {

    initTargets();

    showTutorial();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          PopupMenuButton(
            key: keyButton1,
            icon: Icon(Icons.view_list, color: Colors.white),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Is this"),
              ),
              PopupMenuItem(
                child: Text("What"),
              ),
              PopupMenuItem(
                child: Text("You Want?"),
              ),
            ],
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Visibility(

              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    key: keyButton,
                    color: Colors.blue,
                    height: 100,
                    width: MediaQuery.of(context).size.width - 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        color: Colors.blueAccent,
                        child: Icon(Icons.remove_red_eye),
                        onPressed: () {

                          showTutorial();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),


            Visibility(
              child: Positioned(
                left : 50 ,
                top : 50 ,
                right : 20 ,
                // bottom: 5,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: SizedBox(
                    width: 100,
                    height: 50,
                    child: RaisedButton(
                      key: keyButton3,
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: true,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: SizedBox(
                    width: 150,
                    height: 100,
                    child: RaisedButton(
                      key: keyButton4,
                      onPressed: () {

                      },
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: true,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: RaisedButton(
                      key: keyButton5,
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void initTargets() {
    targets.add(
      TargetFocus(
        enableOverlayTab : true ,

        identify: "Target 0",
        keyTarget: keyButton1,
        contents: [
          TargetContent(
              align: ContentAlign.bottom,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "kkkkkkk",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "dddd.",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
    targets.add(TargetFocus(
      enableOverlayTab : true ,

      identify: "4",
      keyTarget: keyButton3,
      contents: [
        TargetContent(
            align: ContentAlign.top,
            child: Container(
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {


                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(
                        "https://juststickers.in/wp-content/uploads/2019/01/flutter.png",
                        height: 200,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "Image Load network",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ))
      ],
      shape: ShapeLightFocus.Circle,
    ));

    targets.add(
      TargetFocus(
        enableOverlayTab : true ,

        identify: "1",
        keyTarget: keyButton,
        color: Colors.purple,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "martial",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Noel.",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 25,
      ),
    );
    targets.add(
        TargetFocus(
          enableOverlayTab : true ,

          identify: "2",
          keyTarget: keyButton4,
          contents: [
            TargetContent(
                align: ContentAlign.left,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "$text5",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )),
            TargetContent(
                align: ContentAlign.top,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Multiples content",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ))
          ],
          shape: ShapeLightFocus.Circle,
        ));
    targets.add(TargetFocus(
      enableOverlayTab : true ,

      identify: "3",
      keyTarget: keyButton5,
      contents: [
        TargetContent(
            align: ContentAlign.right,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "$text5",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ))
      ],

      shape: ShapeLightFocus.RRect,
      radius: 25,
      paddingFocus : 70 ,
    ));
    targets.add(
        TargetFocus(
          enableOverlayTab : true ,
          identify: "5",
          keyTarget: keyButton2,
          contents: [
            TargetContent(
                align: ContentAlign.top,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "Martial ",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),

                    ],
                  ),
                )),
            TargetContent(
                align: ContentAlign.bottom,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "salut",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),

                  ],
                ))
          ],
          shape: ShapeLightFocus.Circle,
        ));
  }

  void showTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      context,
      targets: targets,
      // colorShadow: Color(0xff343A40),
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.5,
      onFinish: () {
        print("finish");
        setState(() {
          tailleList = 0 ;
        });
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onSkip: () {
        setState(() {
          tailleList = 0 ;
        });
      },
      onClickOverlay: (target) {




        if (  (targets[tailleList].identify) == "2") {

          print('taille de deux ');
          setState(() {
            text5 = "peut mieux faire" ;
          });


        }
        else {

          tailleList++ ;

        }



        /* keyButton5 == null ;
        print( ' keyButton4') ;
        print(  GlobalKey);*/
      },
    )..show();
  }
}


