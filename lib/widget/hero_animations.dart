import 'package:all_widget2/share_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeroAnimations extends StatefulWidget {
  @override
  State<HeroAnimations> createState() => _HeroAnimationsState();
}

class _HeroAnimationsState extends State<HeroAnimations> {
  final itme=<Items>[
    Items(ti: 'Item1', im: 'https://www.shutterstock.com/image-vector/photo-graphic-editor-on-computer-600w-1432421069.jpg'),
    Items(ti: 'Item2', im: 'https://thumbs.dreamstime.com/z/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-gra-130247647.jpg'),
    Items(ti: 'Item3', im: 'https://i.pinimg.com/originals/9c/73/e1/9c73e18f1d2fd0caa9f459192cb894b2.jpg'),
    Items(ti: 'Item4', im: 'https://images.pexels.com/photos/585759/pexels-photo-585759.jpeg?auto=compress&cs=tinysrgb&w=600'),
    Items(ti: 'Item5', im: 'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w600/2020/05/Frame-9.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: Appbar("HeroAnimations"),
      body: ListView.builder(
        itemCount: itme.length,
          padding: EdgeInsets.all(10),
          itemBuilder: (c,i){
          var t=itme[i];
            return GestureDetector(
              child: Container(
                height: 150,
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Hero(tag: t,
                        transitionOnUserGestures: true,
                        child: Image.network(t.im)),
                    SizedBox(width: 10,),
                    Text(t.ti,style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
              onTap: (){
                Get.to(ShowImage(t),);
              },
            );
          }),
    );
  }
}
class Items{
  final ti;
  final im;

  Items({required this.ti, required this.im});
}

class ShowImage extends StatelessWidget {

  final item;
  ShowImage(this.item);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: Appbar("HeroAnimations"),
      body:  Hero(
        tag: item,
        transitionOnUserGestures: true,
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.network(item.im,fit: BoxFit.cover,),
        ),
      ),
    );
  }
}

