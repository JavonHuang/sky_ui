import 'package:flutter/material.dart';
import 'package:sky_ui/src/sky/layout/index.dart';
import 'package:sky_ui/src/utils/utils.dart';
import '../../styles/styles.dart';
import '../buttons/buttons.dart';
import '../register/index.dart';

part 'dialog_layout.dart';

class SkyDialog {
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

  SkyDialog open(
    String title, {
    String? confirmButtonText,
    String? cancelButtonText,
    required Widget child,
    double width = 400,
    double maxHeight = 400,
    Future<bool> Function(dynamic e)? onCancel,
    Future<bool> Function(dynamic e)? onConfirm,
    Future<bool> Function()? onClose,
    bool fullscreen = false,
    Widget? foot,
  }) {
    GlobalKey<NavigatorState>? navigatorKey = SkyInit().navigatorKey;
    if (navigatorKey == null) {
      assert(navigatorKey != null, "service need to run register function");
      return this;
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
                child: DialogLayout(
                  title: title,
                  width: width,
                  maxHeight: maxHeight,
                  fullscreen: fullscreen,
                  close: close,
                  withOnClose: withOnClose,
                  cancelButtonText: cancelButtonText,
                  confirmButtonText: confirmButtonText,
                  onCancel: onCancel,
                  onConfirm: onConfirm,
                  foot: foot,
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
