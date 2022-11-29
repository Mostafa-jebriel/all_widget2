import 'package:all_widget2/home.dart';
import 'package:all_widget2/share_widget.dart';
import 'package:all_widget2/widget/dragtarget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar("GetXAnimation"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: (){
              Get.to(Home(),transition:Transition.zoom );
            },
          child: Text("page 1"),),
          MaterialButton(
            onPressed: (){
              Get.to(DragTargetPage(),transition:Transition.fadeIn );
            },
          child: Text("page 2"),)
        ],
      ),
    );
  }
}