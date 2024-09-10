part of "index.dart";

class SkyRow extends StatelessWidget {
  const SkyRow({
    super.key,
    required this.children,
    this.gutter = 0,
    this.alignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.center,
  });
  final List<Widget> children;
  final double? gutter;
  final WrapAlignment alignment;
  final WrapCrossAlignment crossAxisAlignment;
  static _ParentWidthScope? maybeOf(BuildContext context) {
    final _ParentWidthScope? widget = context.dependOnInheritedWidgetOfExactType<_ParentWidthScope>();
    return widget;
  }

  List<Widget> renderchildren() => children
      .map((e) => LayoutBuilder(builder: (c, b) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: gutter! * 0.5),
              child: e,
            );
          }))
      .toList();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (c, b) {
      return _ParentWidthScope(
        width: b.maxWidth - 1,
        gutter: gutter ?? 0,
        child: Wrap(
          spacing: 0, // 主轴(水平)方向间距
          runSpacing: 0, // 纵轴（垂直）方向间距
          alignment: alignment,
          crossAxisAlignment: crossAxisAlignment,
          children: renderchildren(),
        ),
      );
    });
  }
}

class _ParentWidthScope extends InheritedWidget {
  const _ParentWidthScope({
    required super.child,
    required double width,
    required double gutter,
  })  : _width = width,
        _gutter = gutter;

  final double _width;
  final double _gutter;

  num get unit => (_width.getFloor(fixed: 5) / 24).getFloor(fixed: 9);

  @override
  bool updateShouldNotify(_ParentWidthScope oldWidget) {
    // print(_width.getFloor(fixed: 5));
    // print(_width.getFloor(fixed: 5) / 24);
    // print(unit);
    return _width != oldWidget._width;
  }
}
