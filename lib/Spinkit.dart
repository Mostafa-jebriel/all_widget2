import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class SpinkitPage extends StatefulWidget {

  @override
  State<SpinkitPage> createState() => _SpinkitPageState();
}

class _SpinkitPageState extends State<SpinkitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spinkit"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15,),
            SpinKitChasingDots(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitCircle(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitCubeGrid(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitDancingSquare(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitDoubleBounce(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitDualRing(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitFadingCircle(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitFadingCube(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitFadingFour(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitFadingGrid(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitHourGlass(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitPianoWave(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitPouringHourGlass(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitPouringHourGlassRefined(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitPulse(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitPumpingHeart(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitRing(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitRipple(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitRotatingCircle(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitRotatingPlain(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitSpinningCircle(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitSpinningLines(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
            SpinKitSquareCircle(
              duration: Duration(seconds: 2),
              size: 80,
              color: Colors.red,
            ) ,
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
