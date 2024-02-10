import 'package:flutter/material.dart';

class signature extends StatefulWidget {
  const signature({Key? key}) : super(key: key);

  @override
  State<signature> createState() => _signatureState();
}

class _signatureState extends State<signature> {
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:100),
      child: Container(
        height: 100,
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              RenderBox referenceBox = context.findRenderObject() as RenderBox;
              Offset localPosition =
                  referenceBox.globalToLocal(details.globalPosition);
             if (localPosition.dx >= 0 &&
                localPosition.dy >= 0 &&
                localPosition.dx <= referenceBox.size.width &&
                localPosition.dy <= referenceBox.size.height) {
              _points = List.from(_points)..add(localPosition);
      }
            });
          },
          onPanEnd: (DragEndDetails details) {
            _points.add(Offset.zero);
          },
          child: CustomPaint(
            painter: painter(_points),
            size: Size.infinite,
          ),
        ),
      ),
    );
  }
}

class painter extends CustomPainter {
  final List<Offset> points;
  painter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
