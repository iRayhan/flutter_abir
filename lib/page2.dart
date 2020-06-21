import 'package:flutter/material.dart';
import 'package:flutterabir/gagro.dart';

class Page2 extends StatelessWidget {
  
  Page2(this.child2List);

  List<Child2> child2List;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          child: ListView.builder(
            itemCount: child2List.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: EdgeInsets.all(6.0),
                title: Text("${child2List[index].name}"),
                leading: Image.network(child2List[index].image),

              );
            },

          ),
        )
    );
  }

}

