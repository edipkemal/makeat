import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:makeat_mobile/main.dart';
import 'package:makeat_mobile/model/foodModel.dart';
import 'package:makeat_mobile/screens/foodDetail.dart';
import 'package:makeat_mobile/style/styles.dart';
import 'homeScreen.dart';
import '../model/foodModel.dart';
import 'package:http/http.dart' as http;


class byName extends StatefulWidget  {
  @override
  _byNameState createState() => _byNameState();
  static bool searched=false;
  static String name="";
}

class _byNameState extends State<byName>{

  //int _counter = 0;
  //bool showRaisedButtonBadge = true;
  late FoodModel foodModel;
  String apiKey = "de86601f4b7a495cbcbd40cea4df7d32";
  //String apiKey = "c83822c094074ed59d28b1d962f948fb";
  //String apiKey = "49a33f02c3c8489785faad0245fa38a3";
  //String apiKey = "e70ee5507e714bb9987c331fec90c132";
  //String apiKey = "685d0c6a39144c638a2b793a54cb0689";
  TextEditingController search = TextEditingController();
  var printSearch;
  bool show=false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: mAppBar(),
        ),


        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    style: TextStyle(color: Styles.secondColor),
                    controller: search,
                    onChanged: (str){
                      setState(() {
                        str=search.text;
                      });
                    },
                    decoration: InputDecoration(
                      suffixIcon: Container(
                        width: 100,
                        child:Row(
                          children: <Widget>[
                            IconButton(
                              color: Colors.red,
                              icon:Icon(Icons.clear),
                              onPressed: () {
                                search.clear();

                                show=false;
                                byName.searched=false;
                                setState(() {
                                });
                              },
                            ),
                            IconButton(
                              color:Styles.secondColor,
                              onPressed: (){
                                show=true;
                                byName.name=search.text.toString();

                                setState(() {
                                  byName.searched=true;
                                });
                                /*
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ()),
                            );*/
                              },
                              icon: Icon(Icons.search),
                            ),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Search by Name',
                      hintText: 'Enter the Food Name',
                    ),
                  )
              ),
              //Text(""),
              //if (show) Text(search.text.toString()
              //),

              //_addRemoveCartButtons(),

              if (byName.searched)
                Padding(
                  padding: EdgeInsets.all(20),
                  child: FutureBuilder(
                    future: getFood(),
                    builder: (context, AsyncSnapshot<FoodModel> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.connectionState == ConnectionState.done) {
                        debugPrint("Connection Successful");
                        return GridView.builder(
                          itemCount:10,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemBuilder: (context,index){
                            return InkWell(
                              onTap:(){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>foodDetail(food: snapshot.data!.results[index],)));
                              } ,
                              child: Hero(
                                tag: snapshot.data!.results[index].id,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: ListView(
                                    shrinkWrap: true,
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(snapshot.data!.results[index].image),
                                      Text(snapshot.data!.results[index].title)
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );

                      } else {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }
                    },

                  ),
                )
            ],
          ),
        )
      ),
    );
  }

  Future<FoodModel> getFood() async{

    byName.searched=false;
    var response = await http.get(
      Uri.parse('https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey&query=${byName.name}'),
    );


    var answer = json.decode(response.body);
    var _foodModel = FoodModel.fromJson(answer);

    return _foodModel;
  }

  Widget _shoppingCartBadge() {
    return Badge(
      position: BadgePosition.topEnd(top: 0, end: 3),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.scale,
      badgeContent: Text(
        Styles.counter.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }),
    );
  }

  Widget _productImage() {
    return Padding(
      padding:  const EdgeInsets.all(10),
      child: Image.asset(
        "assets/images/products.jpg",
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _addRemoveCartButtons() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton.icon(
            onPressed: () {
              setState(() {
                Styles().increase();
              });
            },
            icon: Icon(Icons.add),
            label: Text("")),
        RaisedButton(
          color:  Colors.grey ,
          onPressed: () {},
          child:Badge(
            badgeColor: Colors.grey,
            position: BadgePosition.topEnd(top: 0, end: 3),
            animationDuration: Duration(milliseconds: 300),
            //borderRadius: null,
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              Styles.counter.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ) ,

        ElevatedButton.icon(
            onPressed: () {
              setState(() {
                Styles().decrease();
              });
            },
            icon: Icon(Icons.remove),
            label: Text('')),
      ],
    );
  }
}