import 'package:flutter/material.dart';
import 'package:loadmore_listview/loadmore_listview.dart';
import 'dart:math';

class loadmore extends StatefulWidget {
  @override
  State<loadmore> createState() => _MyAppState();
}

class _MyAppState extends State<loadmore> {
  bool _hasNext = true;
  List<String> list = [];
  final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  final Random _rnd = Random();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getList());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Load More and Refresh'),
        ),
        body: Column(
          children: [
            Expanded(
              child: LoadMoreListView.separated(
                hasMoreItem: _hasNext,
                onLoadMore: loaMoreList,
                onRefresh: refreshList,
                refreshBackgroundColor: Colors.blueAccent,
                refreshColor: Colors.white,
                loadMoreWidget: Container(
                  margin: const EdgeInsets.all(20.0),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                  ),
                ),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(30),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(list[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future getList() async {
    list.clear();
    setState(() {
      for (int i = 0; i < 20; i++) {
        list.add(getRandomString(10));
      }
    });
  }

  Future refreshList() async {
    list.clear();
    await loaMoreList();
  }

  Future loaMoreList() async {
    await Future.delayed(const Duration(seconds: 1)); //await API Response
    setState(() {
      for (int i = 0; i < 20; i++) {
        list.add(getRandomString(10));
      }
      _hasNext = list.length < 100;
    });
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
