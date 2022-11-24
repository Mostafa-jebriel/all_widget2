

import 'package:flutter/material.dart';

class LongPressDraggablePage extends StatefulWidget {

  @override
  State<LongPressDraggablePage> createState() => _LongPressDraggableState();
}

class _LongPressDraggableState extends State<LongPressDraggablePage> {
  Offset o=Offset(200, 250);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LongPressDraggable"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (c,s){
            return Stack(
              children: [
                Positioned(
                  left: o.dx,
                  top: o.dy,
                  child: LongPressDraggable(
                    feedback: Image.network(
                        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
                      height: 200,
                      color: Colors.orangeAccent,
                      colorBlendMode: BlendMode.colorBurn,
                    ),
                    child: Image.network(
                      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
                      height: 200,
                    ),
                    onDragEnd: (d){
                      setState(() {
                        double nh=MediaQuery.of(context).size.height-s.maxHeight;
                        o=Offset(d.offset.dx, d.offset.dy-nh);
                      });
                    },

                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
