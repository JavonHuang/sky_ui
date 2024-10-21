part of '../sky_table.dart';

class SkyTableEvent<T> {
  final SkyTableEventType eventName;
  final T value;
  final String key;
  SkyTableEvent({
    required this.eventName,
    required this.key,
    required this.value,
  });
}

enum SkyTableEventType {
  rowHover,
  sort;

  const SkyTableEventType();
}
