import 'package:all_widget2/share_widget.dart';
import 'package:flutter/material.dart';
import 'package:slider_side_menu/slider_side_menu.dart' as ss;

class SliderSideMenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleSliderSideMenuState();
  }
}

class _ExampleSliderSideMenuState extends State<SliderSideMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar("Slider Side Menu"),
      body: Stack(
        children: <Widget>[
          Center(
            child: Text("Demostration of Slider Side Menu Demo"),
          ),
          ss.SliderSideMenu(
            childrenData: [
              ss.MenuItem(
                onPressed: _thumbUp,
                Icon(
                  Icons.thumb_up,
                  color: Colors.white,
                ),
                Text(
                  "Thumb up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ss.MenuItem(
                  Icon(
                    Icons.thumb_down,
                    color: Colors.white,
                  ),
                  Text(
                    "Thumb down",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _thumbDown)
            ],
            description: "Sample tooltip message",
            parentStartColor: Colors.teal,
          )
        ],
      ),
    );
  }

  void _thumbUp() {}

  void _thumbDown() {}
}
