part of '../index.dart';

class SkyCheckboxOption {
  final String? text;
  late bool? disabled;
  final String label;

  SkyCheckboxOption({
    this.text,
    this.disabled = false,
    required this.label,
  });
}
