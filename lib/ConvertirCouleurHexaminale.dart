

import 'dart:ui';

class HexadecimalColor extends Color {

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6)
    {
      hexColor = "FF" + hexColor;

    }
    return int.parse(hexColor, radix: 16);
  }

  HexadecimalColor(  String hexColor) : super(_getColorFromHex(hexColor));



}