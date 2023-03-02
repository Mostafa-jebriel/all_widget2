import 'package:flutter/material.dart';
import 'package:rating_summary/rating_summary.dart';

class rating_summary_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rating Summary Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rating Summary Example'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: RatingSummary(
          counter: 13,
          average: 3.846,
          counterFiveStars: 5,
          counterFourStars: 4,
          counterThreeStars: 2,
          counterTwoStars: 1,
          counterOneStars: 1,
        ),
      ),
    );
  }
}
