import 'dart:async';

typedef ThrottledFunction = void Function();

class Throttler {
  Timer? _throttledAction;
  final Duration _interval;
  void Function()? callback;
  Throttler(this._interval);
  bool get isActive {
    if (_throttledAction == null) {
      return false;
    } else {
      return _throttledAction!.isActive;
    }
  }

  Future<void> trigger() async {
    if (_throttledAction != null) {
      _throttledAction!.cancel();
    }
    _throttledAction = Timer(_interval, callback!);
  }

  Future<void> dispose() async {
    if (_throttledAction != null) {
      _throttledAction!.cancel();
    }
  }

  Future<void> cancel() async {
    if (_throttledAction != null) {
      _throttledAction!.cancel();
    }
  }
}
