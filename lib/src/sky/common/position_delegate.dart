import 'dart:async';
import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class PopoverPositionDelegate extends SingleChildLayoutDelegate {
  PopoverPositionDelegate({
    required this.target,
    required this.boxSize,
    required this.gutter,
    required this.placement,
    required this.onPlacementChanged,
  });
  final Offset target;
  final SkyPlacement placement;
  final Size boxSize;
  final double gutter;
  final ValueChanged<SkyPlacement> onPlacementChanged;

  /// constraints 为 SingleChildLayoutDelegate 的父传给 SingleChildLayoutDelegate 的约束
  /// 返回值为 SingleChildLayoutDelegate 根据约束决定的自己的尺寸
  @override
  Size getSize(BoxConstraints constraints) => constraints.biggest;

  ///返回值为 CustomSingleChildLayout 传给子的约束
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) => constraints.loosen();

  SkyPlacement shiftPlacement(
    bool outTop,
    bool outBottom,
    bool outLeft,
    bool outRight,
  ) {
    SkyPlacement effectPlacement = placement;

    SkyPlacement shiftToVertical() {
      if (outTop) return SkyPlacement.bottomCenter;
      return SkyPlacement.topCenter;
    }

    if (outLeft && outRight) {
      return shiftToVertical();
    }

    switch (placement) {
      case SkyPlacement.topStart:
        if (outTop) return SkyPlacement.bottomStart;
        break;
      case SkyPlacement.topCenter:
        if (outTop) return SkyPlacement.bottomCenter;
        break;
      case SkyPlacement.topEnd:
        if (outTop) return SkyPlacement.bottomEnd;
        break;
      case SkyPlacement.bottomStart:
        if (outBottom) return SkyPlacement.topStart;
        break;
      case SkyPlacement.bottomCenter:
        if (outBottom) return SkyPlacement.topCenter;
        break;
      case SkyPlacement.bottomEnd:
        if (outBottom) return SkyPlacement.topEnd;
        break;
      case SkyPlacement.leftCenter:
        if (outLeft) return SkyPlacement.rightCenter;
        if (outBottom) return SkyPlacement.leftEnd;
        if (outTop) return SkyPlacement.leftStart;
        break;
      case SkyPlacement.leftStart:
        if (outBottom) return SkyPlacement.leftEnd;
        if (outLeft) return SkyPlacement.rightStart;
        break;
      case SkyPlacement.leftEnd:
        if (outTop) return SkyPlacement.leftStart;
        if (outLeft) return SkyPlacement.rightEnd;
        break;
      case SkyPlacement.rightCenter:
        if (outRight) return SkyPlacement.leftCenter;
        if (outBottom) return SkyPlacement.rightEnd;
        if (outTop) return SkyPlacement.rightStart;

        break;
      case SkyPlacement.rightStart:
        if (outBottom) return SkyPlacement.rightEnd;
        if (outRight) return SkyPlacement.leftStart;
        break;
      case SkyPlacement.rightEnd:
        if (outTop) return SkyPlacement.rightStart;
        if (outRight) return SkyPlacement.leftEnd;
        break;
      default:
        return effectPlacement;
    }
    return effectPlacement;
  }

  /// 用于根据 CustomSingleChildLayout 自己的尺寸以及 CustomSingleChildLayout 的子的尺寸，决定 CustomSingleChildLayout 的子的位置
  /// size 为 CustomSingleChildLayout 的尺寸-这里是整个视窗大小
  /// childSize 为 CustomSingleChildLayout 的子的尺寸
  /// 返回值为 CustomSingleChildLayout 的子的位置
  @override
  Offset getPositionForChild(Size size, Size childSize) {
    bool outBottom = target.dy > size.height - (childSize.height + boxSize.height / 2 + gutter);
    bool outTop = target.dy < childSize.height + boxSize.height / 2;
    bool outLeft = target.dx < childSize.width + boxSize.width / 2 + gutter;
    bool outRight = target.dx > size.width - (childSize.width + boxSize.width / 2 + gutter);

    SkyPlacement effectPlacement = shiftPlacement(outTop, outBottom, outLeft, outRight);

    Offset center = target.translate(-childSize.width / 2, -childSize.height / 2);
    double halfWidth = (childSize.width - boxSize.width) / 2;
    double halfLeftWidth = (childSize.width + boxSize.width) / 2 + gutter;
    double halfHeight = (childSize.height - boxSize.height) / 2;

    double verticalHeight = (childSize.height + boxSize.height) / 2 + gutter;
    Offset translation = switch (effectPlacement) {
      SkyPlacement.topCenter => Offset(0, -verticalHeight),
      SkyPlacement.topStart => Offset(halfWidth, -verticalHeight),
      SkyPlacement.topEnd => Offset(-halfWidth, -verticalHeight),
      SkyPlacement.bottomCenter => Offset(0, verticalHeight),
      SkyPlacement.bottomStart => Offset(halfWidth, verticalHeight),
      SkyPlacement.bottomEnd => Offset(-halfWidth, verticalHeight),
      SkyPlacement.leftCenter => Offset(-halfLeftWidth, 0),
      SkyPlacement.leftStart => Offset(-halfLeftWidth, halfHeight),
      SkyPlacement.leftEnd => Offset(-halfLeftWidth, -halfHeight),
      SkyPlacement.rightCenter => Offset(halfLeftWidth, 0),
      SkyPlacement.rightStart => Offset(halfLeftWidth, halfHeight),
      SkyPlacement.rightEnd => Offset(halfLeftWidth, -halfHeight),
    };
    Offset result = center + translation;

    double dx = 0;
    double endEdgeDx = result.dx + childSize.width - size.width;
    if (endEdgeDx > 0) {
      result = result.translate(-endEdgeDx, 0);
      dx = -endEdgeDx;
    }
    double startEdgeDy = result.dx;
    if (startEdgeDy < 0) {
      result = result.translate(-startEdgeDy, 0);
      dx = -startEdgeDy;
    }

    // if (offsetCalculator != null) {
    //   // effectPlacement,boxSize,childSize,gap
    //   result += offsetCalculator!(Calculator(placement: effectPlacement, boxSize: boxSize, overlaySize: childSize, gap: gap));
    // }

    ///如果方位发生变化，通过微任务反向修改父元素的变量，以防阻塞主任务
    if (effectPlacement != placement || dx != 0) {
      scheduleMicrotask(() {
        onPlacementChanged(effectPlacement);
      });
    }

    return result;
  }

  @override
  bool shouldRelayout(PopoverPositionDelegate oldDelegate) {
    return target != oldDelegate.target || gutter != oldDelegate.gutter || boxSize != oldDelegate.boxSize;
  }
}
