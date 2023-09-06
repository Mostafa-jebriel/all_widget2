import 'dart:math';

import 'package:flutter/material.dart';

class PencilLoaderHome extends StatefulWidget {
  @override
  State<PencilLoaderHome> createState() => _PencilLoaderHomeState();
}

class _PencilLoaderHomeState extends State<PencilLoaderHome> {
  int currentDuration = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0DCF9),
      appBar: AppBar(
        title: Text("PencilLoaderHome"),
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: PencilLoader(duration: currentDuration),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: neoPopButton(
                  sec: 5,
                  isSelected: currentDuration == 5,
                  onTap: () {
                    currentDuration = 5;
                  },
                ),
              ),
              Flexible(
                child: neoPopButton(
                  sec: 10,
                  isSelected: currentDuration == 10,
                  onTap: () {
                    currentDuration = 10;
                  },
                ),
              ),
              Flexible(
                child: neoPopButton(
                  sec: 15,
                  isSelected: currentDuration == 15,
                  onTap: () {
                    currentDuration = 15;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }

  Padding neoPopButton(
      {required int sec, bool isSelected = false, required Function onTap}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: NeoPopWidget(
        height: 50,
        width: 50,
        padding: EdgeInsets.zero,
        shadowOffset: const Offset(4, 4),
        backgroundColor: isSelected
            ? const Color.fromARGB(255, 147, 245, 218)
            : Colors.white,
        onTap: () {
          setState(() {
            onTap();
          });
        },
        child: Center(
          child: Text(
            "${sec}s",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class PencilLoader extends StatefulWidget {
  const PencilLoader({super.key, required this.duration});

  final int duration;

  @override
  State<PencilLoader> createState() => _PencilLoaderState();
}

class _PencilLoaderState extends State<PencilLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimationFirst;
  late Animation<double> _rotationAnimationSecond;
  late Animation<double> _strokeAnimationFirst;
  late Animation<double> _strokeAnimationSecond;
  late Animation<double> _pencilSizeAnimationSweepAngleFirst;
  late Animation<double> _pencilSizeAnimationSweepAngleSecond;
  late Animation<double> _skewAnimation;
  double strokeWidth = 15;
  double startAngle =
      (-2 * pi / 3) + pi / 10; // pi/10 is offset due to pencil nib

  @override
  void initState() {
    super.initState();
    initializeAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PencilLoader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _animationController.duration = Duration(
          seconds: widget
              .duration); // Update animation duration if widget's duration changes
      _animationController.repeat(); // Restart animation with new duration
    }
  }

  initializeAnimation() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: widget.duration))
      ..repeat();
    _strokeAnimationFirst = Tween<double>(begin: -2 * pi / 3, end: 2 * pi / 3)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0, 0.5),
    ));
    _strokeAnimationSecond = Tween<double>(begin: -2 * pi / 3, end: 2 * pi / 3)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.5, 0.75),
    ));
    _rotationAnimationFirst = Tween<double>(begin: 0, end: 4 * pi / 3).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.5),
      ),
    );
    _rotationAnimationSecond =
        Tween<double>(begin: 4 * pi / 3, end: 4 * pi).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1),
      ),
    );
    _skewAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.42, 0.75),
      ),
    );
    _pencilSizeAnimationSweepAngleFirst =
        Tween<double>(begin: pi / 6, end: (2 * pi / 3) + pi / 10)
            .animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0, 0.5),
    ));
    _pencilSizeAnimationSweepAngleSecond =
        Tween<double>(begin: (2 * pi / 3) + pi / 10, end: pi / 6)
            .animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.5, 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Animated pencil stroke animation
        AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return CustomPaint(
                painter: PencilStrokePainter(
                  strokeWidth: strokeWidth,
                  startAngle: _strokeAnimationSecond.value,
                  sweepAngle: _strokeAnimationFirst.value -
                      _strokeAnimationSecond
                          .value, // subtracting with _strokeAnimationEnd.value to make it still or balanced
                ),
              );
            }),

        // Animated pencil body and eraser animations
        AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return Transform.rotate(
                angle: _animationController.value < 0.5
                    ? _rotationAnimationFirst.value
                    : _rotationAnimationSecond.value,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Pencil body animation
                    CustomPaint(
                        painter: PencilBodyPainter(
                      strokeWidth: strokeWidth,
                      startAngle: startAngle,
                      sweepAngle: _animationController.value < 0.5
                          ? _pencilSizeAnimationSweepAngleFirst.value
                          : _pencilSizeAnimationSweepAngleSecond.value,
                    )),

                    // Pencil eraser animation
                    CustomPaint(
                      painter: PencilEraserPainter(
                        strokeWidth: strokeWidth,
                        sweepAngle: startAngle +
                            (_animationController.value < 0.5
                                ? _pencilSizeAnimationSweepAngleFirst.value
                                : _pencilSizeAnimationSweepAngleSecond.value),
                        skewAngle: 0.18 * sin(7 * _skewAnimation.value),
                      ),
                    ),

                    // Pencil nib animation
                    CustomPaint(
                      painter: PencilPointPainter(
                        strokeWidth: strokeWidth,
                        startAngle: startAngle,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }
}

class NeoPopWidget extends StatefulWidget {
  const NeoPopWidget({
    super.key,
    this.child,
    this.onTap,
    this.shadowColor = Colors.black,
    this.shadowOffset = const Offset(5, 5),
    this.boderRadius = 10,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    this.animate = true,
    this.backgroundColor = Colors.white,
    this.width = double.infinity,
    required this.height,
  });

  final Widget? child;
  final Function? onTap;
  final Color shadowColor;
  final Color backgroundColor;
  final Offset shadowOffset;
  final double boderRadius;
  final EdgeInsetsGeometry? padding;
  final double width;
  final double height;
  final bool animate;

  @override
  State<NeoPopWidget> createState() => _NeoPopWidgetState();
}

class _NeoPopWidgetState extends State<NeoPopWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _animation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(5, 5))
            .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.animate) {
          _controller.forward().then((value) => _controller.reverse());
        }
        if (widget.onTap != null) widget.onTap!();
      },
      child: Stack(
        children: [
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(widget.boderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: widget.shadowOffset,
                ),
              ],
            ),
          ),
          AnimatedBuilder(
              animation: _animation,
              builder: (context, _) {
                return Transform.translate(
                  offset: _animation.value,
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                    padding: widget.padding,
                    decoration: BoxDecoration(
                      color: widget.backgroundColor,
                      borderRadius: BorderRadius.circular(widget.boderRadius),
                      border: Border.all(
                        color: widget.shadowColor,
                        width: 2,
                      ),
                    ),
                    child: widget.child,
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class PencilStrokePainter extends CustomPainter {
  final double startAngle;
  final double sweepAngle;
  final double strokeWidth;

  PencilStrokePainter(
      {this.startAngle = -2 * pi / 3,
      this.sweepAngle = 4 * pi / 3,
      this.strokeWidth = 12});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.height, size.width) / 2;
    final center = Offset(radius, radius);

    Paint pencilStrokePaint = Paint()
      ..color = const Color(0xFF6E6C6C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth / 2
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 1.7),
      startAngle,
      sweepAngle,
      false,
      pencilStrokePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PencilPointPainter extends CustomPainter {
  final double startAngle;
  final double strokeWidth;

  PencilPointPainter({
    this.startAngle = 0,
    this.strokeWidth = 12,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.height, size.width) / 2;
    final center = Offset(radius, radius);

    Paint pencilPoint = Paint()
      ..color = const Color(0xFFF7B96E)
      ..style = PaintingStyle.fill;

    Paint pencilPointShadow = Paint()
      ..color = const Color(0xFFF78E0D)
      ..style = PaintingStyle.fill;

    Path trinaglePath = Path();

    double innerRadius = radius - 2.5 * strokeWidth;
    double outerRadius = radius + 0.5 * strokeWidth;
    double midRadius = radius - 0.5 * strokeWidth;

    Offset trianglePointA = center.translate(
        innerRadius * cos(startAngle), innerRadius * sin(startAngle));
    Offset trianglePointB = center.translate(
        outerRadius * cos(startAngle), outerRadius * sin(startAngle));
    Offset trianglePointC = center.translate(
        midRadius * cos(startAngle - pi / 9),
        midRadius * sin(startAngle - pi / 9));
    trinaglePath
        .addPolygon([trianglePointA, trianglePointB, trianglePointC], true);
    canvas.drawPath(trinaglePath, pencilPoint);
    //drawing nib shadow
    Path trinaglePathShadow = Path();
    double radiusForShadow = innerRadius + strokeWidth;
    trianglePointB = center.translate(
        radiusForShadow * cos(startAngle), radiusForShadow * sin(startAngle));
    trinaglePathShadow
        .addPolygon([trianglePointA, trianglePointB, trianglePointC], true);
    canvas.drawPath(trinaglePathShadow, pencilPointShadow);
    // drawing nib
    Paint pencilPointDark = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    //saving the previous state in stack
    canvas.save();
    //cliping the black portion
    canvas
        .clipRect(Rect.fromCircle(center: trianglePointC, radius: strokeWidth));
    canvas.drawPath(trinaglePath, pencilPointDark);
    //poping the previous state from the stack
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PencilEraserPainter extends CustomPainter {
  final double sweepAngle;
  final double skewAngle;
  final double strokeWidth;

  PencilEraserPainter({
    this.sweepAngle = 4 * pi / 3,
    this.skewAngle = 0,
    this.strokeWidth = 12,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.height, size.width) / 2;
    final center = Offset(radius, radius);
    final double eraserHeight = 6 * strokeWidth;
    final double eraserWidth = 3 * strokeWidth;
    final double eraserHolderHeight = 0.7 * eraserHeight;

    Paint eraserBodyPaint = Paint()
      ..color = const Color(0xFF7B84FC)
      ..style = PaintingStyle.fill;
    Paint eraserBodyShadowPaint = Paint()
      ..color = const Color(0xFF636CEE)
      ..style = PaintingStyle.fill;
    Paint eraserHolderPaint = Paint()
      ..color = const Color(0xFFF2F2F1)
      ..style = PaintingStyle.fill;
    Paint eraserHolderLinePaint = Paint()
      ..color = const Color(0xFFC9C5C5)
      ..style = PaintingStyle.fill;
    Paint eraserHolderCoverPaint1 = Paint()
      ..color = Colors.grey.withOpacity(0.7)
      ..style = PaintingStyle.fill;
    Paint eraserHolderCoverPaint2 = Paint()
      ..color = Colors.grey.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    // Calculate the center of the eraser
    Offset eraserCenter = center.translate(
        (radius - strokeWidth) * cos(sweepAngle),
        (radius - strokeWidth) * sin(sweepAngle));

    // Shift the origin of the canvas to the eraser center
    canvas.translate(eraserCenter.dx, eraserCenter.dy); // new origin

    // Rotate the canvas as per the sweepAngle
    canvas.rotate(sweepAngle);

    // skewing the visible portion of the eraser
    canvas.transform(Matrix4.skewX(skewAngle).storage);

    // Create a rectangle covering the entire eraser, and then apply clipping to remove the excess parts.
    // Clipping is performed from the center of the eraser. This technique maintains the base of the eraser fixed at the center,
    // ensuring that the center portion remains static even if the skewAngle changes.
    canvas.clipRect(Rect.fromLTWH(-eraserWidth, 0, eraserHeight * 2,
        eraserHeight)); // clipping the rubber from center,

    // Draw the main body of the eraser

    canvas.drawRRect(
        RRect.fromRectXY(
            Rect.fromCenter(
                center: const Offset(0, 0),
                width: eraserWidth,
                height: eraserHeight),
            7,
            7),
        eraserBodyPaint);

    // Draw shadow on the eraser body
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromCenter(
                center: Offset(-strokeWidth, 0),
                width: 0.8 * strokeWidth,
                height: eraserHeight),
            bottomLeft: const Radius.circular(7),
            topLeft: const Radius.circular(7)),
        eraserBodyShadowPaint);

    // Draw the eraser holder
    canvas.drawRect(
        Rect.fromCenter(
            center: const Offset(0, 0),
            width: eraserWidth,
            height: eraserHolderHeight),
        eraserHolderPaint);
    // Draw lines on the eraser holder
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(0, eraserHolderHeight / 3),
            width: eraserWidth,
            height: 2),
        eraserHolderLinePaint);
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(0, eraserHolderHeight / 6),
            width: eraserWidth,
            height: 2),
        eraserHolderLinePaint);

    // Draw covers on the eraser holder
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(-strokeWidth, 0),
            width: 0.9 * strokeWidth,
            height: eraserHolderHeight),
        eraserHolderCoverPaint1);
    canvas.drawRect(
        Rect.fromCenter(
            center: const Offset(0, 0),
            width: strokeWidth,
            height: eraserHolderHeight),
        eraserHolderCoverPaint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PencilBodyPainter extends CustomPainter {
  final double startAngle;
  final double sweepAngle;
  final double strokeWidth;

  PencilBodyPainter({
    this.startAngle = 0,
    this.sweepAngle = 4 * pi / 3,
    this.strokeWidth = 12,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate radius and center of the drawing area
    final radius = min(size.height, size.width) / 2;
    final center = Offset(radius, radius);

    // Define different paints for the three segments of the pencil body
    Paint pencilBodyPaint1 = Paint()
      ..color = const Color(0xFFC4452D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    Paint pencilBodyPaint2 = Paint()
      ..color = const Color(0xFF141110)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    Paint pencilBodyPaint3 = Paint()
      ..color = const Color(0xFFC8634E)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Draw the first segment of the pencil body
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 2 * strokeWidth),
      startAngle,
      sweepAngle,
      false,
      pencilBodyPaint1,
    );

    // Draw the second segment of the pencil body
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth),
      startAngle,
      sweepAngle,
      false,
      pencilBodyPaint2,
    );

    // Draw the third segment of the pencil body
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      pencilBodyPaint3,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint when requested
  }
}
