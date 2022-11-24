
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';


class ShapButton extends StatefulWidget {
  const ShapButton({Key? key}) : super(key: key);

  @override
  State<ShapButton> createState() => _ShapButtonState();
}

class _ShapButtonState extends State<ShapButton> {
  bool isb=true;
  var primaryColor = Color(0xFFE0E0E0);

  @override
  Widget build(BuildContext context) {
    Offset o=isb?Offset(10,10):Offset(28,28);
    double b=isb?5.0:30.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("ShapButton"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }
}
