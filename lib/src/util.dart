// util funcs
import 'package:flutter/material.dart';

final double defaultPadding = 25.0;
final String appName = "Todo";
final Gradient pinkToOrangeGradient = LinearGradient(
  colors: [
    const Color.fromARGB(255, 232, 96, 122),
    const Color.fromARGB(255, 238, 182, 98),
  ],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  stops: [0.0, 1.0],
  tileMode: TileMode.clamp
);

final Gradient blueToGrayTealGradient = LinearGradient(
  colors: [
    const Color.fromARGB(255, 0, 147, 233),
    const Color.fromARGB(255, 128, 208, 199),
  ],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  stops: [0.0, 1.0],
  tileMode: TileMode.clamp
);

final AppBar appBar = AppBar(
  title: Text(
    appName.toUpperCase(), 
    style: const TextStyle(
      fontFamily: 'Raleway',
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
      letterSpacing: 1.0,
      color: Colors.white
    ),
  ),
  centerTitle: true,
  // TODO: navigation icons
  leading: IconButton( // menu button
    icon: const Icon(Icons.menu),
    onPressed: () {
      return;
    }
  ),
  actions: <Widget>[
    IconButton( // search button
      icon: const Icon(Icons.search),
      onPressed: () {
        return;
      }
    ),
  ],
  backgroundColor: Color.fromRGBO(0, 0, 0, 0.0),
  elevation: 0.0,
);
