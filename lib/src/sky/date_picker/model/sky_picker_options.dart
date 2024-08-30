part of '../index.dart';

class SkyPickerOptions {
  final bool Function(DateTime e)? disabledDate;
  final bool Function(DateTime e)? onPick;
  final List<Shortcut>? shortcuts;
  final List<ShortcutRange>? shortcutRange;

  SkyPickerOptions({
    this.disabledDate,
    this.onPick,
    this.shortcuts,
    this.shortcutRange,
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

class ShortcutRange {
  final String text;
  final Function(DateTime today, Function(List<DateTime> e)) onTap;

  ShortcutRange({
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

  String get format {
    switch (this) {
      case year:
        return "yyyy";
      case month:
        return "yyyy-MM";
      case date:
        return "yyyy-MM-dd";
      case dates:
        return "yyyy-MM-dd";
      case months:
        return "yyyy-MM";
      case years:
        return "yyyy";
      case week:
        return "yyyy-ww";
      case datetime:
        return "HH:mm:ss";
      case datetimerange:
        return "HH:mm:ss";
      case daterange:
        return "yyyy-MM-dd";
      case monthrange:
        return "MM";
    }
  }
}
