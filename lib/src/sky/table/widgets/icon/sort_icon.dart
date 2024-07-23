import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sky_ui/src/styles/styles.dart';

import '../../sky_table.dart';

class SortIcon<T> extends StatefulWidget {
  const SortIcon({
    super.key,
    required this.onSort,
    required this.gridTableController,
  });
  final Function(String orderBy) onSort;
  final TableController<T> gridTableController;

  @override
  _SortIconState createState() => _SortIconState();
}

class _SortIconState extends State<SortIcon> {
  Color ascTriangleColor = SkyColors().tableSortBg;
  Color descTriangleColor = SkyColors().tableSortBg;

  late String orderBy = "";

  late final StreamSubscription<SkyTableEvent> _listener;

  @override
  void initState() {
    super.initState();
    _listener = widget.gridTableController.skyTableEventStreamController.stream.listen((_) {
      if (_.eventName == SkyTableEventType.sort) {
        setState(() {
          orderBy = _.value;
          descTriangleColor = SkyColors().tableSortBg;
          ascTriangleColor = SkyColors().tableSortBg;
        });
      }
    });
  }

  @override
  void dispose() {
    _listener.pause();
    _listener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (orderBy == "" || orderBy == 'desc') {
                orderBy = 'asc';
                ascTriangleColor = SkyColors().tableSortBgActive;
                descTriangleColor = SkyColors().tableSortBg;
              } else {
                orderBy = "";
                ascTriangleColor = SkyColors().tableSortBg;
              }
              setState(() {});
              widget.onSort(orderBy);
            },
            child: CustomPaint(
              size: const Size(12.0, 8.0),
              painter: TrianglePainter(ascTriangleColor, 'asc'),
            ),
          ),
          const SizedBox(height: 2),
          GestureDetector(
            onTap: () {
              if (orderBy == "" || orderBy == 'asc') {
                orderBy = 'desc';
                descTriangleColor = SkyColors().tableSortBgActive;
                ascTriangleColor = SkyColors().tableSortBg;
              } else {
                orderBy = "";
                descTriangleColor = SkyColors().tableSortBg;
              }
              setState(() {});
              widget.onSort(orderBy);
            },
            child: CustomPaint(
              size: const Size(12.0, 8.0),
              painter: TrianglePainter(descTriangleColor, 'desc'),
            ),
          )
        ],
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
    if (type == 'asc') {
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
