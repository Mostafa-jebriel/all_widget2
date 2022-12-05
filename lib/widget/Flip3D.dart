


import 'package:all_widget2/share_widget.dart';
import 'package:flutter/material.dart';

class Flip3D extends StatefulWidget {
  const Flip3D({Key? key}) : super(key: key);

  @override
  State<Flip3D> createState() => _Flip3DState();
}

class _Flip3DState extends State<Flip3D> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar("Flip3D"),
      body:  Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
      ),
    );
  }
}
