part of 'index.dart';

class SkyPopoverController {
  _SkyPopoverState? _state;

  bool get isOpen {
    assert(_state != null);
    return _state!.isOpen;
  }

  void close() {
    assert(_state != null);
    _state!.close();
  }

  void open({Offset? position}) {
    assert(_state != null);
    _state!.open(position: position);
  }

  void _attach(_SkyPopoverState state) {
    _state = state;
  }

  void _detach(_SkyPopoverState state) {
    if (_state == state) {
      _state = null;
    }
  }
}
