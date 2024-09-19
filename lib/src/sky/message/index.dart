import 'package:flutter/material.dart';
import 'package:sky_ui/src/styles/styles.dart';

import '../../utils/utils.dart';
import '../alert/index.dart';
import '../common/generate_uuid.dart';
import '../register/index.dart';
import 'message_future.dart';
import 'message_manager.dart';
part 'overlay_layout.dart';

class SkyMessage {
  final String message;
  final SkyAlertType type;
  final Duration duration;
  final bool center;
  final Function()? onClose;
  final SkyAlertEffect effect;
  final bool showIcon;

  SkyMessage({
    required this.message,
    this.type = SkyAlertType.success,
    this.duration = const Duration(milliseconds: 3000),
    this.center = false,
    this.onClose,
    this.effect = SkyAlertEffect.light,
    this.showIcon = false,
  });

  MessageFuture open() {
    final MessageFuture future = MessageFuture(
      duration: duration,
      id: GenerateUuid.keyV1(),
      title: message,
      effect: effect,
      type: type,
      showIcon: showIcon,
    );
    OverlayLayout().insertEntry(future);
    return future;
  }
}
