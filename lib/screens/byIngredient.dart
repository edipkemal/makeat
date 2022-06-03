import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:makeat_mobile/main.dart';
import 'package:makeat_mobile/style/styles.dart';
import 'homeScreen.dart';

class byIngredient extends StatefulWidget {
  @override
  _byIngredientState createState() => _byIngredientState();
}

class _byIngredientState extends State<byIngredient> {

  TextEditingController search = TextEditingController();
  var printSearch;
  List<TileButton> ingredientList = [];
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: mAppBar(),
        ),


        body: Column(
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
                              setState(() {});
                              show = false;
                            },
                          ),
                          IconButton(
                            onPressed: () {
                              show = true;
                              setState(() {});
                              ingredientList.add(TileButton(ingredientName: search.text.toString()));
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
            //if (ingredientList.length!=0) Column(
              //children: [for (TileButton t in ingredientList) t],
            //),
            ElevatedButton(
              onPressed: () {},
              child: Text("Search"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Styles.secondColor),
              ),
            ),
            _addRemoveCartButtons(),
          ],
        ),
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
}

class TileButton extends StatelessWidget {
  final String? ingredientName;

  const TileButton({
    Key? key,
    this.ingredientName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ingredientName = ingredientName;
    return Container(
      color: Colors.blue,
      //if (_ingredientName != "")
      child: Text(_ingredientName.toString())//),
    );
  }
}