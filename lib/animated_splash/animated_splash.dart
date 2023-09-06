import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedSplash extends StatelessWidget {
  const AnimatedSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _circleWidthTween;
  late Animation _circleHeightTween;
  late Animation _triangleSizeTween;
  late Animation _triangleLeftTween;
  late Animation _triangleRightTween;
  late Animation _triangleTopTween;
  late Animation _rotationTween;
  late Animation _rect1Tween;
  late Animation _rect2Tween;
  late Animation _waveProgressTween;
  late Animation _waveOffsetYTween;
  late Animation _waveWidthTween;
  late Animation _waveHeightTween;
  late Animation _textSizeTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 3000,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (kDebugMode) {
            print('Animate completed');
          }
        }
      });

    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.linear);

    _circleWidthTween =
        HWAnimationConfig.circleWidthTweenSequence.animate(curvedAnimation);
    _circleHeightTween =
        HWAnimationConfig.circleHeightTweenSequence.animate(curvedAnimation);
    _triangleSizeTween =
        HWAnimationConfig.triangleSizeTweenSequence.animate(curvedAnimation);
    _triangleLeftTween =
        HWAnimationConfig.triangleLeftTweenSequence.animate(curvedAnimation);
    _triangleRightTween =
        HWAnimationConfig.triangleRightTweenSequence.animate(curvedAnimation);
    _triangleTopTween =
        HWAnimationConfig.triangleTopTweenSequence.animate(curvedAnimation);
    _rotationTween =
        HWAnimationConfig.rotationTweenSequence.animate(curvedAnimation);
    _rect1Tween = HWAnimationConfig.rectTweenSequence1.animate(curvedAnimation);
    _rect2Tween = HWAnimationConfig.rectTweenSequence2.animate(curvedAnimation);
    _waveProgressTween =
        HWAnimationConfig.waveTweenSequence.animate(curvedAnimation);
    _waveOffsetYTween =
        HWAnimationConfig.waveOffsetYTweenSequence.animate(curvedAnimation);
    _waveWidthTween = HWAnimationConfig.waveWidthTweenSequence
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _waveHeightTween = HWAnimationConfig.waveHeightTweenSequence
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _textSizeTween = HWAnimationConfig.textSizeTweenSequence
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Center(
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(math.pi * _rotationTween.value),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Container(
                    color: Colors.purple,
                    height: _circleHeightTween.value,
                    width: _circleWidthTween.value,
                  ),
                ),
                SizedBox(
                  height: _triangleSizeTween.value,
                  width: _triangleSizeTween.value,
                  child: CustomPaint(
                    painter: TrianglePainter(
                      left: _triangleLeftTween.value,
                      right: _triangleRightTween.value,
                      top: _triangleTopTween.value,
                    ),
                  ),
                ),
                SizedBox(
                  height: _triangleSizeTween.value,
                  width: _triangleSizeTween.value,
                  child: CustomPaint(
                    painter: SquarePainter(progress: _rect1Tween.value),
                  ),
                ),
                SizedBox(
                  height: _triangleSizeTween.value,
                  width: _triangleSizeTween.value,
                  child: CustomPaint(
                    painter: SquarePainter(
                      progress: _rect2Tween.value,
                      color: Colors.purple,
                    ),
                  ),
                ),
                SizedBox(
                  height: _waveHeightTween.value,
                  width: _waveWidthTween.value,
                  child: WaveProgress(
                    size: 120,
                    borderWidth: 0.0,
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    waveColor: Colors.purple,
                    progress: 100.0 * _waveProgressTween.value,
                    offsetY: _waveOffsetYTween.value,
                  ),
                ),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: _textSizeTween.value,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.stop();
    _controller.dispose();
  }
}

class HWAnimationConfig {
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
  static double screenWidth = mediaQuery.size.width;
  static double screenHeight = mediaQuery.size.height;
  static TweenSequence circleWidthTweenSequence = TweenSequence([
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 120.0), weight: 5),
    TweenSequenceItem(tween: Tween(begin: 120.0, end: 130.0), weight: 10),
    TweenSequenceItem(tween: Tween(begin: 130.0, end: 120.0), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(120.0), weight: 20),
    TweenSequenceItem(tween: Tween(begin: 120.0, end: 0.0), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 45),
  ]);
  static TweenSequence circleHeightTweenSequence = TweenSequence([
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 120.0), weight: 5),
    TweenSequenceItem(tween: ConstantTween<double>(120.0), weight: 20),
    TweenSequenceItem(tween: Tween(begin: 120.0, end: 130.0), weight: 10),
    TweenSequenceItem(tween: Tween(begin: 130.0, end: 120.0), weight: 10),
    TweenSequenceItem(tween: Tween(begin: 120.0, end: 0.0), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 45),
  ]);
  static TweenSequence triangleSizeTweenSequence = TweenSequence([
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 120.0), weight: 15),
    TweenSequenceItem(tween: ConstantTween<double>(120.0), weight: 85),
  ]);

  static TweenSequence triangleLeftTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(0.2), weight: 15),
    TweenSequenceItem(tween: Tween(begin: 0.2, end: 0.02), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(0.02), weight: 75),
  ]);
  static TweenSequence triangleRightTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(0.8), weight: 25),
    TweenSequenceItem(tween: Tween(begin: 0.8, end: 0.98), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(0.98), weight: 65),
  ]);
  static TweenSequence triangleTopTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(0.05), weight: 35),
    TweenSequenceItem(tween: Tween(begin: 0.05, end: -0.1), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(-0.1), weight: 55),
  ]);

  static TweenSequence rotationTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 45),
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 2.0), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(2.0), weight: 45),
  ]);

  static TweenSequence rectTweenSequence1 = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 55),
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 10),
    TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 35),
  ]);
  static TweenSequence rectTweenSequence2 = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 65),
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(1.0), weight: 25),
  ]);
  static TweenSequence waveTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 75),
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(1.0), weight: 15),
  ]);
  static TweenSequence waveOffsetYTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(-15.0), weight: 95),
    TweenSequenceItem(tween: Tween(begin: -15.0, end: 0.0), weight: 5),
  ]);

  static TweenSequence waveWidthTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(120.0), weight: 80),
    TweenSequenceItem(tween: Tween(begin: 120.0, end: screenWidth), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(screenWidth), weight: 10),
  ]);
  static TweenSequence waveHeightTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(120.0), weight: 80),
    TweenSequenceItem(
      tween: Tween(begin: 120.0, end: screenHeight),
      weight: 10,
    ),
    TweenSequenceItem(
      tween: ConstantTween<double>(screenHeight),
      weight: 10,
    ),
  ]);

  static TweenSequence textSizeTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(0), weight: 85),
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 30.0), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(50), weight: 5),
  ]);
}

class SquarePainter extends CustomPainter {
  double progress;
  Color color;
  final Paint _paint = Paint()
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5;

  SquarePainter({
    required this.progress,
    this.color = Colors.purple,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _paint.color = color;
    if (progress > 0) {
      var path = createPath(4, size.width);
      PathMetric pathMetric = path.computeMetrics().first;
      Path extractPath =
          pathMetric.extractPath(0.0, pathMetric.length * progress);
      canvas.drawPath(extractPath, _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  Path createPath(int sides, double radius) {
    Path path = Path();
    double wFartor = 0.02;
    double hFactor = 0.85;
    double tFactor = 0.10;
    path.moveTo(wFartor * radius, hFactor * radius);
    for (int i = 1; i <= sides; i++) {
      double x, y;
      if (i == 1) {
        x = wFartor * radius;
        y = -tFactor * radius;
      } else if (i == 2) {
        x = radius;
        y = -tFactor * radius;
      } else if (i == 3) {
        x = radius;
        y = radius * hFactor;
      } else {
        x = wFartor * radius;
        y = radius * hFactor;
      }
      path.lineTo(x, y);
    }
    path.close();
    return path;
  }
}

class WaveProgress extends StatefulWidget {
  final double size, progress, offsetY, borderWidth;
  final Color backgroundColor, waveColor, borderColor;

  const WaveProgress({
    super.key,
    this.size = 200.0,
    this.backgroundColor = Colors.blue,
    this.waveColor = Colors.white,
    this.borderColor = Colors.white,
    this.borderWidth = 10.0,
    this.progress = 50.0,
    this.offsetY = 0.0,
  })  : assert(progress >= 0 && progress <= 100,
            'Valid range of progress value is [0.0, 100.0]'),
        assert(offsetY >= -15 && offsetY <= 0,
            'This value offsetY mast [-10.0, 0.0]');

  @override
  State<WaveProgress> createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return (widget.progress > 0 && widget.progress < 100)
              ? CustomPaint(
                  painter: WaveWidgetPainter(
                      animation: _animationController,
                      backgroundColor: widget.backgroundColor,
                      waveColor: widget.waveColor,
                      borderColor: widget.borderColor,
                      borderWidth: widget.borderWidth,
                      progress: widget.progress),
                )
              : Transform.translate(
                  offset: Offset(0, widget.offsetY),
                  child: Container(
                    color: widget.progress == 100
                        ? widget.waveColor
                        : Colors.transparent,
                    width: widget.progress == 100 ? widget.size : 0,
                    height: widget.progress == 100 ? widget.size : 0,
                  ),
                );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class WaveWidgetPainter extends CustomPainter {
  Animation<double> animation;
  Color backgroundColor, waveColor, borderColor;
  double borderWidth, progress;

  WaveWidgetPainter({
    required this.animation,
    required this.backgroundColor,
    required this.waveColor,
    required this.borderColor,
    required this.borderWidth,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    Offset center = Offset(size.width / 2, size.height / 2 - 15);
    double radius = math.min(size.width / 2 - 5, size.height / 2 - 5);

    canvas.drawRect(
      Rect.fromCircle(center: center, radius: radius),
      backgroundPaint,
    );

    Paint wavePaint = Paint()..color = waveColor;

    double amp = 2.0;
    double p = progress / 100.0;
    double baseHeight = (1 - p) * size.height;

    Path path = Path();
    path.moveTo(0.0, baseHeight);
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(
          i,
          baseHeight +
              math.sin((i / size.width * 2 * math.pi) +
                      (animation.value * 2 * math.pi)) *
                  amp -
              15);
    }

    path.lineTo(size.width, size.height - 15);
    path.lineTo(0.0, size.height - 15);
    path.close();
    canvas.drawPath(path, wavePaint);

    Paint borderPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawRect(
        Rect.fromCircle(center: center, radius: radius), borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TrianglePainter extends CustomPainter {
  Color? color;
  final Paint _paint = Paint()
    ..strokeWidth = 5.0
    ..color = Colors.purple
    ..isAntiAlias = true
    ..strokeJoin = StrokeJoin.round;
  final Path _path = Path();
  double left, right, top;

  TrianglePainter({
    required this.left,
    required this.right,
    required this.top,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    _path.moveTo(left * width, 0.85 * height);
    _path.lineTo(right * width, 0.85 * height);
    _path.lineTo(0.5 * width, top * height);
    _path.close();
    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class SquareEdge extends StatefulWidget {
  final Color color;
  final double size;

  const SquareEdge({
    Key? key,
    this.color = Colors.blue,
    this.size = 50.0,
  }) : super(key: key);

  @override
  _SquareEdge createState() => new _SquareEdge();
}

class _SquareEdge extends State<SquareEdge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _animation = Tween(begin: -180.0, end: 180.0).animate(_controller);
    _controller..repeat();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var anim = 1;
    return new Center(
      child: new Stack(
        children: <Widget>[
          _animWidget(_animation.value * anim, widget.color),
        ],
      ),
    );
  }

  Widget _animWidget(angle, Color color) => new Transform(
        transform: new Matrix4.rotationZ(angle * 0.0174533),
        alignment: FractionalOffset.center,
        child: new Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [color, color.withOpacity(0.5)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  tileMode: TileMode.repeated),
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.all(new Radius.circular(
                  widget.size / 2 * (angle < 0 ? -angle / 180 : angle / 180))),
              border: new Border.all(color: color, width: 1.0),
              boxShadow: [
                new BoxShadow(
                    color: color.withOpacity(0.5),
                    blurRadius: widget.size / 2,
                    spreadRadius: (angle < 0 ? -angle / 18 : angle / 18))
              ]),
        ),
      );
}
