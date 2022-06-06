import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:makeat_mobile/main.dart';
import 'package:makeat_mobile/model/foodModel.dart';
import 'package:makeat_mobile/model/ingredientsModel.dart';
import 'package:makeat_mobile/model/instructionModel.dart';
import 'package:makeat_mobile/style/styles.dart';
import 'homeScreen.dart';
import '../model/foodModel.dart';
import 'package:http/http.dart' as http;

class foodDetail extends StatelessWidget {
  String apiKey = "de86601f4b7a495cbcbd40cea4df7d32";
  late IngredientsModel ingredients;
  late InstructionModel instructions;
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
                          child: Text("Ingredients",style: TextStyle(color: Colors.white)),
                          color: Styles.secondColor,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    //elevation:0.0,
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: FutureBuilder(
                                        future: getIngredients(),
                                        builder: (context, AsyncSnapshot<IngredientsModel> snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          } else if (snapshot.connectionState == ConnectionState.done) {
                                            debugPrint("Connection Successful");
                                            return GridView.builder(
                                              itemCount:snapshot.data!.ingredients.length,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                                              itemBuilder: (context,index){
                                                return Padding(
                                                      padding: EdgeInsets.all(1),
                                                      child: Stack(
                                                        //shrinkWrap: true,
                                                        //mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Row(children: [
                                                            Text(snapshot.data!.ingredients[index].name),
                                                            Text(": "),
                                                            Text(snapshot.data!.ingredients[index].amount.metric.value.toString()),
                                                            Text(" "),
                                                            Text(snapshot.data!.ingredients[index].amount.metric.unit)
                                                          ],)
                                                        ],
                                                      ),
                                                );
                                              },
                                            );

                                          } else {
                                            return Center(
                                              child: Container(color: Colors.blue,height: 100,width: 100,)
                                            );
                                          }
                                        },

                                      ),
                                    ),

                                  );
                                });
                          },
                        ),

                        RaisedButton(
                          child: Text("Instructions",style: TextStyle(color: Colors.white)),
                          color: Styles.secondColor,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    //elevation:0.0,
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: FutureBuilder(
                                        future: getInstruction(),
                                        builder: (context, AsyncSnapshot<InstructionModel> snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          } else if (snapshot.connectionState == ConnectionState.done) {
                                            debugPrint("Connection Successful");
                                            return GridView.builder(
                                              //itemCount: snapshot.data!.steps.length,
                                              itemCount: 5,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                                              itemBuilder: (context,index){
                                                return Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Stack(
                                                    //shrinkWrap: true,
                                                    //mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(children: [
                                                        //Text(snapshot.data!.steps[index].number.toString()),
                                                        Text("food id: "),
                                                        Text(food!.id.toString()),
                                                        //Text(snapshot.data!.toString()),
                                                        //Text(snapshot.data!.steps[index].step),
                                                      ],)
                                                    ],
                                                  ),
                                                );
                                              },
                                            );

                                          } else {
                                            return Center(
                                                child: Container(color: Colors.blue,height: 100,width: 100,)
                                            );
                                          }
                                        },

                                      ),
                                    ),

                                  );
                                });
                          },
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

  Future<IngredientsModel> getIngredients() async{
    var response = await http.get(
      Uri.parse('https://api.spoonacular.com/recipes/${food!.id.toString()}/ingredientWidget.json?apiKey=$apiKey'),
    );


    var _answer = json.decode(response.body);
    var _ingredientsModel = IngredientsModel.fromJson(_answer);

    return _ingredientsModel;
  }

  Future<InstructionModel> getInstruction() async{
    var response = await http.get(
      Uri.parse('https://api.spoonacular.com/recipes/${food!.id.toString()}/analyzedInstructions?apiKey=$apiKey'),
    );


    var _answer = json.decode(response.body);
    var _instructionModel = InstructionModel.fromJson(_answer);

    return _instructionModel;
  }

}

