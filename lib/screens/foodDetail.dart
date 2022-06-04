import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:makeat_mobile/main.dart';
import 'package:makeat_mobile/model/foodModel.dart';
import 'package:makeat_mobile/style/styles.dart';
import 'homeScreen.dart';
import '../model/foodModel.dart';
import 'package:http/http.dart' as http;

class foodDetail extends StatelessWidget {

  Result? food;

  foodDetail({Key? key, this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      backgroundColor: Styles.firstColor,
      appBar: AppBar(
        backgroundColor: Styles.firstColor,
        elevation: 0,
        title: Text(food!.title),
      ),body:Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height * (3 / 4),
            width: MediaQuery.of(context).size.width - 20,
            left: 10,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.people),
                            Text("4")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time),
                            Text("30 min"),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        RaisedButton(
                          onPressed:() {


                          },
                          child: Text("Ingredints",style: TextStyle(color: Colors.white)),
                          color: Styles.secondColor,
                        ),

                        RaisedButton(
                          onPressed:() {

                          },
                          child: Text("Instructions",style: TextStyle(color: Colors.white)),
                          color: Styles.secondColor,
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {

                        },
                        child: Icon(Icons.add),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        //primary: Colors.blue, // <-- Button color
                        //onPrimary: Colors.red, // <-- Splash color
                      ),
                    )
                  ],
                )),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: food!.id.toString(),
              child: Container(
                height: 300,
                width: 300,
                child: Image.network(
                  food!.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),);
  }
}