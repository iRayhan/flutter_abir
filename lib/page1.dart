import 'package:flutter/material.dart';
import 'package:flutterabir/gagro.dart';
import 'package:flutterabir/page2.dart';

class Page1 extends StatelessWidget {

  Page1(this.childList);

  List<Child> childList;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          child: ListView.builder(
            itemCount: childList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: EdgeInsets.all(6.0),
                title: Text("${childList[index].name}"),
                leading: Image.network(childList[index].image),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Page2(childList[index].child)),
                  );
                },
              );
            },

          ),
        )
    );
  }

}

