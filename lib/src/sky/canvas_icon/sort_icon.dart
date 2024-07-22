import 'package:flutter/material.dart';

class TriangleColorChanger extends StatefulWidget {
  const TriangleColorChanger({
    super.key,
    this.type = 'up',
  });
  final String type;
  @override
  _TriangleColorChangerState createState() => _TriangleColorChangerState();
}

class _TriangleColorChangerState extends State<TriangleColorChanger> {
  Color triangleColor = Colors.blue;

  void changeColor() {
    // 这里可以设置为随机颜色或其他逻辑
    setState(() {
      triangleColor = Colors.red; // 举例：更改为红色
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) {
        setState(() {
          triangleColor = Colors.red; // 举例：更改为红色
        });
      },
      onExit: (e) {
        setState(() {
          triangleColor = Colors.blue;
        });
      },
      child: CustomPaint(
        size: const Size(15.0, 10.0),
        painter: TrianglePainter(triangleColor, widget.type),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color triangleColor;
  final String type;
  TrianglePainter(this.triangleColor, this.type);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = triangleColor
      ..style = PaintingStyle.fill;

    final path = Path();
    if (type == 'up') {
      path.moveTo(size.width / 2, 0.0);
      path.lineTo(0.0, size.height);
      path.lineTo(size.width, size.height);
    } else {
      path.moveTo(0.0, 0.0);
      path.lineTo(size.width, 0.0);
      path.lineTo(size.width / 2, size.height);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return (oldDelegate as TrianglePainter).triangleColor != triangleColor;
  }
}
