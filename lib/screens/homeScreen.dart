import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart';
import 'byName.dart';
import 'byIngredient.dart';
import '../style/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9ec1a3),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/transparent-logo.png'),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFF881699)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => byName()),
                        );
                      },
                      child: const Text('Search by Name'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFF881699)),
                      ),
                      onPressed: () {
                        //Navigator.pushNamed(context, '/second');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => byIngredient()),
                        );
                      },
                      child: const Text('Search by Ingredient'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Color(0xFF881699)),
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, '/second');
                        },
                        child: const Text("About"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Color(0xFF881699)),
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, '/second');
                        },
                        child: const Text("Contact"),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}