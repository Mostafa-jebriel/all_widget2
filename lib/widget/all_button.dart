import 'package:all_widget2/share_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:argon_buttons_flutter_fix/argon_buttons_flutter.dart';
class AllButton extends StatefulWidget {
  const AllButton({Key? key}) : super(key: key);

  @override
  State<AllButton> createState() => _AllButtonState();
}

class _AllButtonState extends State<AllButton> {
  bool isb=true;
  var primaryColor = Color(0xFFE0E0E0);

  @override
  Widget build(BuildContext context) {
    Offset o=isb?Offset(10,10):Offset(28,28);
    double b=isb?5.0:30.0;
    return Scaffold(
      appBar: Appbar("Buttons"),
      body: Center(
        child: SingleChildScrollView(
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
      ),
    );
  }

}

class ArgonButtonExample extends StatelessWidget {
  const ArgonButtonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ArgonTimerButton(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.45,
              minWidth: MediaQuery.of(context).size.width * 0.30,
              highlightColor: Colors.transparent,
              highlightElevation: 0,
              roundLoadingShape: false,
              onTap: (startTimer, btnState) {
                if (btnState == ButtonState.Idle) {
                  startTimer(5);
                }
              },
              // initialTimer: 10,
              child: Text(
                "Resend OTP",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              loader: (timeLeft) {
                return Text(
                  "Wait | $timeLeft",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                );
              },
              borderRadius: 5.0,
              color: Colors.transparent,
              elevation: 0,
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            SizedBox(
              height: 50,
            ),
            ArgonTimerButton(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.45,
              onTap: (startTimer, btnState) {
                if (btnState == ButtonState.Idle) {
                  startTimer(5);
                }
              },
              child: Text(
                "Resend OTP",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              loader: (timeLeft) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  child: Text(
                    "$timeLeft",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                );
              },
              borderRadius: 5.0,
              color: Color(0xFF7866FE),
            ),
            SizedBox(
              height: 50,
            ),
            ArgonTimerButton(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.45,
              minWidth: MediaQuery.of(context).size.width * 0.30,
              highlightColor: Colors.transparent,
              highlightElevation: 0,
              roundLoadingShape: false,
              splashColor: Colors.transparent,
              onTap: (startTimer, btnState) {
                if (btnState == ButtonState.Idle) {
                  startTimer(5);
                }
              },
              // initialTimer: 10,
              child: Text(
                "Resend OTP",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              loader: (timeLeft) {
                return Text(
                  "Wait | $timeLeft",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                );
              },
              borderRadius: 5.0,
              color: Colors.transparent,
              elevation: 0,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
              height: 1,
              color: Colors.black,
            ),
            SizedBox(
              height: 50,
            ),
            ArgonButton(
              height: 50,
              roundLoadingShape: true,
              width: MediaQuery.of(context).size.width * 0.45,
              onTap: (startLoading, stopLoading, btnState) {
                if (btnState == ButtonState.Idle) {
                  startLoading();
                } else {
                  stopLoading();
                }
              },
              child: Text(
                "SignUp",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              loader: Container(
                padding: EdgeInsets.all(10),
                child: SpinKitRotatingCircle(
                  color: Colors.white,
                  // size: loaderWidth ,
                ),
              ),
              borderRadius: 5.0,
              color: Color(0xFFfb4747),
            ),
            SizedBox(
              height: 50,
            ),
            ArgonButton(
              height: 50,
              roundLoadingShape: false,
              width: MediaQuery.of(context).size.width * 0.45,
              minWidth: MediaQuery.of(context).size.width * 0.30,
              onTap: (startLoading, stopLoading, btnState) {
                if (btnState == ButtonState.Idle) {
                  startLoading();
                } else {
                  stopLoading();
                }
              },
              child: Text(
                "Continue",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              loader: Text(
                "Loading...",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              borderRadius: 5.0,
              color: Color(0xFF7866FE),
            ),
          ],
        ),
      ),
    );
  }
}