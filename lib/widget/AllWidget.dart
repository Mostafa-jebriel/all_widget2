import 'package:all_widget2/share_widget.dart';
import 'package:all_widget2/widget/FAB.dart';
import 'package:all_widget2/widget/all_button.dart';
import 'package:flutter/material.dart';

class AllWidget extends StatelessWidget {
  const AllWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar("AllWidget"),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildMaterialButton("Buttons",AllButton()),
                buildMaterialButton(" ArgonButtonExample", ArgonButtonExample()),
                buildMaterialButton(" Animated Circular FAB Menu ", FABMenu()),
                TextFormField(
                  decoration: InputDecoration(
                    label: Center(child: Text("mostafa")),
                    alignLabelWithHint: true
                  ),
                ),
                SizedBox(height: 20,),
                buildCircle(icon: Icons.cached),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



Widget buildCircle({
  Color borderColor = Colors.deepPurple,
  double borderSize = 200,
  Color textColor = Colors.black,
  required IconData icon,
  Color colorIcon = Colors.deepPurpleAccent,
  double iconSize = 50,
}) {

  return Container(
    width: borderSize,
    height: borderSize,
    decoration: BoxDecoration(
      color: Colors.transparent,
      shape: BoxShape.circle,
      border: Border.all(width: 20, color: borderColor),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: colorIcon,
          size: iconSize,
        ),
        Text(
          "300",
          style: TextStyle(
              fontSize: 60, fontWeight: FontWeight.bold, color: textColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "K",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: textColor),
            ),
            Text(
              "M",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: textColor),
            ),
          ],
        ),
      ],
    ),
  );
}