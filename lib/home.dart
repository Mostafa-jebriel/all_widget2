import 'package:all_widget2/widget/long_press_draggable.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 bool isb=true;
 var primaryColor = Color(0xFFE0E0E0);

  @override
  Widget build(BuildContext context) {
    Offset o=isb?Offset(10,10):Offset(28,28);
    double b=isb?5.0:30.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("All Widget 2"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("All Widget 2",style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 30),),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: ()=>setState(()=>isb=!isb),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  child: SizedBox(height: 100,width: 100,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: -o,
                          color: Colors.white,
                          blurRadius: b,
                        inset: isb,
                      ),
                      BoxShadow(
                        offset: o,
                        color: Color(0xffa7a9af),
                        blurRadius: b,
                        inset: isb,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: primaryColor,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-20, -20),
                  blurRadius: 60,
                  color: Colors.white,
                  inset: true,
                ),
                BoxShadow(
                  offset: Offset(20, 20),
                  blurRadius: 60,
                  color: Color(0xFFBEBEBE),
                  inset: true,
                ),
              ],
            ),
          ),
              SizedBox(height: 20,),
              buildMaterialButton("Long Press Draggable",LongPressDraggablePage()),
              SizedBox(height: 20,),
              SizedBox(height: 20,),
              SizedBox(height: 20,),
              SizedBox(height: 20,),
              SizedBox(height: 20,),
              SizedBox(height: 20,),
              SizedBox(height: 20,),
              SizedBox(height: 20,),
            ],
          ),
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
            color: Colors.black12,
            textColor: Colors.white,
            );
  }
}
