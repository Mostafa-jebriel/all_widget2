

import 'package:flutter/material.dart';

class ReorderableListViewPage extends StatefulWidget {
  @override
  State<ReorderableListViewPage> createState() => _ReorderableListViewState();
}

class _ReorderableListViewState extends State<ReorderableListViewPage> {
  final List<int> number=List<int>.generate(30, (index) => index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reorderable ListView"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: ReorderableListView(
        children:  List.generate(number.length,
                (index) => ListTile(
                  key: Key('${index}'),
              tileColor:number[index].isOdd?Colors.black12:Colors.blueGrey ,
              trailing: Icon(Icons.drag_handle_outlined),
              title: Text("item ${index}"),
            )),
        onReorder: (int or,int nr){
          if(or<nr){
            nr-=1;
          }
          final int item=number.removeAt(or);
          number.insert(nr, item);
        },

      ),
    );
  }
}
