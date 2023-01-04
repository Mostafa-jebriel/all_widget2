import 'package:all_widget2/collasable_drawer/screens/home/home_screen.dart';
import 'package:all_widget2/pdf/main_pdf.dart';
import 'package:all_widget2/share_widget.dart';
import 'package:all_widget2/side_menu_animation/side_menu_animation.dart';
import 'package:all_widget2/widget/AllWidget.dart';
import 'package:all_widget2/widget/Appbars.dart';
import 'package:all_widget2/widget/Spinkit.dart';
import 'package:all_widget2/widget/CupertinoContextMenuPage.dart';
import 'package:all_widget2/widget/ReorderableListView.dart';
import 'package:all_widget2/widget/Stepper.dart';
import 'package:all_widget2/widget/Transform.dart';
import 'package:all_widget2/widget/analog_clock.dart';
import 'package:all_widget2/widget/animation_getx.dart';
import 'package:all_widget2/widget/badges.dart';
import 'package:all_widget2/widget/dragtarget.dart';
import 'package:all_widget2/widget/easy_stepper.dart';
import 'package:all_widget2/widget/hero_animations.dart';
import 'package:all_widget2/widget/long_press_draggable.dart';
import 'package:all_widget2/widget/all_button.dart';
import 'package:all_widget2/widget/slider_side_menu.dart';
import 'package:all_widget2/widget/syncfusionfluttersliders.dart';
import 'package:all_widget2/widget/table.dart';
import 'package:all_widget2/widget/table2.dart';
import 'package:all_widget2/widget/voice_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widget/Customerror.dart';
import 'widget/syncfusion_flutter_gauges.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Widget"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "All Widget ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("AllWidget", AllWidget()),
                buildMaterialButton(
                    "Long Press Draggable", LongPressDraggablePage()),
                buildMaterialButton(
                    "Reorderable List View ", ReorderableListViewPage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton(
                    "CupertinoContextMenu", CupertinoContextMenuPage()),
                buildMaterialButton("table", TablePage()),
                buildMaterialButton("Stepper", StepperPage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("table", Table2()),
                buildMaterialButton("Transform", TransformPage()),
                buildMaterialButton("spinkit", SpinkitPage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("DragTarget", DragTargetPage()),
                buildMaterialButton("Custom error widget", CustomError()),
                buildMaterialButton("Get x Animation", GetXAnimation()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("HeroAnimations", HeroAnimations()),
                buildMaterialButton("PDF", MainPDF()),
                buildMaterialButton("Easy Stepper ", EasyStepperPage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("Analog Clock ", AnalogClockPage()),
                buildMaterialButton("Syncfusion ", SyncfusionPage()),
                buildMaterialButton("Badges  ", BadgesPage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("voice message", ChatPage()),
                buildMaterialButton("ShapeAppBar", ShapeAppBar()),
                buildMaterialButton("SliderSideMenu", SliderSideMenuPage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("CollasableDrawer", CollasableDrawer()),
                buildMaterialButton(
                    "side menu animation", sideMenuAnimationPage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //buildMaterialButton("",()),
            //   ],
            // ),
            // SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
