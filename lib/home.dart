import 'package:all_widget2/widget/Spinkit.dart';
import 'package:all_widget2/widget/CupertinoContextMenuPage.dart';
import 'package:all_widget2/widget/ReorderableListView.dart';
import 'package:all_widget2/widget/Stepper.dart';
import 'package:all_widget2/widget/Transform.dart';
import 'package:all_widget2/widget/dragtarget.dart';
import 'package:all_widget2/widget/long_press_draggable.dart';
import 'package:all_widget2/widget/shap_button.dart';
import 'package:all_widget2/widget/table.dart';
import 'package:all_widget2/widget/table2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("All Widget 2"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Text("All Widget 2",style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 30),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("Shap Button",ShapButton()),
                buildMaterialButton("Long Press Draggable",LongPressDraggablePage()),
                buildMaterialButton("Reorderable List View ",ReorderableListViewPage()),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("CupertinoContextMenu",CupertinoContextMenuPage()),
                buildMaterialButton("table",TablePage()),
                buildMaterialButton("Stepper",StepperPage()),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("table",Table2()),
                buildMaterialButton("Transform",TransformPage()),
                buildMaterialButton("spinkit",SpinkitPage()),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("DragTarget",DragTargetPage()),

              ],
            ),
            // SizedBox(height: 10,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //
            //   ],
            // ),
            // SizedBox(height: 10,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //
            //   ],
            // ),
            // SizedBox(height: 10,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //
            //   ],
            // ),
            // SizedBox(height: 10,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //
            //   ],
            // ),
            // SizedBox(height: 10,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //
            //   ],
            // ),
            // SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

  MaterialButton buildMaterialButton(t,w) {
    return MaterialButton(
              onPressed: (){
              Get.to(w);
            },
            child: Text(t),
            color: Colors.orangeAccent,
            textColor: Colors.white,
            );
  }
}
