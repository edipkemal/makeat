import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:makeat_mobile/main.dart';
import 'package:makeat_mobile/style/styles.dart';
import 'homeScreen.dart';

class byName extends StatefulWidget  {
  @override
  _byNameState createState() => _byNameState();
}

class _byNameState extends State<byName>{
  //int _counter = 0;
  //bool showRaisedButtonBadge = true;

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


        body: Column(
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
                            setState(() {
                            });
                            show=false;
                          },
                        ),
                        IconButton(
                          color:Styles.secondColor,
                          onPressed: (){
                            show=true;
                            setState(() {
                            });
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
            Text(""),
                if (show) Text(search.text.toString()
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