


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
      appBar: AppBar(
        title: Text("StepperPage"),
        centerTitle: true,
      ),
      body: Center(
        child:Stepper(
          steps: [
            Step(
              isActive: s==0,
                title: Text("Step1"),
                content: Text("mostafa")),
            Step(
              isActive: s==1,
                title: Text("Step2"),
                content: Text("mostafa2")),
            Step(
              isActive: s==2,
                title: Text("Step3"),
                content: Text("mostafa3")),
          ],
          onStepTapped: (n){
            setState(() {
              s=n;
            });
          },
          currentStep: s,
          onStepContinue: (){
            if(s!=2){
              setState(() {
                s+=1;
              });
            }
          },
          onStepCancel: (){
            if(s!=0){
              setState(() {
                s-=1;
              });
            }
          },
        ),
      ),
    );
  }
}
