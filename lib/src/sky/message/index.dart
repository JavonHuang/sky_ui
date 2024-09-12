import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../alert/index.dart';
import '../register/index.dart';
import 'message_future.dart';
import 'message_manager.dart';
import 'message_widget.dart';

class SkyMessage {
  final String message;
  final SkyAlertType type;
  final Duration duration;
  final bool showClose;
  final bool center;
  final Function()? onClose;
  final double offset;
  SkyMessage({
    required this.message,
    this.type = SkyAlertType.info,
    this.duration = const Duration(milliseconds: 1000),
    this.showClose = false,
    this.center = false,
    this.onClose,
    this.offset = 20,
  });

  late OverlayEntry? _overlayEntry;
  MessageFuture open() {
    GlobalKey<NavigatorState>? navigatorKey = SkyInit().navigatorKey;
    if (navigatorKey == null) {
      assert(navigatorKey != null, "service need to run register function");
    }
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return MessageWidget();
      },
    );
    final MessageFuture future = MessageFuture(entry: _overlayEntry!, duration: duration);
    MessageManager().addFuture(future);
    future.insertEntry(navigatorKey!.currentState!.overlay!);
    return future;
  }
}
