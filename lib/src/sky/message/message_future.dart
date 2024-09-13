import 'dart:async';

import 'package:flutter/widgets.dart';

import 'message_manager.dart';

class MessageFuture {
  // MessageFuture._privateConstructor();

  // static final MessageFuture _instance = MessageFuture._privateConstructor();

  // factory MessageFuture({
  //   required OverlayEntry overlayEntry,
  //   required Duration duration,
  // }) {
  //   _instance._entry = overlayEntry;
  //   _instance._duration = duration;

  //   _instance._entry.addListener(_instance._mountedListener);
  //   return _instance;
  // }

  final OverlayEntry entry;
  final Duration duration;
  MessageFuture({
    required this.entry,
    required this.duration,
  }) {
    entry.addListener(_mountedListener);
  }

  Timer? _timer;
  bool _isShow = false;
  bool _dismissed = false;

  bool get mounted => _isShow;

  bool get dismissed => _dismissed;

  void _mountedListener() {
    _isShow = entry.mounted;
  }

  void insertEntry(OverlayState overlay) {
    overlay.insert(entry);
    // if (duration != Duration.zero) {
    //   _timer = Timer(duration, () {
    //     dismiss();
    //   });
    // }
  }

  void _removeEntry() {
    entry.removeListener(_mountedListener);
    entry.remove();
  }

  void dismiss() {
    if (_isShow) {
      MessageManager().removeFuture(this);
      _isShow = false;
      _timer?.cancel();
      _dismissed = true;
      _removeEntry();
      return;
    }
  }
}
