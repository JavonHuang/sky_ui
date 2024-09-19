import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

part 'message_box_widget.dart';

class SkyMessageBox {
  OverlayEntry? _overlayEntry;
  Future<bool> Function()? _onClose;

  void close() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  void withOnClose() async {
    if (_onClose != null) {
      bool result = await _onClose!.call();
      if (result) {
        if (_overlayEntry != null) {
          _overlayEntry!.remove();
          _overlayEntry = null;
        }
      }
    } else {
      if (_overlayEntry != null) {
        _overlayEntry!.remove();
        _overlayEntry = null;
      }
    }
  }

  SkyMessageBox open(
    String title, {
    String? confirmButtonText,
    String? cancelButtonText,
    required Widget child,
    double width = 400,
    double maxHeight = 400,
    Future<bool> Function(dynamic e)? onCancel,
    Future<bool> Function(dynamic e)? onConfirm,
    Future<bool> Function()? onClose,
  }) {
    GlobalKey<NavigatorState>? navigatorKey = SkyInit().navigatorKey;
    if (navigatorKey == null) {
      assert(navigatorKey != null, "service need to run register function");
      return SkyMessageBox();
    }
    _onClose = onClose;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: withOnClose,
          child: Material(
            color: const Color.fromARGB(122, 0, 0, 0),
            child: Center(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: MessageBoxWidget(
                  title: title,
                  width: width,
                  maxHeight: maxHeight,
                  close: close,
                  withOnClose: withOnClose,
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
