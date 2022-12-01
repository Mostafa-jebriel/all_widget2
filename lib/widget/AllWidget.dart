import 'package:all_widget2/share_widget.dart';
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
