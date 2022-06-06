import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:makeat_mobile/main.dart';
import 'package:makeat_mobile/model/foodModel.dart';
import 'package:makeat_mobile/model/searchInstructionModel.dart';
import 'package:makeat_mobile/style/styles.dart';
import 'foodDetail.dart';
import 'homeScreen.dart';
import 'package:http/http.dart' as http;

class byIngredient extends StatefulWidget {
  @override
  _byIngredientState createState() => _byIngredientState();
}

class _byIngredientState extends State<byIngredient> {

  TextEditingController search = TextEditingController();
  var printSearch;
  static List<TileButton> ingredientList = [];
  static List<String> nameList = [];
  bool show = false;
  static bool searched=false;
  late FoodModel foodModel;
  String apiKey = "de86601f4b7a495cbcbd40cea4df7d32";
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
                    onChanged: (str) {
                      setState(() {
                        str = search.text;
                      });
                    },
                    decoration: InputDecoration(
                      suffixIcon: Container(
                        width: 100,
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              color: Colors.red,
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                search.clear();
                                show = false;
                                setState(() {});
                              },
                            ),
                            IconButton(
                              onPressed: () {
                                show = true;
                                ingredientList.add(TileButton(ingredientName: search.text.toString()));
                                nameList.add(search.text.toString());
                                //NamePasser.ingName=search.text.toString();
                                search.clear();
                                setState(() {});
                              },
                              icon: Icon(Icons.add),
                              color: Styles.secondColor,
                            ),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Search by Ingredient',
                      hintText: 'Enter the Ingredient Name',
                    ),
                  )
              ),
              //if (show ) TileButton(ingredientName: search.text.toString()
              //),

              ElevatedButton(
                onPressed: () {
                  ingredientList.clear();
                  searched=true;
                  setState(() {

                  });
                },
                child: Text("Search",style: TextStyle(color: Styles.secondColor),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Styles.firstColor),
                ),
              ),
              if (ingredientList.length !=0 ) Column(
                children: [for (TileButton t in ingredientList) t],
              ),
              if (searched) Padding(
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
                              tag: snapshot.data!.results[index].imageType,
                              //tag:1,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: ListView(
                                  shrinkWrap: true,
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(snapshot.data!.results[index].image),
                                    Text(snapshot.data!.results[index].title),
                                    Container()
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


              //_addRemoveCartButtons(),
            ],
          ),
        )
      ),
    );
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
      padding: const EdgeInsets.all(10),
      child: Image.asset(
        "assets/images/products.jpg",
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _addRemoveCartButtons() {
    return Row(
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
          color: Colors.grey,
          onPressed: () {},
          child: Badge(
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
        ),

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

  Future<FoodModel> getFood() async{
    searched=false;
    List <SearchInstructionModel> foodList;
    var response = await http.get(
      Uri.parse('https://api.spoonacular.com/recipes/findByIngredients?ingredients=${nameList.join(",+")}&apiKey=$apiKey'),
    );
    //debugPrint('https://api.spoonacular.com/recipes/findByIngredients?ingredients=${nameList.join(",+")}&apiKey=$apiKey');

    Iterable answer = json.decode(response.body);

    foodList  = answer.map((e) => SearchInstructionModel.fromJson(e)).toList();

    //debugPrint(answer.toString());
    //var _foodModel = SearchInstructionModel.fromJson(answer);
    //response.body[0,2];
    var newList = '{"results":';
    var last = ',"offset":0,"number":10,"totalResults":10}';
    var finalJSON = newList+response.body+last;
    debugPrint(finalJSON);

    var _foodModel = FoodModel.fromJson(json.decode(finalJSON));
    return _foodModel;
  }


}

class TileButton extends StatelessWidget {
  final String? ingredientName;

  const TileButton({
    Key? key,
    this.ingredientName,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final String? _ingredientName = ingredientName;
    return Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 200),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Styles.secondColor,
            //shape: BoxShape.circle
          ),
          //width: 100,
          //color: Styles.secondColor,
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(_ingredientName.toString(),style: const TextStyle(color: Colors.white),),
              //SizedBox(width: 10,),
              IconButton(
                  onPressed: () {
                    _byIngredientState.ingredientList.removeWhere((element){
                      return element.ingredientName == _ingredientName;
                    },
                    );
                  },
                  icon: Icon(Icons.clear,color: Colors.white,)),
            ],
          ),
        )
    );
  }





/*
class NamePasser{
  static String? ingName="";
}
class TileButton extends StatefulWidget {

  const TileButton({
    Key? key,
    required this.ingredientName,
  }) : super(key: key);
  final String ingredientName;
  @override
  _TileButton createState() => _TileButton();

}

class _TileButton extends State<TileButton> {
  @override

  //_TileButton({this.ingredientName});

  Widget build(BuildContext context) {
    var _ingredientName = widget.ingredientName;
    //var _ingredientName = widget.ingredientName;
    //final String? _ingredientName=NamePasser.ingName;
    return Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          width: 100,
          color: Styles.secondColor,
          child: Row(
            children: [
              Text(_ingredientName,style: TextStyle(color: Colors.white),),
              IconButton(
                  onPressed: () {

                    _byIngredientState.ingredientList.removeWhere((element){
                      return element.ingredientName == _ingredientName;

                    }
                    );
                    setState(() {

                    });
                  },
                  icon: Icon(Icons.clear,color: Colors.white,)),
            ],
          ),
        )
      );
  }*/
}