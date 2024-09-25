import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef SkyOnWidgetSizeChange = void Function(Size size);

class TekMeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  final SkyOnWidgetSizeChange onChange;

  TekMeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    final newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) => onChange(newSize));
  }
}

class TekMeasureSize extends SingleChildRenderObjectWidget {
  final SkyOnWidgetSizeChange onChange;

  const TekMeasureSize({required this.onChange, required Widget super.child, super.key});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return TekMeasureSizeRenderObject(onChange);
  }
}
