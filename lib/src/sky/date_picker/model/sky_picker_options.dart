part of '../index.dart';

class SkyPickerOptions {
  final bool Function(DateTime e)? disabledDate;
  final bool Function(DateTime e)? onPick;
  final List<Shortcut>? shortcuts;

  SkyPickerOptions({
    this.disabledDate,
    this.onPick,
    this.shortcuts,
  });
}

class Shortcut {
  final String text;
  final Function(DateTime today, Function(DateTime day)) onTap;

  Shortcut({
    required this.text,
    required this.onTap,
  });
}

enum SkyDatePickerType {
  year,
  month,
  date,
  dates,
  months,
  years,
  week,
  datetime,
  datetimerange,
  daterange,
  monthrange;
}
