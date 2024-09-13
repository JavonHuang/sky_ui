import 'dart:async';

import 'package:flutter/material.dart';

class SkyMessage {
  BuildContext? context;

  SkyMessage._privateConstructor();
  static final SkyMessage _instance = SkyMessage._privateConstructor();
  factory SkyMessage() => _instance;

  SkyMessage init(BuildContext context) {
    _instance.context = context;
    return _instance;
  }

  OverlayEntry? _entry;
  List<_MessageEntry> _overlayQueue = [];
  Timer? _timer;
  Timer? _fadeTimer;

  _showOverlay() {
    if (_overlayQueue.isEmpty) {
      _entry = null;
      return;
    }
    if (context == null) {
      /// Need to clear queue
      removeQueuedCustomToasts();
      throw ("Error: Context is null, Please call init(context) before showing toast.");
    }
    OverlayState? _overlay;
    try {
      _overlay = Overlay.of(context!);
    } catch (err) {
      removeQueuedCustomToasts();
      throw ("""Error: Overlay is null. 
      Please don't use top of the widget tree context (such as Navigator or MaterialApp) or 
      create overlay manually in MaterialApp builder.
      More information 
        - https://github.com/ponnamkarthik/FlutterToast/issues/393
        - https://github.com/ponnamkarthik/FlutterToast/issues/234""");
    }

    /// Create entry only after all checks
    _MessageEntry _toastEntry = _overlayQueue.removeAt(0);
    _entry = _toastEntry.entry;
    _overlay.insert(_entry!);

    _timer = Timer(_toastEntry.duration, () {
      _fadeTimer = Timer(_toastEntry.fadeDuration, () {
        removeCustomToast();
      });
    });
  }

  removeQueuedCustomToasts() {
    _timer?.cancel();
    _fadeTimer?.cancel();
    _timer = null;
    _fadeTimer = null;
    _overlayQueue.clear();
    _entry?.remove();
    _entry = null;
  }

  removeCustomToast() {
    _timer?.cancel();
    _fadeTimer?.cancel();
    _timer = null;
    _fadeTimer = null;
    _entry?.remove();
    _entry = null;
    _showOverlay();
  }

  void showToast({
    required Widget child,
    Duration toastDuration = const Duration(seconds: 2),
    Duration fadeDuration = const Duration(milliseconds: 350),
    bool ignorePointer = false,
    bool isDismissable = false,
  }) {
    if (context == null) throw ("Error: Context is null, Please call init(context) before showing toast.");
    Widget newChild = _ToastStateFul(
        child,
        toastDuration,
        fadeDuration,
        ignorePointer,
        !isDismissable
            ? null
            : () {
                removeCustomToast();
              });

    OverlayEntry newEntry = OverlayEntry(builder: (context) {
      return Positioned(top: 100.0, left: 24.0, right: 24.0, child: newChild);
    });
    _overlayQueue.add(_MessageEntry(entry: newEntry, duration: toastDuration, fadeDuration: fadeDuration));
    if (_timer == null) _showOverlay();
  }
}

class _MessageEntry {
  final OverlayEntry entry;
  final Duration duration;
  final Duration fadeDuration;

  _MessageEntry({
    required this.entry,
    required this.duration,
    required this.fadeDuration,
  });
}

class _ToastStateFul extends StatefulWidget {
  _ToastStateFul(this.child, this.duration, this.fadeDuration, this.ignorePointer, this.onDismiss, {Key? key}) : super(key: key);

  final Widget child;
  final Duration duration;
  final Duration fadeDuration;
  final bool ignorePointer;
  final VoidCallback? onDismiss;

  @override
  ToastStateFulState createState() => ToastStateFulState();
}

/// State for [_ToastStateFul]
class ToastStateFulState extends State<_ToastStateFul> with SingleTickerProviderStateMixin {
  /// Start the showing animations for the toast
  showIt() {
    _animationController!.forward();
  }

  /// Start the hidding animations for the toast
  hideIt() {
    _animationController!.reverse();
    _timer?.cancel();
  }

  /// Controller to start and hide the animation
  AnimationController? _animationController;
  late Animation _fadeAnimation;

  Timer? _timer;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.fadeDuration,
    );
    _fadeAnimation = CurvedAnimation(parent: _animationController!, curve: Curves.easeIn);
    super.initState();

    showIt();
    _timer = Timer(widget.duration, () {
      hideIt();
    });
  }

  @override
  void deactivate() {
    _timer?.cancel();
    _animationController!.stop();
    super.deactivate();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onDismiss == null ? null : () => widget.onDismiss!(),
      behavior: HitTestBehavior.translucent,
      child: IgnorePointer(
        ignoring: widget.ignorePointer,
        child: FadeTransition(
          opacity: _fadeAnimation as Animation<double>,
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
