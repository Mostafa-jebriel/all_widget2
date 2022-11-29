import 'package:all_widget2/share_widget.dart';
import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar("Custom Error"),
      body: Container(
        color: Colors.blue,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
CustomErrorScrren(){
  return ErrorWidget.builder=((d){
    return Material(
      child: Container(
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://www.statuscake.com/cdn-cgi/image/width=1536,quality=80,format=auto/wp-content/uploads/2021/07/iStock-1288486076.jpg"),
            SizedBox(height: 20,),
            Text(
              d.exception.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );

  });
}