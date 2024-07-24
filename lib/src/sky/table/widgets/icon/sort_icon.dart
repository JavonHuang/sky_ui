import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sky_ui/src/styles/styles.dart';

import '../../sky_table.dart';

class SortIcon<T> extends StatefulWidget {
  const SortIcon({
    super.key,
    required this.onSort,
    required this.gridTableController,
    required this.orderBy,
  });
  final Function(String orderBy) onSort;
  final TableController<T> gridTableController;
  final String orderBy;
  @override
  _SortIconState createState() => _SortIconState();
}

class _SortIconState extends State<SortIcon> {
  late String orderBy = "";

  late final StreamSubscription<SkyTableEvent> _listener;

  @override
  void initState() {
    super.initState();
    setState(() {
      orderBy = widget.orderBy;
    });
    _listener = widget.gridTableController.skyTableEventStreamController.stream.listen((_) {
      if (_.eventName == SkyTableEventType.sort) {
        setState(() {
          orderBy = _.value;
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

  Color get ascTriangleColor {
    if (orderBy == 'asc') {
      return SkyColors().tableSortBgActive;
    } else {
      return SkyColors().tableSortBg;
    }
  }

  Color get descTriangleColor {
    if (orderBy == 'desc') {
      return SkyColors().tableSortBgActive;
    } else {
      return SkyColors().tableSortBg;
    }
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
              } else {
                orderBy = "";
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
              } else {
                orderBy = "";
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
