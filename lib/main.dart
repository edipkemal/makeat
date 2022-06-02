import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart';
import 'package:makeat_mobile/screens/homeScreen.dart';
import 'screens/byName.dart';
import 'screens/byIngredient.dart';
import 'screens/homeScreen.dart';


void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MakEat',
      home: HomeScreen(),
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      /*
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondScreen(),
        '/third': (context) => const FirstScreen(),
      },*/
    ),
  );
}
