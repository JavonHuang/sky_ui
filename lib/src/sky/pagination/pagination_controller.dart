part of 'index.dart';

class SkyPaginationController {
  _SkyPaginationState? _state;

  void _attach(_SkyPaginationState state) {
    _state = state;
  }

  void _detach(_SkyPaginationState state) {
    if (_state == state) {
      _state = null;
    }
  }
}
