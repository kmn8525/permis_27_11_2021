import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'Option.dart';
import 'Question.dart';
import 'AnimerQuestion.dart';



 class Definition    with  ChangeNotifier , DiagnosticableTreeMixin {


   int _numeroQuestion  = 0 ;
   int _numeroChoix = 0  ;
   String _cleListeQuestionDefinitionSauvegarder = "qDef";
   bool serieFini = false;
   int total_point = 0;
   int NbBonneReponse = 0;
   int NbMauvaiseReponse = 0;
   int NbQuestionRepondu = 0;
   Color commencer = Colors.black;
   Color enCours = Colors.lightBlue;

     Definition.C1(int a) {
     _numeroQuestion = a ;
     _numeroChoix = a ;
    }


   Definition.C2( );




   List<Question> _listeQuestionSauvegarder  = [];
   List<Question> _listeQuestionTampon  = [];



   List<Question> _listeQuestionDefinition = [
     Question(1, 'Cette partie est  : ', false, false, true, false,
         ' partie de la voie publique réservée aux cyclistes et cyclomotoristes classe A . ',
          1 , 'imageDefinition', 1 ,

       Option( 'Un baccotement en saillie  ', ' Un accotement de plain pied',
           'Une piste cyclable'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,
     ),
     Question(
         2 , 'Je peux emprunter la bande bus pour effectuer un dépassement : ',
         false,
       true,
         false,
         false,
         'La bande « bus ». lorsqu’elle est à gauche, ne peut être utilisée que pour tourner à gauche au prochain carrefour, pas pour dépasser.',
         1 ,
         'imageDefinition' ,
         2 ,

       Option( 'Oui', 'Non', 'null'),

       AnimerQuestion ("imageDefinition",
         5 , true , "Bande de circulation réservée aux BUS : délimitée par de larges traits blancs discontinus, le mot BUS" , 100 , 10 , 80 , 500 , 70 ,100 ,
         6 , true , "et  délimitée par le signal F17 répétés après chaque carrefour. " ,250 , 50 , 0  , 60 , 60 ,60 ,
         6 , true , "exclusivement réservée aux véhicules des Services Publics réguliers de transport en commun (donc pas aux autocars), ainsi qu'aux cars de ramassage scolaire ." ,250 , 50 , 0  , 60 , 60 ,60 ,
         6 , true , "accessible aux véhicules prioritaires, aux taxis et à tous les véhicules dont le symbole est repris sur le signal F17 ou sur un panneau additionnel, ainsi que pour contourner un obstacle en chaussée. Lorsque les cyclomoteurs y sont admis, ils doivent circuler l'un derrière l'autre." ,250 , 50 , 0  , 60 , 60 ,60 ,
         6 , true , "peut être traversée pour accéder à ou quitter un emplacement de stationnement situé le long de la bande bus ou une propriété riveraine et dans les carrefours" ,250 , 50 , 0  , 60 , 60 ,60 ,
       ) ,

     ),
     Question(
         3 , 'Je peut dépasser le cycliste sur ce ralentisseur de trafic',
         false,
         true,
         false,
         false,
         'tous les dépassement sont interdits sur un ralentisseur de trafic  ',
         1 ,
         'imageDefinition' ,
     3 ,

       Option(  'oui en m\'écartant suffisamment ', ' Non', 'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,


     ),
     Question(
         4  , 'Cette piste cyclable fait partie de la chaussée',
       true,
         false,
         false,
         false,
         ' On parle parfois de piste cyclable suggérée',
         1 ,
         'imageDefinition' ,
         4 ,

       Option( 'Oui', 'non', 'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,


     ),
     Question(
       5 , ' En abordant ce carrefour, je suis obligé de marquer l’arrêt : ',
       true,
       false,
       false,
       false,
       ' Vous devez toujours vous immobiliser lorsqu\'il y a un signal « Stop ». et ensuite céder le passage.',
       1 ,
       'imageDefinition' ,
       11 ,

       Option( 'Oui, toujours', 'Oui, sauf si je vois parfaitement que personne n’arrive', 'Non'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),

     /*
      Question(
         6  , ' le vehicule qui me precede reste au milieu de la chaussée , je peut le depasser par la droite   ',
         true,
         false,
         null,
         false,
         'le depassement s\'effectue par la gauche',
         1 ,
         'imageDefinition' ,
         6 ,

       Option( 'oui', 'non', 'null'),
       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,


     ),


     Question(
         7 , ' je peut tourner a droite a ce carrefour',
         true,
         false,
         null,
         false,
         ' On parle parfois de piste cyclable suggérée',
         1 ,
         'imageDefinition' ,
         7,

       Option( 'oui', 'non', 'null'),
       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),

   Question(
       8  , 'Cette partie est : ',
       true,
       false,
       null,
       false,
       ' La voie publique' , 1 ,
       'imageDefinition' ,
       8,

       Option(  'La voie publique', 'La chaussée', 'La bande de circulation'),
       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       9 , 'Ce parking est considéré comme ',
       true,
       false,
       null,
       false,
       'Lieu  publique  ',
       1 ,
       'imageDefinition' ,
       9,

       Option( 'Voie publique', 'Lieu public', 'la Chaussée'),
       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,


     ),
     Question(
       10 , 'Le signal additionnel est valable pour : ',
       false,
       true,
       null,
       false,
       ' La voie publique',
       1 ,
       'imageDefinition' ,
       10 ,

       Option( 'Les deux signaux routiers', ' Seulement le signal du bas ', 'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),

     Question(
         11 , '  en contournant ce camion a l\'arret , j\'effectue un A depassement  ',
         true,
         false,
         null,
         false,
         ' vous pouvez',
         1 ,
         'imageDefinition' ,
         5 ,

       Option( 'oui', 'non', 'null'),
       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,


     ),

     Question(
       12 , 'Le signal d’interdiction est valable : ',
       true,
       false,
       false,
       false,
       'Seulement sur la chaussée centrale Lorsque vous circulez sur la chaussée latérale, le signal se trouve à votre gauche, et ne vous concerne donc pas.',
       1 ,
       'imageDefinition' ,
       12 ,

       Option( 'Sur la chaussée centrale', ' Sur la chaussée latérale', 'Sur les deux chaussées'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       13 , 'La limitation de vitesse est valable : ',
       true,
       false,
       false,
       false,
       'Les signaux d\'interdiction sont valables du signal jusqu\'au prochain carrefour. La fin de l\'interdiction n\'est pas signalée systématiquement',
       1 ,
       'imageDefinition' ,
       13 ,

       Option( 'Jusqu’au prochain carrefour', 'Pendant 150 mètres', 'Il y a toujours un signal indiquant la fin de la limitation'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       14 , 'La limitation de vitesse à 30 km/h est valable : ',
       false,
       true,
       null,
       false,
       'Lorsque le signal d interdiction est placé dans un signal de Zone, sa validité '
           's\'étend dans toute la zone. Un autre signal indiquera la fin de la zone.',
       1 ,
       'imageDefinition' ,
       14 ,

       Option( 'Jusqu’au prochain carrefour', 'Jusqu’au signal indiquant la fin de la zone', 'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       15 , 'Ce signal routier signifie : ',
       true,
       false,
       false,
       false,
       ' Ce signal indique la fin de l\'interdiction.',
       1 ,
       'imageDefinition' ,
       15 ,

       Option( 'Interdiction de circuler à plus de 40 km/h', 'Fin d\’interdiction de circuler à plus de 40 km/h', 'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       16 , 'Le signal de forme ronde signifie: ',
       true,
       false,
       false,
       false,
       'Définition du signal: sens interdit pour tout conducteur.',
       1 ,
       'imageDefinition' ,
       16 ,

       Option( 'Sens interdit pour tout conducteur', 'Sens unique', 'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       17 , 'Je peux continuer tout droit  : ',
       true,
       false,
       false,
       false,
       'Définition du signal: accès interdit dans les deux sens à tout conducteur.',
       1 ,
       'imageDefinition' ,
       17 ,

       Option( 'Oui, mais seulement lorsque j’habite dans cette rue', 'Non', 'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       18 , 'Ce signal interdit l’accès : ',
       false,
       false,
       true,
       false,
       'Définition du signal: accès interdit aux véhicules à '
           'moteur à plus de deux roues et aux motocyclettes avec side-car',
       1 ,
       'imageDefinition' ,
       18 ,

       Option( 'Aux voitures uniquement', 'A tous les véhicules à moteur', 'Aux véhicules à moteur à plus de 2 roues'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       19 , 'Le signal bordé de rouge m’interdit notamment de dépasser ',
       false,
       true,
       false,
       false,
       'Définition du signal: interdiction pour tout conducteur de dépasser par la gauche un véhicule attelé ou un véhicule à plus de deux roues',
       1 ,
       'imageDefinition' ,
       19 ,

       Option( 'Une motocyclette', 'Un camion', 'Je ne suis pas concerné parce signal'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),

     Question(
       20 , 'Cette  partie est    : ',
       true,
       false,
       false,
       false,
       ' La voie publique',
       1 ,
       'imageDefinition' ,
       20 ,

       Option( 'La voie publique', ' La chaussée', 'La bande de circulation'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       21 , 'Je peux emprunter cette rue pour y stationner: ',
       true,
       false,
       false,
       false,
       'Cette rue est réservée aux riverains et à leurs visiteurs.',
       1 ,
       'imageDefinition' ,
       21 ,

       Option( 'Oui', 'Non', 'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       22 , 'Je désire virer à droite au prochain carrefour. La signalisation  : ',
       true,
       false,
       false,
       false,
       'Signal D3 : Obligation de suivre une des directions indiquées par les flèches (tout droit ou à gauche).',
       1 ,
       'imageDefinition' ,
       22 ,

       Option( 'l\'interdit', 'le permet', 'm\'oblige à aller tout droit'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       23 ,
       'Sur la piste cyclable que j\'aborde immédiatement après ce signal, des cyclistes ou cyclomotoristes peuvent se présenter à droite : ',
       true,
       false,
       false,
       false,
       'Signal B1 : Céder le passage + M10 : Panneau additionnel complétant le signal B1 pour indiquer que des cyclistes et des cyclomotoristes circulent dans les deux directions sur la voie publique transversale que vous allez aborder.',
       1 ,
       'imageDefinition' ,
       23 ,

       Option( 'Oui', 'Non', 'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       24 , 'Je suis autorisé à franchir ce carrefour, mais je dois auparavant marquer l\'arrêt à hauteur du signal STOP : ',
       true,
       false,
       false,
       false,
       'Le feu vert prévaut sur la signalisation de priorité.',
       1 ,
       'imageDefinition' ,
       24 ,

       Option( 'Oui', 'oui, et je dois céder le passage à droite et à gauche', 'non, je peux m\'engager sans m\'arrêter ni céder le passage'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       25 , 'Je bénéficie de la priorité sur la voiture grise : ',
       false,
       true,
       false,
       false,
       'Dans ce carrefour, vous devez céder le passage à droite, et donc laisser passer la voiture grise.',
       1 ,
       'imageDefinition' ,
       25 ,

       Option( 'Oui', 'Non', 'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       26 , 'Le code de la route s’applique sur ce chemin  : ',
       true,
       false,
       false,
       false,
       ' La voie publique',
       1 ,
       'imageDefinition' ,
       26 ,

       Option( 'Oui', 'Non', 'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       27 , 'Ce signal indique : ',
       true,
       false,
       false,
       false,
       'Signal F43 : signal de localité.',
       1 ,
       'imageDefinition' ,
       27 ,

       Option( 'une localité', 'une agglomération', 'un lieu touristique'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       28 , 'Je peut continuer tout droit   : ',
       true,
       false,
       null,
       null,
       ' Le panneau additionnel vous indique que l\'interdiction ne commence que dans 120 mètres environ .' ,
       1 ,
       'imageDefinition' ,
       28 ,

       Option( 'oui', 'non', 'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       29 , 'En abordant ce carrefour, je suis obligé de marquer l’arrêt : ',
       true,
       false,
       false,
       false,
       'Vous devez toujours vous immobiliser lorsqu\'il y a un signal « Stop », et ensuite céder le passage.',
       1 ,
       'imageDefinition' ,
       29 ,

       Option( 'Oui, toujours', 'Oui, sauf si je vois parfaitement que personne n’arrive', 'Non'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       30 , 'Cette bande rouge fait partie de la chaussée: ',
       true,
       false,
       false,
       false,
       'On parle parfois de piste cyclable suggérée',
       1 ,
       'imageDefinition' ,
       30 ,

       Option( 'Oui', ' Non', 'Non, c’est une piste cyclable'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       31 , 'Cette  partie est    : ',
       true,
       false,
       false,
       false,
       ' La voie publique',
       1 ,
       'imageDefinition' ,
       31 ,

       Option( 'La voie publique', ' La chaussée', 'La bande de circulation'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       32 , 'Je désire dépasser le cycliste dans le carrefour: ',
       true,
       false,
       false,
       false,
       'Seul le dépassement d\'un véhicule « large ». d\'une moto ou d\'un cyclo est interdit dans un carrefour non protégé par un agent, un feu vert ou un signal de priorité. Vous pouvez cependant dépasser un cycliste.',
       1 ,
       'imageDefinition' ,
       32 ,

       Option( 'C’est autorisé', 'C’est interdit', 'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       33 , 'A ce carrefour, les feux lumineux sont éteints : ',
       false,
       true,
       false,
       false,
       'Lorsque les feux sont éteints, les signaux relatifs à la priorité reprennent toute leur valeur.',
       1 ,
       'imageDefinition' ,
       33 ,

       Option( 'je dois céder le passage à droite', 'je dois céder le passage à droite et à gauche', 'les autres doivent me céder le passage'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       34 , 'Des travaux entravent ma progression. La signalisation m\'autorise à m\'engager :   ',
       true,
       false,
       false,
       false,
       'Les signaux lumineux l\'emportent sur les signaux routiers. Le feu vert m\'autorise donc à m\'engager sans '
           'avoir à céder le passage aux conducteurs en sens inverse (qui sont arrêtés par un feu rouge).',
       1 ,
       'imageDefinition' ,
       34 ,

       Option( 'Oui', 'oui, en cédant le passage aux conducteurs venant en sens inverse', 'Non'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       35 , 'Je dois attendre que le feu soit vert pour virer à droite : ',
       true,
       false,
       false,
       false,
       'Vous pouvez virer sans tenir compte du feu rouge puisqu\'il ne se trouve pas à votre droite. Il ne concerne que les conducteurs qui poursuivent tout droit.',
       1 ,
       'imageDefinition' ,
       35 ,

       Option( 'Oui', 'Non', 'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       36 , 'Le signal additionnel à fond bleu indique : ',
       false,
       true,
       false,
       false,
       'Ce signal additionnel indique le tracé de la voie prioritaire.',
       1 ,
       'imageDefinition' ,
       36 ,

       Option( 'Une obligation de tourner', 'Le tracé de la voie prioritaire', 'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       37 , 'Je désire dépasser ce véhicule rouge qui me précède: ',
       false,
       false,
       true,
       false,
       'Vous ne pouvez pas dépasser par la gauche un véhicule « large ». une moto du un cyclo dans un virage sans visibilité. Le dépassement par la droite est Bien entendu également interdit.',
       1 ,
       'imageDefinition' ,
       37 ,

       Option( 'C\'est autorisé par la gauche', 'C\'est autorisé par la droite',  ' C\'est interdit'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       38 , 'Devant ce signal dont le bord inférieur est à moins de 2 m du sol  : ',
       false,
       false,
       true,
       false,
       'Interdiction d\'arrêt et de stationnement à moins de 20 m des "petits" signaux routiers.',
       1 ,
       'imageDefinition' ,
       38 ,

       Option( ' je peux m\'arrêter sur la chaussée', ' je peux m\'arrêter sur l\'accotement',
           'je ne peux ni m\'arrêter, ni stationner'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       39 , 'Cette signalisation indique :',
       false,
       true,
       false,
       false,
       'Signal F19 : Voie publique à sens unique + M5 : Panneau additionnel complétant le signal F19 lorsque les cyclistes et cyclomotoristes classe A peuvent circuler dans les deux sens.',
       1 ,
       'imageDefinition' ,
       39 ,

       Option( 'un itinéraire conseillé aux 2 roues', 'un sens unique, sauf pour les 2 roues', 'une obligation d\'aller tout droit, sauf pour les 2 roues'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       40 , 'Le dépassement d\'une voiture à hauteur d\'un passage pour piéton est : ',
       true,
       false,
       false,
       false,
       'Le dépassement d\'un véhicule « large ». d\'une moto ou d\'un cyclo est interdit devant un passage pour piétons ou pour 2 roues.',
       1 ,
       'imageDefinition' ,
       40 ,

       Option( 'Autorisé à allure réduite', 'Autorisé à 50 km/h maximum', 'Interdit'),

       AnimerQuestion ('imageDefinition',
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       41 , 'Je range mon véhicule à l\'arrêt dans cette zone. Je dois apposer mon disque de stationnement : ',
       false,
       true,
       false,
       false,
       'Cette signalisation règle le stationnement, pas l\'arrêt ! ',
       1 ,
       'imageDefinition' ,
       41 ,

       Option( 'Oui', 'Non', 'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       42 , 'Nous sommes le 10 du mois. Dans toute l\'agglomération, ce signal : ',
       true,
       false,
       false,
       false,
       'Signaux E11 + F1 : Stationnement semi-mensuel dans toute l\'agglomération, autorisé du 1er au 15 du côté des immeubles impairs.',
       1 ,
       'imageDefinition' ,
       42 ,

       Option( 'm\'interdit de stationner à gauche', 'm\'interdit de stationner du côté des immeubles à numéros impairs',
           'm\'autorise à stationner du côté des immeubles à numéros impairs'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       43 , 'Comment s’appelle cette voie publique ?  ',
       false,
       true,
       false,
       false,
       'une voie publique sans chaussée',
       1 ,
       'imageDefinition' ,
       43 ,

       Option( 'Un sentier', 'Un chemin de terre',
           'Une voie agricole'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       44 , 'Ce signal de danger m\'annonce ?  ',
       true,
       false,
       false,
       false,
       'Signal A43 : Passage à niveau sans barrières à la distance'
           ' annoncée (15 m) + signal A45 : Passage à niveau à voie unique à proximité immédiate.',
       1 ,
       'imageDefinition' ,
       44 ,

       Option( 'un passage à niveau à voie unique', 'un passage à niveau à 2 ou plusieurs voies',
           'un passage à niveau à plus de 2 voies'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       45 , 'Ce signal de danger m\'annonce ?  ',
       false,
       true,
       false,
       false,
       'Signal A47 : Passage à niveau à deux ou plusieurs voies à proximité immédiate.',
       1 ,
       'imageDefinition' ,
       45 ,

       Option( 'un passage à niveau à voie unique', 'un passage à niveau à 2 ou plusieurs voies',
           'un passage à niveau à plus de 2 voies'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       46 , 'Ce signal interdit l\'accès de cette bande de circulation aux conducteurs de véhicules dont :  ',
       false,
       true,
       false,
       false,
       'Signalisation : songez que c\'est la masse en charge et non la MMA qui risque de faire crouler un pont peu solide !',
       1 ,
       'imageDefinition' ,
       46 ,

       Option( 'le chargement dépasse 5 tonnes', 'la masse en charge dépasse 5 tonnes',
           'la masse maximale autorisée dépasse 5 tonnes'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       47 , 'Cette signalisation limite la vitesse sur :',
       false,
       false,
       false,
       true,
'Signalisation : limitation de la portée des signaux routiers.'   ,
       1 ,
       'imageDefinition' ,
       47 ,

       Option( 'la bande de droite de l\'autoroute', 'la bande d\'arrêt d\'urgence',
           'la bretelle de sortie'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       48 , 'Ce feu jaune-orange clignote :',
       false,
       true,
       false,
       true,
       'Le feu jaune-orange clignotant = autorisation de franchir, en redoublant de prudence et en respectant les règles de priorité.'   ,
       1 ,
       'imageDefinition' ,
       48 ,

       Option( 'il m\'autorise à m\'engager dans le carrefour et m\'accorde la priorité', 'il m\'autorise à m\'engager dans le carrefour mais ne modifie pas les règles de priorité en vigueur',
           'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       49 ,
       'Les feux jaune-orange clignotants sont allumés : ',
       false,
       true,
       false,
       true,
       'Le feu jaune-orange clignotant ne modifie pas les règles de priorité. Vous devez donc respecter le signal « Stop ».'   ,
       1 ,
       'imageDefinition' ,
       49 ,

       Option( 'J’ai priorité', 'Je respecte la priorité de droite',
           'Je respecte les signaux de priorité'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     Question(
       50 ,
       'Je peux continuer tout droit :  ',
       true,
       false,
       false,
       true,
       'Cette injonction est équivalente au feu vert; l\'agent ouvre le carrefour'   ,
       1 ,
       'imageDefinition' ,
       50 ,

       Option( 'Oui', 'Non',
           'null'),

       AnimerQuestion ("imageDefinition",
         1 , true , "partie de la voie publique, sur la quelle les bicyclettes et les cyclomoteurs classe A doivent circuler. " , 100 , 10 , 80 , 500 , 70 ,100 ,
         2 , true , " Une piste cyclable est indiquée par: soit le signal d’obligation D7" ,50 , 140 , 100  , 250 , 50 ,50 ,
         3 , true , " soit indiquée par le signal d’obligation D9" , 150 , 140 , 60 , 250 , 50  , 50 ,
         4 , true ,"soit indiquée par le signal d’obligation D10 ", 250 , 140 , 60  ,  250 , 50  , 50  ,
         0 , false , "null" , 0 , 0 , 0 , 0 , 0  , 0 ,
       ) ,

     ),
     */

   ];


   int get numeroQuestion => _numeroQuestion;

   String get getCleNumQueDef =>  _cleListeQuestionDefinitionSauvegarder ;

   int get getNumQueDef =>  _numeroQuestion ;

   int get getNumChoDef =>  _numeroChoix ;

   int get  getTotalPoint => getTaille() ;

   int get   getNbBonneReponse => NbBonneReponse ;

   int get  getNbMauvaiseReponse => NbMauvaiseReponse ;

   int get  getNbQuestionRepondu => NbQuestionRepondu ;



   set totalPoint(int value) {
     total_point = value;
   }


   set  setNbBonneReponse(int value) {
     NbBonneReponse = value;
   }

   set setNbMauvaiseReponse(int value) {
     NbMauvaiseReponse = value;
   }

   set setNbQuestionRepondu(int value) {
     NbQuestionRepondu = value;
   }


   double moyenne_de_bonne_reponse (){



   }

   double moyenne_de_mauvaise_reponse (){



   }

   double moyenne_de_reponse_repondu (){



   }

   /////////////////////////////////////////////////////////////////////
   ///// ---------------   LISTE DES FONCTIONS POUR LES  ANIMATIONS -------------- /////////
   /////////////////////////////////////////////////////////////////////

   String getCheminImageAnimations() {
     return _listeQuestionDefinition[_numeroQuestion].animationquestion.cheminImageAnimations;
   }

   int  getNumeroImageA() {
     return _listeQuestionDefinition[_numeroQuestion].animationquestion.numeroImageA;
   }


   bool   getVisibiliteA() {
     return _listeQuestionDefinition[_numeroQuestion].animationquestion.visibiliteA;
   }


   String getDescriptionA() {
     return _listeQuestionDefinition[_numeroQuestion].animationquestion.DescriptionA;
   }


   double getPositionGaucheA() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionGaucheA;

   }

   double getPositionHautA() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionHautA;

   }

   double getPositionDroiteA() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionDroiteA;

   }

   double getPositionBasA() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionBasA;

   }

   double getHauteurA () {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.hauteurA;

   }


   double getLargeurA () {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.largeurA;

   }


         ///// *******************    B  *******************  /////////



   int  getNumeroImageB() {
     return _listeQuestionDefinition[_numeroQuestion].animationquestion.numeroImageB;
   }


   bool   getVisibiliteB() {
     return _listeQuestionDefinition[_numeroQuestion].animationquestion.visibiliteB;
   }


   String getDescriptionB() {
     return _listeQuestionDefinition[_numeroQuestion].animationquestion.DescriptionB;
   }


   double getPositionGaucheB() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionGaucheB;

   }

   double getPositionHautB() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionHautB;

   }

   double getPositionDroiteB() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionDroiteB;

   }

   double getPositionBasB() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionBasB;

   }

   double getHauteurB () {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.hauteurB;

   }


   double getLargeurB () {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.largeurB;

   }

   ///// *******************    C  *******************  /////////



   int  getNumeroImageC() {
     return _listeQuestionDefinition[_numeroQuestion].animationquestion.numeroImageC;
   }


   bool   getVisibiliteC() {
     return _listeQuestionDefinition[_numeroQuestion].animationquestion.visibiliteC;
   }


   String getDescriptionC() {
     return _listeQuestionDefinition[_numeroQuestion].animationquestion.DescriptionC;
   }


   double getPositionGaucheC() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionGaucheC;

   }

   double getPositionHautC() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionHautC;

   }

   double getPositionDroiteC() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionDroiteC;

   }

   double getPositionBasC() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionBasC;

   }

   double getHauteurC () {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.hauteurC;

   }


   double getLargeurC () {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.largeurC;

   }

   ///// *******************    D  *******************  /////////



   int  getNumeroImageD() {
     return _listeQuestionDefinition[_numeroQuestion].animationquestion.numeroImageD;
   }


   bool   getVisibiliteD() {
     return _listeQuestionDefinition[_numeroQuestion].animationquestion.visibiliteD;
   }


   String getDescriptionD() {
     return _listeQuestionDefinition[_numeroQuestion].animationquestion.DescriptionD;
   }


   double getPositionGaucheD() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionGaucheD;

   }

   double getPositionHautD() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionHautD;

   }

   double getPositionDroiteD() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionDroiteD;

   }

   double getPositionBasD() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionBasD;

   }

   double getHauteurD() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.hauteurD;

   }


   double getLargeurD() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.largeurD;

   }

   ///// *******************    E   *******************  /////////



   int  getNumeroImageE() {
     return _listeQuestionDefinition[_numeroQuestion].animationquestion.numeroImageE;
   }


   bool   getVisibiliteE() {
     return _listeQuestionDefinition[_numeroQuestion].animationquestion.visibiliteE;
   }


   String getDescriptionE() {
     return _listeQuestionDefinition[_numeroQuestion].animationquestion.DescriptionE;
   }


   double getPositionGaucheE() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionGaucheE;

   }

   double getPositionHautE() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionHautE;

   }

   double getPositionDroiteE() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionDroiteE;

   }

   double getPositionBasE() {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.positionBasE;

   }

   double getHauteurE () {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.hauteurE;

   }


   double getLargeurE () {

     return _listeQuestionDefinition[_numeroQuestion].animationquestion.largeurE;

   }




   /////////////////////////////////////////////////////////////////////
   ///// ---------------   LISTE DES FONCTIONS POUR LES  QUESTIONS -------------- /////////
   /////////////////////////////////////////////////////////////////////

   int retourneIndiceQuestion( int value){

     var  indice =  _listeQuestionDefinition.indexWhere((innerElement) => innerElement.id == value);

     return indice ;
   }

   void questionSuivante() {
     if (_numeroQuestion <= _listeQuestionDefinition.length - 1) {
       _numeroQuestion++;
     }
   }




   bool FinTheme() {
     if (_numeroQuestion >= _listeQuestionDefinition.length - 1) {
       return true;
     } else {
       return false;
     }
   }

   List listeQuestion() {
     return _listeQuestionDefinition;
   }

   int getTaille() {
     return _listeQuestionDefinition.length;
   }

   int getIdQuestion() {
     return _listeQuestionDefinition[_numeroQuestion].id;
   }

   String getQuestionText() {
     return _listeQuestionDefinition[_numeroQuestion].questionText;
   }

   bool getReponseA() {
     return _listeQuestionDefinition[_numeroQuestion].reponseA;
   }

   bool getReponseB() {
     return _listeQuestionDefinition[_numeroQuestion].reponseB;
   }

   bool getReponseC() {
     return _listeQuestionDefinition[_numeroQuestion].reponseC;
   }


   bool getFauteGrave() {
     return _listeQuestionDefinition[_numeroQuestion].fauteGrave;
   }

   String getExplication() {
     return _listeQuestionDefinition[_numeroQuestion].explication;
   }

   int getPoint() {
     return _listeQuestionDefinition[_numeroQuestion].point;
   }

   String getCheminImageSourceQuestion() {
     return _listeQuestionDefinition[_numeroQuestion].cheminImageSource;
   }

   int getNumeroImageSourceQuestion() {
     return _listeQuestionDefinition[_numeroQuestion].numeroImageSource;
   }


   /////////////////////////////////////////////////////////////////////
   ///// ---------------   LISTE DES FONCTIONS  POUR LES OPTION -------------- /////////
   /////////////////////////////////////////////////////////////////////

   String getOptionA() {
     return _listeQuestionDefinition[_numeroQuestion].option.optionA;
   }



   String getOptionB() {
     return _listeQuestionDefinition[_numeroQuestion].option.optionB;
   }

   String getOptionC() {
     return _listeQuestionDefinition[_numeroQuestion].option.optionC;
   }


     void reset() {
       _numeroQuestion = 0;
      }





   }







