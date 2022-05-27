import 'package:flutter/material.dart';

class Styles {

  static final ThemeData theme = ThemeData(
      fontFamily: 'Montserrat',
      unselectedWidgetColor: Colors.grey,
      primarySwatch: Colors.deepPurple,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
        // Formally title textstyle
        headlineLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        // Moved from listTileTitleStyling
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        // moved from listTileSubtitleStyling
        bodySmall: TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
      ));


}
