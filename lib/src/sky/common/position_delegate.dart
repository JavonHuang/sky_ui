import 'dart:async';
import 'dart:ui';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import '../popover/index.dart';

class PopoverPositionDelegate extends SingleChildLayoutDelegate {
  /// Creates a delegate for computing the layout of a tooltip.
  PopoverPositionDelegate({
    required this.target,
    required this.boxSize,
    required this.clickPosition,
    // this.offsetCalculator,
    this.onSizeFind,
    required this.gap,
    required this.placement,
    // required this.onPlacementShift,
  });

  /// The offset of the target the tooltip is positioned near in the global
  /// coordinate system.
  final Offset target;
  final SkyPlacement placement;
  // final OffsetCalculator? offsetCalculator;
  final Offset? clickPosition;

  // final ValueChanged<PlacementShift> onPlacementShift;
  final ValueChanged<Size>? onSizeFind;
  final Size boxSize;

  /// The amount of vertical distance between the target and the displayed
  /// tooltip.
  final double gap;

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
      if (outTop) return SkyPlacement.bottom;
      return SkyPlacement.top;
    }

    if (outLeft && outRight) {
      return shiftToVertical();
    }

    /// TODO: ::边界响应策略:: 可以将转换策略作为函数参数，使用者来自定义。
    // if(placement.isHorizontal&&(outTop||outBottom)){
    //   return shiftToVertical();
    // }
    switch (placement) {
      case SkyPlacement.left:
        if (outLeft) return SkyPlacement.right;
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
      case SkyPlacement.right:
        if (outRight) return SkyPlacement.left;
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
  /// size 为 CustomSingleChildLayout 的尺寸
  /// childSize 为 CustomSingleChildLayout 的子的尺寸
  /// 返回值为 CustomSingleChildLayout 的子的位置
  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // onSizeFind?.call(childSize);
    if (onSizeFind != null) {
      scheduleMicrotask(() {
        onSizeFind!(childSize);
      });
    }
    if (clickPosition != null) {
      Offset offset = clickPosition!.translate(target.dx - boxSize.width / 2, target.dy - boxSize.height / 2);

      /// 底部边界检测
      double bottom = offset.dy + childSize.height - (size.height - gap);
      if (bottom > 0) {
        offset = offset.translate(0, -bottom);
      }
      return offset;
    }

    bool outBottom = target.dy > size.height - (childSize.height + boxSize.height / 2 + gap);
    bool outTop = target.dy < childSize.height + boxSize.height / 2;
    bool outLeft = target.dx < childSize.width + boxSize.width / 2 + gap;
    bool outRight = target.dx > size.width - (childSize.width + boxSize.width / 2 + gap);

    SkyPlacement effectPlacement = shiftPlacement(outTop, outBottom, outLeft, outRight);

    Offset center = target.translate(-childSize.width / 2, -childSize.height / 2);
    double halfWidth = (childSize.width - boxSize.width) / 2;
    double halfLeftWidth = (childSize.width + boxSize.width) / 2 + gap;
    double halfHeight = (childSize.height - boxSize.height) / 2;

    double verticalHeight = (childSize.height + boxSize.height) / 2 + gap;
    Offset translation = switch (effectPlacement) {
      SkyPlacement.top => Offset(0, -verticalHeight),
      SkyPlacement.topStart => Offset(halfWidth, -verticalHeight),
      SkyPlacement.topEnd => Offset(-halfWidth, -verticalHeight),
      SkyPlacement.bottom => Offset(0, verticalHeight),
      SkyPlacement.bottomStart => Offset(halfWidth, verticalHeight),
      SkyPlacement.bottomEnd => Offset(-halfWidth, verticalHeight),
      SkyPlacement.left => Offset(-halfLeftWidth, 0),
      SkyPlacement.leftStart => Offset(-halfLeftWidth, halfHeight),
      SkyPlacement.leftEnd => Offset(-halfLeftWidth, -halfHeight),
      SkyPlacement.right => Offset(halfLeftWidth, 0),
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

    // if (effectPlacement != placement || dx != 0) {
    //   scheduleMicrotask(() {
    //     onPlacementShift(PlacementShift(effectPlacement, dx));
    //   });
    // }

    return result;
  }

  @override
  bool shouldRelayout(PopoverPositionDelegate oldDelegate) {
    return target != oldDelegate.target || gap != oldDelegate.gap || boxSize != oldDelegate.boxSize;
  }
}
