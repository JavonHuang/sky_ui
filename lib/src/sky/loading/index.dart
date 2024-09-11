import 'package:flutter/material.dart';

import 'loading_widget.dart';

class SkyLoading {
  SkyLoading._privateConstructor();

  static final SkyLoading _instance = SkyLoading._privateConstructor();

  factory SkyLoading() => _instance;

  static GlobalKey<NavigatorState>? _navigatorKey;

  static void register(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  Widget builder(
    BuildContext context, {
    required Widget child,
    Widget? textWidget,
  }) {
    return Stack(
      children: [
        child,
        SkyLoadingWidget(body: false, textWidget: textWidget),
      ],
    );
  }

  void hide() {}

  static OverlayEntry? _overlayEntry;

  static service({
    Widget? textWidget,
  }) {
    if (_navigatorKey == null) {
      assert(_navigatorKey != null, "service need to run register function");
      return;
    }
    close();
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Center(
          child: SkyLoadingWidget(
            body: true,
            textWidget: textWidget,
          ),
        );
        ;
      },
    );

    _navigatorKey!.currentState!.overlay!.insert(_overlayEntry!);
  }

  static close() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  String _defaultLoadingText = 'Loading...';

  void setDefaultLoadingText(String text) => _defaultLoadingText = text;

  get defaultLoadingText => _defaultLoadingText;
}
