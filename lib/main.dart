import 'package:all_widget2/home.dart';
import 'package:all_widget2/share_widget.dart';
import 'package:all_widget2/widget/Customerror.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CustomErrorScrren();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),

    );
  }
}

