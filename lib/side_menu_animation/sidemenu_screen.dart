import 'package:all_widget2/side_menu_animation/menu_value.dart';
import 'package:all_widget2/side_menu_animation/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:side_menu_animation/side_menu_animation.dart';

class SideMenuScreen extends StatelessWidget {
  final _index = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SideMenuAnimation(
        appBarBuilder: (showMenu) => AppBar(
          leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.black), onPressed: showMenu),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: true,
          title: ValueListenableBuilder<int>(
            valueListenable: _index,
            builder: (_, value, __) => Text(myMenuValue[value].title,
                style: TextStyle(color: Colors.black)),
          ),
        ),
        views: List.generate(
          myMenuValue.length - 1,
          (index) => Screen(itemsScreen: myMenuValue[index + 1].items),
        ),
        position: SideMenuPosition.right,
        items: myMenuValue
            .map((value) => Icon(value.icon, color: Colors.white, size: 50))
            .toList(),
        selectedColor: Color(0xFFFF595E),
        unselectedColor: Color(0xFF1F2041),
        tapOutsideToDismiss: true,
        scrimColor: Colors.black45,
        onItemSelected: (value) {
          if (value > 0 && value != _index.value) _index.value = value;
        },
      ),
    );
  }
}
