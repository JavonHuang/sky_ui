part of '../index.dart';

class SkyRadioOption {
  final String? text;
  final bool? disabled;
  final String label;

  SkyRadioOption({
    this.text,
    this.disabled = false,
    required this.label,
  });
}
