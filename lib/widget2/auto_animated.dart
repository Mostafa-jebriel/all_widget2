import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_animated/auto_animated.dart';

class AnimatedListPage extends StatefulWidget {
  AnimatedListPage({Key? key}) : super(key: key) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<AnimatedListPage> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    LiveListExample(),
    LiveGridExample(),
    SliverExample(),
    AnimateIfVisibleExample(),
    LiveIconButtonExample(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          backgroundColor: Colors.grey[100],
          scaffoldBackgroundColor: Colors.grey[200],
        ),
        home: Scaffold(
          body: _children[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                backgroundColor: Colors.white,
                label: 'List',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_on),
                backgroundColor: Colors.white,
                label: 'Grid',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.view_day),
                backgroundColor: Colors.white,
                label: 'Sliver',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.remove_red_eye),
                backgroundColor: Colors.white,
                label: 'On visibility',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle),
                backgroundColor: Colors.white,
                label: 'IconButton',
              ),
            ],
            currentIndex: _selectedIndex,
            // selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ),
      );
}

class LiveListExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: VerticalExample(),
              ),
            ],
          ),
        ),
      );
}

class VerticalExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LiveList(
        showItemInterval: Duration(milliseconds: 150),
        showItemDuration: Duration(milliseconds: 350),
        padding: EdgeInsets.all(16),
        reAnimateOnVisibility: true,
        scrollDirection: Axis.vertical,
        itemCount: 20,
        itemBuilder: animationItemBuilder(
          (index) => VerticalItem(title: index.toString()),
          padding: EdgeInsets.symmetric(vertical: 8),
        ),
      );
}

class SliverExample extends StatefulWidget {
  @override
  _SliverExampleState createState() => _SliverExampleState();
}

class _SliverExampleState extends State<SliverExample> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                sliver: LiveSliverList(
                  controller: _scrollController,
                  showItemInterval: Duration(milliseconds: 250),
                  showItemDuration: Duration(milliseconds: 300),
                  itemCount: 4,
                  itemBuilder: animationItemBuilder(
                      (index) => VerticalItem(title: index.toString()),
                      padding: EdgeInsets.symmetric(vertical: 8)),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                sliver: LiveSliverGrid(
                  controller: _scrollController,
                  delay: Duration(milliseconds: 250) * 5,
                  showItemInterval: Duration(milliseconds: 250),
                  showItemDuration: Duration(milliseconds: 300),
                  itemCount: 12,
                  itemBuilder: animationItemBuilder(
                    (index) => HorizontalItem(title: index.toString()),
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      );
}

class LiveGridExample extends StatefulWidget {
  @override
  _LiveGridExampleState createState() => _LiveGridExampleState();
}

class _LiveGridExampleState extends State<LiveGridExample> {
  int itemsCount = 20;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500) * 5, () {
      if (!mounted) {
        return;
      }
      setState(() {
        itemsCount += 10;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: LiveGrid(
            padding: EdgeInsets.all(16),
            showItemInterval: Duration(milliseconds: 50),
            showItemDuration: Duration(milliseconds: 150),
            visibleFraction: 0.001,
            itemCount: itemsCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: animationItemBuilder(
                (index) => HorizontalItem(title: index.toString())),
          ),
        ),
      );
}

class AnimateIfVisibleExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          // Wrapper before Scroll view!
          child: AnimateIfVisibleWrapper(
            showItemInterval: Duration(milliseconds: 150),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  for (int i = 0; i < 20; i++)
                    AnimateIfVisible(
                      key: Key('$i'),
                      builder: animationBuilder(
                        SizedBox(
                          width: double.infinity,
                          height: 128,
                          child: HorizontalItem(
                            title: '$i',
                          ),
                        ),
                        xOffset: i.isEven ? 0.15 : -0.15,
                        padding: EdgeInsets.all(16),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
}

class LiveIconButtonExample extends StatefulWidget {
  @override
  _LiveIconButtonExampleState createState() => _LiveIconButtonExampleState();
}

class _LiveIconButtonExampleState extends State<LiveIconButtonExample> {
  bool _externalState = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: AppBar(
                  primary: false,
                  title: Text('Auto animated Icon'),
                  // Implement animated icon
                  leading: LiveIconButton(
                    icon: AnimatedIcons.menu_close,
                    firstTooltip: 'Menu',
                    secondTooltip: 'Close',
                    onPressed: () {},
                  ),
                ),
              ),
              LiveIconButton.externalState(
                icon: AnimatedIcons.arrow_menu,
                onPressed: () {
                  setState(() {
                    _externalState = !_externalState;
                  });
                },
                iconState: !_externalState ? IconState.first : IconState.second,
              ),
              LiveIconButton(
                icon: AnimatedIcons.play_pause,
                onPressed: () {},
              ),
              LiveIconButton(
                icon: AnimatedIcons.search_ellipsis,
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
}

class VerticalItem extends StatelessWidget {
  const VerticalItem({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Container(
        height: 96,
        child: Card(
          child: Text(
            '$title a long title',
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
      );
}

class HorizontalItem extends StatelessWidget {
  const HorizontalItem({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Container(
        width: 140,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Material(
            color: Colors.white,
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
        ),
      );
}

/// Wrap Ui item with animation & padding
Widget Function(
  BuildContext context,
  int index,
  Animation<double> animation,
) animationItemBuilder(
  Widget Function(int index) child, {
  EdgeInsets padding = EdgeInsets.zero,
}) =>
    (
      BuildContext context,
      int index,
      Animation<double> animation,
    ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child(index),
            ),
          ),
        );

Widget Function(
  BuildContext context,
  Animation<double> animation,
) animationBuilder(
  Widget child, {
  double xOffset = 0,
  EdgeInsets padding = EdgeInsets.zero,
}) =>
    (
      BuildContext context,
      Animation<double> animation,
    ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(xOffset, 0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        );
