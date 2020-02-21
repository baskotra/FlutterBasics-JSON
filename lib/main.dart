import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(new MaterialApp(
  theme: new ThemeData(
    primarySwatch: Colors.teal,
  ),
  home: new HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Flutter JSON"),
      ),
      body: new Container(
        child: new Center(child: new FutureBuilder //*To get the data and display
        (future: DefaultAssetBundle.of(context).loadString('local_json/person.json'), //*Data available in local storage
        builder: (context, snapshot){
          //TODO: Decode JSON to String
          var myData = json.decode(snapshot.data.toString()); 
          //TODO: After Converting display using ListView
          return new ListView.builder( //*Takes two inputs viz., itemBuilder and itemCount
            itemBuilder: (BuildContext context, int index){
           return new Card(
             child: new Column( //?Should we display in a column?
               crossAxisAlignment: CrossAxisAlignment.stretch, //*Takes the right amount of screen to display
               children: <Widget>[
                new Text("Name : "+ myData[index]['name']),
                new Text("Age : "+ myData[index]['age']),
                new Text("Height : "+ myData[index]['height']),
                new Text("Sex : "+ myData[index]['gender']),
                new Text("Hair Color : "+ myData[index]['hair_color']),
                new Text("Course : "+ myData[index]['course']),
               ],
             ), 
           );   
            },
            itemCount: myData==null?0:myData.length,
          );
        },
        ),
        ),
      ),
    );
  }
}

