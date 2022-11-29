
import 'package:all_widget2/share_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoContextMenuPage extends StatefulWidget {
  @override
  State<CupertinoContextMenuPage> createState() => _CupertinoContextMenuPageState();
}

class _CupertinoContextMenuPageState extends State<CupertinoContextMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar("CupertinoContextMenu"),
      body: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: CupertinoContextMenu(
            child: Image.network("https://tech-echo.com/wp-content/uploads/2022/03/vanced-youtube.jpg"),
            actions: <Widget>[
              CupertinoContextMenuAction(child: Text("Action 1"),
              onPressed: (){
                Navigator.pop(context);
              },),
              CupertinoContextMenuAction(child: Text("Action 2")),

            ],
          )
        ),
      ),
    );
  }
}