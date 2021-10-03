 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:permis/EcranProfil.dart';
import 'package:permis/resultat/resultatDefinition.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

import 'Acceuil.dart';
import 'Constantes.dart';
import 'EcranQuestions.dart';
import 'EcranResultats.dart';
import 'ListeConducteurPassager.dart';
import 'ListeDefinition.dart';
import 'ListeFavoris.dart';
import 'NomProfil.dart';




/*Future<void> loadPictures() async {
  await precachePicture(
    ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/graphic/two_people.svg'),
    context,
  ); //here context can also be null
}*/

/*
void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);
*/

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  /*await precachePicture(
    ExactAssetPicture( SvgPicture.svgStringDecoder, 'assets/iconTheme/accident.svg'),
    null,
  );
  await precachePicture(
    ExactAssetPicture( SvgPicture.svgStringDecoder, 'assets/iconTheme/accident.svg'),
    null,
  );

  precachePicture(
    ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/ampoule.svg'),
    null,
  );


  await precachePicture(
    ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/auto_route.svg'),
    null,
  );
  await precachePicture(
    ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/autoroute.svg'),
    null,
  );
  await precachePicture(
    ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/battery.svg'),
    null,
  );
  await precachePicture(
    ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/bicycle.svg'),
    null,
  );

  await precachePicture(
    ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/battery.svg'),
    null,
  );
  await precachePicture(
    ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/boite_manuel.svg'),
    null,
  );

  await precachePicture(
    ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/bousole.svg'),
    null,
  );
  await precachePicture(
    ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/chantier.svg'),
    null,
  );
  await precachePicture(
    ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/conducteur.svg'),
    null,
  );
  await precachePicture(
    ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/danger.svg'),
    null,
  );
  await  precachePicture(
    ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/depacement.svg'),
    null,
  ) ;


  await  precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/direction.svg'),
      null,
    );
    precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/disk.svg'),
      null,
    );
  await  precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/ecologie.svg'),
      null,
    );
  await  precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/escargot.svg'),
      null,
    );
  await   precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/feuxControl.svg'),
      null,
    ) ;
    precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/garer.svg'),
      null,
    );
  await
  precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/informations.svg'),
      null,
    );
  await
  precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/interdictions.svg'),
      null,
    );
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/lieu.svg'),
      null,
    );
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/mainvolant.svg'),
      null,
    );
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/paint.svg'),
      null,
    );
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/parking.svg'),
      null,
    );
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/parkings.svg'),
      null,
    ) ;
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/parking1.svg'),
      null,
    );
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/pas_alcool.svg'),
      null,
    );
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/pieton.svg'),
      null,
    );
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/pietons.svg'),
      null,
    ) ;
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/policiere.svg'),
      null,
    );
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/priorite.svg'),
      null,
    );
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/priorites.svg'),
      null,
    );
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/stop.svg'),
      null,
    );
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/stops.svg'),
      null,
    );
  await  precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/stopss.svg'),
      null,
    );
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/test.svg'),
      null,
    );
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/train4.svg'),
      null,
    );
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/vest.svg'),
      null,
    );
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/vitesse.svg'),
      null,
    ) ;
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/iconTheme/warning.svg'),
      null,
    );
*/




  runApp(

      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NomProfil()),
          ChangeNotifierProvider(create: (_) => EcranResultatState()),
          ChangeNotifierProvider(create: (_) => ResultatDefinition()),
          ChangeNotifierProvider(create: (_) => Definition.C2()),
          ChangeNotifierProvider(create: (_) => ConducteurPassager.C2()),
          ChangeNotifierProvider(create: (_) => EcranQuestionsState()),
          ChangeNotifierProvider(create: (_) => EcranProfilState()),
          ChangeNotifierProvider(create: (_) => FavorisState()),


        ] ,
        child:  MaterialApp(

          theme: ThemeData(
            primaryColor: kCouleurBlancGeneral,
            scaffoldBackgroundColor: kCouleurBody,
            accentColor: Colors.blue,
          ),

          home: Accueil(0),

        ) ,


      ),

    );


}



