import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';

class byIngredient extends StatefulWidget {
  @override
  _byIngredientState createState() => _byIngredientState();
}

class _byIngredientState extends State<byIngredient> {
//Step 3
  _byIngredientState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

//Step 1
  final TextEditingController _filter = new TextEditingController();
  final dio = new Dio(); // for http requests
  String _searchText = "";
  List names = [[]];
  //var names = List<int>.filled(3, 0, growable: true); // names we get from API
  //var filteredNames = List<int>.filled(3, 0, growable: true); // names filtered by search text
  List filteredNames = [[]];
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search Example');

  //step 2.1
  void _getNames() async {
    final response =
    await dio.get('https://jsonplaceholder.typicode.com/users');
    print(response.data);
    //var tempList = List<int>.filled(3, 0, growable: true);
    List tempList = [[]];
    for (int i = 0; i < response.data.length; i++) {
      tempList.add(response.data[i]);
    }
    setState(() {
      names = tempList;
      filteredNames = names;
    });
  }

//Step 2.2
  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  //Step 4
  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      //var tempList = List<int>.filled(3, List<String>.filled(3, 0), growable: true);
      List tempList = [[]];
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name']
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]['name']),
          onTap: () => print(filteredNames[index]['name']),
        );
      },
    );
  }

  //STep6
  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
    );
  }

  @override
  void initState() {
    _getNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search by Ingredient"),
      ),

      //_buildBar(context),
      body: Container(
        child: _buildList(),
      ),
      //resizeToAvoidBottomPadding: false,
//      floatingActionButton: FloatingActionButton(
//        onPressed: _postName,
//        child: Icon(Icons.add),
//      ),
    );
  }
}