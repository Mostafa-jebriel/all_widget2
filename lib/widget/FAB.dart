import 'dart:math';

import 'package:all_widget2/share_widget.dart';
import 'package:flutter/material.dart';




final double bz=80;


class FABMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar("FABMenu"),
     floatingActionButton: FAB(),
    );
  }
}

class FAB extends StatefulWidget {
  const FAB({Key? key}) : super(key: key);

  @override
  State<FAB> createState() => _FABState();
}

class _FABState extends State<FAB> with SingleTickerProviderStateMixin{
  late AnimationController c;
  @override
  void initState() {
    super.initState();
    c=AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this
    );
  }
  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowDelegateMune(co: c),
      children: <IconData>[
        Icons.mail,
        Icons.abc,
        Icons.ac_unit,
        Icons.access_alarm,
        Icons.menu,
      ].map<Widget>(buildFAB).toList(),
    );
  }
  Widget buildFAB(IconData i){
    return SizedBox(
      height: bz,
      width: bz,
      child: FloatingActionButton(
        onPressed: (){
          if(c.status==AnimationStatus.completed){
            c.reverse();
          }
          else{
            c.forward();
          }
        },
        elevation: 0,
        splashColor: Colors.black,
        child: Icon(i,color: Colors.white,size: 45,),
      ),
    );

  }
}

class FlowDelegateMune extends FlowDelegate{
  final Animation<double> co;

  const FlowDelegateMune({required this.co}):super(repaint: co);

  @override
  void paintChildren(FlowPaintingContext context) {
    final z=context.size;
    final xs=z.width-bz;
    final ys=z.height-bz;
   final n=context.childCount;
   for(int i=0;i<n;i++){
     final setv=i==context.childCount-1;
     final setvalue=(v)=>setv?0.0:v;

     final radius=180*co.value;

     final r=i*pi * 0.5/(n-2);
     final x=xs-setvalue(radius*cos(r));
     final y=ys-setvalue(radius*sin(r));
     context.paintChild(
       i,
       transform: Matrix4.identity()
         ..translate(x,y,0)
         ..translate(bz/2,bz/2)
         ..rotateZ(setv?0.0:180*(1-co.value)*pi/180)
         ..scale(setv?1.0:max(co.value,0.5))
         ..translate(-bz/2,-bz/2),
     );
   }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) =>false;

}