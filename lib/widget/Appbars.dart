import 'package:flutter/material.dart';

class ShapeAppBar extends StatefulWidget {
  @override
  State<ShapeAppBar> createState() => _ShapeAppBarState();
}

class _ShapeAppBarState extends State<ShapeAppBar> {
  int x = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(x),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text("AppBar"),
            MaterialButton(
              onPressed: () {
                setState(() {
                  x = 0;
                });
              },
              child: Text(
                "Appbar 0",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.indigo,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  x = 1;
                });
              },
              child: Text(
                "Appbar 1",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.indigo,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  x = 2;
                });
              },
              child: Text(
                "Appbar 2",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.indigo,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  x = 3;
                });
              },
              child: Text(
                "Appbar 3",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.indigo,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  x = 4;
                });
              },
              child: Text(
                "Appbar 4",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.indigo,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  x = 5;
                });
              },
              child: Text(
                "Appbar 5",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.indigo,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  x = 6;
                });
              },
              child: Text(
                "Appbar 6",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(int x) {
    if (x == 0) {
      return AppBar(
        title: Text("AppBar"),
        centerTitle: true,
        automaticallyImplyLeading: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      );
    } else if (x == 1) {
      return AppBar(
        title: Text("AppBar"),
        centerTitle: true,
        elevation: 20,
        backgroundColor: Colors.red,
        automaticallyImplyLeading: true,
        actions: [Icon(Icons.search_rounded)],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: SizedBox(),
        ),
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 5, color: Colors.black),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(2000),
                bottomRight: Radius.circular(1000))),
      );
    } else if (x == 2) {
      return AppBar(
        elevation: 20,
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: true,
        actions: [Icon(Icons.search_rounded)],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  "Mostafa",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200))),
      );
    } else if (x == 3) {
      return AppBar(
        elevation: 20,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        actions: [Icon(Icons.search_rounded)],
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(200),
          ),
          child: Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
              Colors.white,
              Colors.blueGrey,
              Colors.blue,
              Colors.red,
              Colors.black,
            ])),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  "Mostafa",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200))),
      );
    } else if (x == 4) {
      return AppBar(
        elevation: 20,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        actions: [Icon(Icons.search_rounded)],
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(600),
          ),
          child: Container(
            decoration: BoxDecoration(
                gradient: SweepGradient(colors: [
              Colors.white,
              Colors.blueGrey,
              Colors.blue,
              Colors.red,
              Colors.black,
            ])),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  "Mostafa",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(600))),
      );
    } else if (x == 5) {
      return AppBar(
        elevation: 20,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        actions: [Icon(Icons.search_rounded)],
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(600),
          ),
          child: Container(
            decoration: BoxDecoration(
                gradient: SweepGradient(endAngle: 1, colors: [
              Colors.white,
              Colors.blueGrey,
              Colors.blue,
              Colors.red,
              Colors.black,
            ])),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Text(
                  "Mostafa",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 250,
              )
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(600))),
      );
    } else if (x == 6) {
      return AppBar(
        title: Text("ImageAppBar"),
        centerTitle: true,
        elevation: 20,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        actions: [Icon(Icons.search_rounded)],
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(200),
            bottomRight: Radius.circular(200),
          ),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/s3.jpg"),
                    fit: BoxFit.fill)),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Text(
                  "Mostafa",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(200),
          bottomRight: Radius.circular(200),
        )),
      );
    } else {
      return AppBar(
        title: Text("AppBar"),
        centerTitle: true,
        backgroundColor: Colors.red,
        automaticallyImplyLeading: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      );
    }
  }
}
