import 'package:flutter/material.dart';

class Config {
  static final String appName = "Soluprov";
  static final String appVersion = "0.1.0";
  static final String apiKey = "Put your API keys here";

  static final ThemeData theme = ThemeData(
    fontFamily: 'Montserrat',
    unselectedWidgetColor: Colors.grey,
    primarySwatch: Colors.deepPurple,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  static const titleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static const titleTextStyleonBlack = TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static const inProgressCard = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const listTileTitleStyling = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static const listTileSubtitleStyling = TextStyle(
    fontSize: 16,
    color: Colors.black,
    overflow: TextOverflow.ellipsis,
  );

  static final int kmyPadding = 20;

  static const smallTextStyle = TextStyle(
    fontSize: 13,
    color: Colors.white,
  );
}
