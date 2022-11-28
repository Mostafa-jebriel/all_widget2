

import 'dart:math';

import 'package:flutter/material.dart';

class TransformPage extends StatefulWidget {

  @override
  State<TransformPage> createState() => _TransformPageState();
}

class _TransformPageState extends State<TransformPage> {
   double v=0;
   double v2=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Transform.rotate(
              angle: v*(pi/180),
              child: Container(
                color: Colors.blue,
                height: 200,
                width: 200,
                child: Center(child: Text("Transform 1")),
              ),
            ),
            Text("${v.toInt()}",style: TextStyle(fontSize: 20),),
            Slider(
                value: v,
                min: 0,
                max: 360,
                divisions: 100,
                label: "value",
                activeColor: Colors.redAccent,
                inactiveColor: Colors.indigoAccent,
                onChanged: (ve){
              setState(() {
                v=ve;
              });
            }),
            SizedBox(height: 20,),
            Transform.scale(
              scale: v2,
              child: Container(
               decoration: BoxDecoration(
                 color: Colors.blue,
                 borderRadius: BorderRadius.circular(50),
               ),
                height: 50,
                width: 50,
              ),
            ),
            Text("${v2.toInt()}",style: TextStyle(fontSize: 20),),
            Slider(
                value: v2,
                min: 0,
                max: 4,
                divisions: 4,
                label: "value",
                activeColor: Colors.redAccent,
                inactiveColor: Colors.indigoAccent,
                onChanged: (ve){
                  setState(() {
                    v2=ve;
                  });
                })
          ],
        ),
      ),
    );
  }
}
