import 'package:flutter/material.dart';

const kColorPrimary = Color(0xFF8E97FD);
const kColorLightYellow = Color(0xFFFFECCC);

const kColorBlack = Color(0xFF3F414E);
const kColorLight = Color(0xFFEBEAEC);

const kColorYellow = Color(0xFFFFC97E);

class PrimaryFont {
  static String fontFamily = 'HelveticaNeue';

  static TextStyle light(double size) {
    return TextStyle(
      fontFamily: 'HelveticaNeue',
      fontSize: size,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle thin(double size) {
    return TextStyle(
      fontFamily: 'HelveticaNeue',
      fontSize: size,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle medium(double size) {
    return TextStyle(
      fontFamily: 'HelveticaNeue',
      fontSize: size,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle bold(double size) {
    return TextStyle(
      fontFamily: 'HelveticaNeue',
      fontSize: size,
      fontWeight: FontWeight.w700,
    );
  }
}

extension GetOrientation on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;
}

extension GetSize on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
}
