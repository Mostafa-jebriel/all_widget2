


import 'package:all_widget2/share_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {


  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int s=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar("Stepper"),
      body: ListView(
        children: [
          Center(
            child: Stepper(
              steps: [
                Step(
                    isActive: s == 0,
                    title: Text("Step1"),
                    content: Text("mostafa")),
                Step(
                    isActive: s == 1,
                    title: Text("Step2"),
                    content: Text("mostafa2")),
                Step(
                    isActive: s == 2,
                    title: Text("Step3"),
                    content: Text("mostafa3")),
              ],
              onStepTapped: (n) {
                setState(() {
                  s = n;
                });
              },
              currentStep: s,
              onStepContinue: () {
                if (s != 2) {
                  setState(() {
                    s += 1;
                  });
                }
              },
              onStepCancel: () {
                if (s != 0) {
                  setState(() {
                    s -= 1;
                  });
                }
              },
            ),
          ),
          EasyStepper(
            activeStep: s,
            lineLength: 70,
            direction: Axis.vertical,
            // stepShape: StepShape.rRectangle,
            // stepBorderRadius: 15,
            // borderThickness: 2,
            padding: 20,
            stepRadius: 28,
            finishedStepBorderColor: Colors.greenAccent,
            finishedStepTextColor: Colors.greenAccent,
            finishedStepBackgroundColor: Colors.greenAccent,
            activeStepIconColor: Colors.greenAccent,
            // loadingAnimation: 'assets/images/curlyhair.png',
            steps: const [
              EasyStep(
                icon: Icon(Icons.add_task_rounded),
                title: 'Order Placed',
              ),
              EasyStep(
                icon: Icon(Icons.category_rounded),
                title: 'Preparing',
              ),
              EasyStep(
                icon: Icon(Icons.local_shipping_rounded),
                title: 'Shipping',
              ),
              EasyStep(
                icon: Icon(Icons.door_back_door_outlined),
                title: 'On The Way',
              ),
              EasyStep(
                icon: Icon(Icons.check_circle_outline_outlined),
                title: 'Delivered',
              ),
              EasyStep(
                icon: Icon(Icons.reviews_outlined),
                activeIcon: Icon(Icons.reviews_rounded),
                title: 'Add Review',
              ),
            ],
            onStepReached: (index) => setState(() => s = index),
          ),
        ],
      ),
    );
  }
}
