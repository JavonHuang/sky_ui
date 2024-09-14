import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../alert/index.dart';
import '../register/index.dart';
import 'message_future.dart';
import 'message_manager.dart';
import 'message_widget.dart';
import 'overlay_layout.dart';

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
    this.duration = const Duration(milliseconds: 3000),
    this.showClose = false,
    this.center = false,
    this.onClose,
    this.offset = 20,
  });

  MessageFuture open() {
    if (MessageManager().MessageSet.isEmpty) {
      OverlayLayout().init();
    }
    final MessageFuture future = MessageFuture(entry: OverlayLayout.layout, duration: duration);
    MessageManager().addFuture(future);
    Future.delayed(Duration(milliseconds: 300)).then((e) {
      OverlayLayout().insertEntry();
    });
    // future.insertEntry(navigatorKey!.currentState!.overlay!);
    return future;
  }
}
