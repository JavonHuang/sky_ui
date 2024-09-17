import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

part 'message_box_widget.dart';

class SkyMessageBox {
  OverlayEntry? _overlayEntry;

  void close() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  SkyMessageBox alert(
    String title, {
    String? confirmButtonText,
    String? cancelButtonText,
    required Widget child,
    double width = 400,
    double maxHeight = 400,
    Future<bool> Function()? onCancel,
    Future<bool> Function()? onConfirm,
  }) {
    GlobalKey<NavigatorState>? navigatorKey = SkyInit().navigatorKey;
    if (navigatorKey == null) {
      assert(navigatorKey != null, "service need to run register function");
      return SkyMessageBox();
    }

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            close();
          },
          child: Material(
            color: const Color.fromARGB(122, 0, 0, 0),
            child: Center(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: MessageBoxWidget(
                  width: width,
                  maxHeight: maxHeight,
                  close: close,
                  cancelButtonText: cancelButtonText,
                  confirmButtonText: confirmButtonText,
                  onCancel: onCancel,
                  onConfirm: onConfirm,
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
    );
    navigatorKey.currentState!.overlay!.insert(_overlayEntry!);
    return this;
  }
}
