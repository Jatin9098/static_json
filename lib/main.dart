import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(

  home: new HomePage(),
  theme: new ThemeData(
    primarySwatch: Colors.teal
  ),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Load JSON"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("load_json/person.json"),
            builder: (context, snapshot){
              var myData = jsonDecode(snapshot.data.toString());

              return ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                          new Text("Name "+myData[index]["name"]),
                          new Text("Name "+myData[index]["age"]),
                          new Text("Name "+myData[index]["height"]),
                          new Text("Name "+myData[index]["city"]),
                          new Text("Name "+myData[index]["state"]),


                      ],
                    ),
                  );

                },
                itemCount: myData == null ? 0 : myData.length,
              );
            },
          ),
        ),
      ),
    );
  }
}

mixin JSON {
}