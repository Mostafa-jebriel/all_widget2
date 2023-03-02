import 'package:flutter/material.dart';
import 'package:shaky_animated_listview/scroll_animator.dart';

class shaky_animated extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', theme: ThemeData.dark(), home: const Body());
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            btn1(context, "Show Grid animator", () {
              buildBottomBody(context);
            }),
            btn1(context, "Vertical List view animator", () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const VerticalList();
              }));
            }),
            btn1(context, "Vertical Grid view animator", () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const GridList();
              }));
            }),
            btn1(context, "Horizontal List view animator", () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const HorzList();
              }));
            }),
          ],
        ),
      ),
    );
  }

  Widget btn1(BuildContext context, String text, Function() click) {
    return MaterialButton(
      color: Colors.grey[900],
      minWidth: 300,
      onPressed: click,
      child: Text(text),
    );
  }

  void buildBottomBody(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext innerContext) {
          return Container(
            height: MediaQuery.of(innerContext).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: <Widget>[
                buildHeader(),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    // shrinkWrap: true,
                    children: List.generate(9, (i) => buildImage()).toList(),
                  ),
                )
              ],
            ),
          );
        });
  }
}

Widget buildImage() {
  return GridAnimatorWidget(
    child: Padding(
      padding: const EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          color: Colors.grey,
        ),
      ),
    ),
  );
}

Widget buildHeader() {
  return Padding(
    padding: const EdgeInsets.all(4),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: double.infinity,
        height: 150,
        color: Colors.black38,
        child: const Center(
            child: Text(
          "Grid animator",
          style: TextStyle(fontSize: 30, color: Colors.white),
        )),
      ),
    ),
  );
}

class GridList extends StatelessWidget {
  const GridList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: AnimatedGridView(
          duration: 100,
          crossAxisCount: 2,
          mainAxisExtent: 256,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: List.generate(
              21,
              (index) => Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.grey[700],
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 60,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://avatars.githubusercontent.com/u/30810111?v=4"),
                                //NetworkImage
                                radius: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))),
    ));
  }
}

class HorzList extends StatelessWidget {
  const HorzList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 200),
        child: AnimatedListView(
          duration: 100,
          scrollDirection: Axis.horizontal,
          children: List.generate(
            21,
            (index) => const Card(
              elevation: 50,
              margin: EdgeInsets.symmetric(horizontal: 10),
              shadowColor: Colors.black,
              color: Colors.grey,
              child: SizedBox(
                height: 300,
                width: 200,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VerticalList extends StatelessWidget {
  const VerticalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: AnimatedListView(
          // scrollDirection: Axis.horizontal,
          duration: 100,
          children: List.generate(
              21,
              (index) => Card(
                    elevation: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    shadowColor: Colors.black,
                    color: Colors.grey,
                    child: SizedBox(
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue[500],
                              radius: 60,
                              child: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://avatars.githubusercontent.com/u/30810111?v=4"),
                                //NetworkImage
                                radius: 50,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Scroll to start',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.blue[900],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Animated list demo',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))),
    ));
  }
}
