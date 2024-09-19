part of "index.dart";

class SkyCol extends StatelessWidget {
  const SkyCol({
    super.key,
    this.span = 1,
    this.offset = 0,
    this.width,
    this.height,
    this.child,
  });
  final int span;
  final int offset;
  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    double vwidth = (width ?? SkyRow.maybeOf(context)!.unit * span) as double;
    double voffset = (SkyRow.maybeOf(context)!.unit * offset) as double;
    double gutter = (width ?? SkyRow.maybeOf(context)!._gutter);
    double _width = vwidth - gutter + voffset;
    return SizedBox(
      width: _width < 0 ? 0 : _width,
      height: height,
      child: Padding(
        padding: EdgeInsets.only(left: voffset),
        child: child,
      ),
    );
  }
}
