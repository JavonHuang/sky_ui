import 'package:flutter/material.dart';

import 'loading_widget.dart';

class SkyLoading {
  final bool hidden;
  final Color? customizeColor;
  late String? loadingText;

  SkyLoading({
    this.hidden = true,
    this.customizeColor,
    this.loadingText,
  });

  static GlobalKey<NavigatorState>? _navigatorKey;

  static void register(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  late GlobalKey<SkyLoadingWidgetState>? _skyLoadingWidgetState = GlobalKey<SkyLoadingWidgetState>();

  Widget builder(
    BuildContext context, {
    required Widget child,
    Widget? textWidget,
    String? loadingText,
  }) {
    if (loadingText != null) {
      this.loadingText = loadingText;
    }
    return Stack(
      children: [
        child,
        SkyLoadingWidget(
          key: _skyLoadingWidgetState,
          body: false,
          textWidget: textWidget,
          hidden: hidden,
          color: customizeColor,
          loadingText: this.loadingText ?? _defaultLoadingText,
        ),
      ],
    );
  }

  void hide() {
    _skyLoadingWidgetState!.currentState!.hide();
  }

  void show() {
    _skyLoadingWidgetState!.currentState!.display();
  }

  static OverlayEntry? _overlayEntry;

  static service({
    Widget? textWidget,
    Duration? time,
    Color? customizeColor,
    String? loadingText,
  }) {
    if (_navigatorKey == null) {
      assert(_navigatorKey != null, "service need to run register function");
      return;
    }

    close();
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: customizeColor ?? const Color.fromARGB(50, 0, 0, 0), // 红色透明度为70%
          child: Center(
            child: SkyLoadingWidget(
              body: true,
              textWidget: textWidget,
              hidden: false,
              loadingText: loadingText ?? _defaultLoadingText,
            ),
          ),
        );
      },
    );

    _navigatorKey!.currentState!.overlay!.insert(_overlayEntry!);
    if (time != null) {
      Future.delayed(time).then((e) {
        close();
      });
    }
  }

  static close() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  static String _defaultLoadingText = 'Loading...';
}
