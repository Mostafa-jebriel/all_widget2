

import 'package:flutter/material.dart';
import 'package:get/get.dart';

 Appbar(t){
  return AppBar(
    title: Text(t),
    centerTitle: true,
    backgroundColor: Colors.greenAccent,
    automaticallyImplyLeading: true,
  );
}
MaterialButton buildMaterialButton(t,w) {
  return MaterialButton(
    onPressed: (){
      Get.to(w);
    },
    child: Text(t),
    color: Colors.orangeAccent,
    textColor: Colors.white,
  );
}