import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:makeat_mobile/main.dart';
import 'homeScreen.dart';

class byName extends StatefulWidget  {
  @override
  _byNameState createState() => _byNameState();
}

class _byNameState extends State<byName>{
  int _counter = 0;
  bool showRaisedButtonBadge = true;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Badge(
            position: BadgePosition.topEnd(top: 10, end: 10),
            badgeContent: null,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ),
          title: Image.asset('images/transparent-logo.png',scale:5),
          centerTitle: true,
          backgroundColor: Color(0xFF9ec1a3),
          actions: <Widget>[
            _shoppingCartBadge(),

          ],
        ),
        body: Column(
          children: <Widget>[
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
        _counter.toString(),
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
                _counter++;
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
              _counter.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ) ,

        RaisedButton.icon(
            onPressed: () {
              if (_counter > 0) {
                setState(() {
                  _counter--;
                });
              }
            },
            icon: Icon(Icons.remove),
            label: Text('')),
      ],
    );
  }
}