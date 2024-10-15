part of '../styles.dart';

class SkyShadows {
  const SkyShadows._();
  static BoxShadow tbFixedRight = const BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.1),
    offset: Offset(-1.0, -1), //阴影y轴偏移量
    blurRadius: 2, //阴影模糊程度
    spreadRadius: 1, //阴影扩散
  );
  static BoxShadow tbFixedLeft = const BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.1),
    offset: Offset(1.0, -1),
    blurRadius: 2,
    spreadRadius: 1,
  );
  static BoxShadow context = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    offset: const Offset(0, 2),
    blurRadius: 6,
    spreadRadius: 0,
  );
}

enum SkyPlacement {
  topCenter,
  topStart,
  topEnd,
  bottomCenter,
  bottomStart,
  bottomEnd,
  leftCenter,
  leftStart,
  leftEnd,
  rightCenter,
  rightStart,
  rightEnd;
}

class SkyDecoration extends Decoration {
  final Color? color;
  final Color borderColor;
  final Size boxSize;
  final double shiftX;
  final List<BoxShadow>? shadows;
  final Radius radius;
  final PaintingStyle style;
  final SkyPlacement placement;

  const SkyDecoration({
    this.color,
    required this.boxSize,
    this.shadows,
    required this.borderColor,
    required this.shiftX,
    required this.style,
    required this.radius,
    required this.placement,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return SkyShadowsBoxPainter(this);
  }
}

class SkyShadowsBoxPainter extends BoxPainter {
  final SkyDecoration decoration;

  SkyShadowsBoxPainter(this.decoration);
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Size? size = configuration.size;
    if (size == null) return;

    Paint paint = Paint()..color = decoration.color ?? Colors.black;
    Path path = buildPath(offset.translate(-decoration.shiftX, 0), size.width, size.height);
    path = Path.combine(PathOperation.union, path, Path()..addRRect(RRect.fromRectAndRadius(offset & size, decoration.radius)));
    canvas.drawPath(
        path,
        Paint()
          ..style
          ..color = decoration.color ?? Colors.black);
    if (decoration.style == PaintingStyle.stroke) {
      canvas.drawPath(
          path,
          paint
            ..style = PaintingStyle.stroke
            ..color = decoration.borderColor);
    }
    if (decoration.shadows != null && decoration.shadows!.isNotEmpty) {
      drawShadows(canvas, path, decoration.shadows!);
    }
  }

  Path buildPath(Offset offset, double width, double height) {
    double spineHeight = 8;
    double angle = 70;

    var angleRad = pi / 180 * angle;
    var spineMoveX = spineHeight * tan(angleRad / 2);

    double xb = (width - decoration.boxSize.width) / 2 + decoration.boxSize.width / 2 - spineMoveX;

    double xbs = decoration.boxSize.width / 2;
    double xbe = width - decoration.boxSize.width / 2 - spineMoveX;

    Offset translation = switch (decoration.placement) {
      SkyPlacement.topCenter => Offset(xb, 0),
      SkyPlacement.topStart => Offset(xbs, 0),
      SkyPlacement.topEnd => Offset(xbe, 0),
      SkyPlacement.bottomCenter => Offset(xb, 0),
      SkyPlacement.bottomStart => Offset(xbs, 0),
      SkyPlacement.bottomEnd => Offset(xbe, 0),
      SkyPlacement.leftCenter => Offset(0, (height - decoration.boxSize.height) / 2 + decoration.boxSize.height / 2 - spineMoveX),
      SkyPlacement.leftStart => Offset(0, decoration.boxSize.height / 2 - spineMoveX),
      SkyPlacement.leftEnd => Offset(0, height - decoration.boxSize.height / 2 - spineMoveX),
      SkyPlacement.rightCenter => Offset(0, (height - decoration.boxSize.height) / 2 + decoration.boxSize.height / 2 - spineMoveX),
      SkyPlacement.rightStart => Offset(0, decoration.boxSize.height / 2 - spineMoveX),
      SkyPlacement.rightEnd => Offset(0, height - decoration.boxSize.height / 2 - spineMoveX),
    };

    var spineMoveY = spineHeight;
    if (spineHeight != 0) {
      if (decoration.placement == SkyPlacement.bottomCenter || decoration.placement == SkyPlacement.bottomStart || decoration.placement == SkyPlacement.bottomEnd) {
        return Path()
          ..moveTo(offset.dx + translation.dx, offset.dy + translation.dy)
          ..relativeLineTo(spineMoveX, -spineMoveY)
          ..relativeLineTo(spineMoveX, spineMoveY);
      }
      if (decoration.placement == SkyPlacement.topCenter || decoration.placement == SkyPlacement.topStart || decoration.placement == SkyPlacement.topEnd) {
        return Path()
          ..moveTo(offset.dx + translation.dx, offset.dy + translation.dy + height)
          ..relativeLineTo(spineMoveX, spineMoveY)
          ..relativeLineTo(spineMoveX, -spineMoveY);
      }
      if (decoration.placement == SkyPlacement.rightStart || decoration.placement == SkyPlacement.rightCenter || decoration.placement == SkyPlacement.rightEnd) {
        return Path()
          ..moveTo(offset.dx + translation.dx, offset.dy + translation.dy)
          ..relativeLineTo(-spineMoveY, spineMoveX)
          ..relativeLineTo(spineMoveY, spineMoveX);
      }
      if (decoration.placement == SkyPlacement.leftStart || decoration.placement == SkyPlacement.leftCenter || decoration.placement == SkyPlacement.leftEnd) {
        return Path()
          ..moveTo(offset.dx + translation.dx + width, offset.dy + translation.dy)
          ..relativeLineTo(spineMoveY, spineMoveX)
          ..relativeLineTo(-spineMoveY, spineMoveX);
      }
    }
    return Path();
  }

  void drawShadows(Canvas canvas, Path path, List<BoxShadow> shadows) {
    for (final BoxShadow shadow in shadows) {
      final Paint shadowPainter = shadow.toPaint();
      if (shadow.spreadRadius == 0) {
        canvas.drawPath(path.shift(shadow.offset), shadowPainter);
      } else {
        Rect zone = path.getBounds();
        double xScale = (zone.width + shadow.spreadRadius) / zone.width;
        double yScale = (zone.height + shadow.spreadRadius) / zone.height;
        Matrix4 m4 = Matrix4.identity();
        m4.translate(zone.width / 2, zone.height / 2);
        m4.scale(xScale, yScale);
        m4.translate(-zone.width / 2, -zone.height / 2);
        canvas.drawPath(path.shift(shadow.offset).transform(m4.storage), shadowPainter);
      }
    }
    Paint whitePaint = Paint()..color = decoration.color ?? Colors.black;
    canvas.drawPath(path, whitePaint);
  }
}
