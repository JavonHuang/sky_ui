part of '../index.dart';

class DescriptionsItem {
  final String? label;
  final Widget? labelWidget;
  final String? value;
  final Widget? valueWidget;
  int span;
  final double? width;

  DescriptionsItem({
    this.label,
    this.labelWidget,
    this.value,
    this.valueWidget,
    this.span = 1,
    this.width,
  });
  DescriptionsItem copy() {
    return DescriptionsItem(
      label: label,
      labelWidget: labelWidget,
      value: value,
      valueWidget: valueWidget,
      span: span,
      width: width,
    );
  }
}
