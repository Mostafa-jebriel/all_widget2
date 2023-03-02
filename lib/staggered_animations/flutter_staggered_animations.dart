import 'package:all_widget2/staggered_animations/screens/card_column_screen.dart';
import 'package:all_widget2/staggered_animations/screens/card_grid_screen.dart';
import 'package:all_widget2/staggered_animations/screens/card_list_screen.dart';
import 'package:flutter/material.dart';

class staggered_animations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('List Card Test'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardListScreen()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Grid Card Test'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardGridScreen()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Column Card Test'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardColumnScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
