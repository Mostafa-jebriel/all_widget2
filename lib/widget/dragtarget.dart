import 'package:all_widget2/share_widget.dart';
import 'package:flutter/material.dart';

class DragTargetPage extends StatefulWidget {
  const DragTargetPage({Key? key}) : super(key: key);

  @override
  State<DragTargetPage> createState() => _DragTargetPageState();
}

class _DragTargetPageState extends State<DragTargetPage> {
  Color color=Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:Appbar("DragTarget"),
      body:SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Draggable(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: Center(
                    child: Text("Box"),

                  ),
                ),
                data: Colors.red,
                onDraggableCanceled: (v,o){

                },
                feedback: Container(
                  width: 150,
                  height: 150,
                  color: Colors.red.withOpacity(0.5),
                  child: Center(
                    child: Text("Box..."),

                  ),
                ),
              
            ),
            DragTarget(
              onAccept: (Color c){
                color=c;
              },
              builder: (BuildContext context,
                  List<dynamic> a,
                  List<dynamic> d,
                  ){
                return Container(
                  height: 200,
                  width: 200,
                  color: a.isEmpty?color:Colors.grey.shade200,
                  child: Center(
                    child: Text("Drag here"),
                  ),
                );
              },
            )


          ],
        ),
      ),
    );
  }
}
