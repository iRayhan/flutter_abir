import 'package:flutter/material.dart';
import 'package:flutterabir/gagro.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutterabir/page1.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            FutureBuilder(
              future: fetchGagro(),
              builder: (BuildContext context, AsyncSnapshot<Gagro> snapshot) {

                if(snapshot.hasData){

                  final dataList = snapshot.data.data.dataList;


                  return Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      itemCount: dataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          contentPadding: EdgeInsets.all(10.0),
                          title: Text("${dataList[index].name}"),
                          leading: Image.network(dataList[index].image),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Page1(dataList[index].childList)),
                            );
                          },
                        );
                      },


                    ),
                  );

                }
                else{
                  print(snapshot.error);
                  return Center(child: Text("Loading..."),);
                }

              },

            ),

          ],
        ),
      ),

    );
  }
}


Future<Gagro> fetchGagro() async {
  final response =
  await http.get('http://uat.gagro.com.bd/api/category-data?fbclid=IwAR1vj83qPGT3nu-fT8OFT5CU5N3pZOWspDVSrRvU7Q2H-pRB6oIHP2bWkOk');

  if (response.statusCode == 200) {

    return Gagro.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}