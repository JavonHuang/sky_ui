part of 'index.dart';

class SkyPaginationController {
  _SkyPaginationState? _state;

  void init({
    required int total,
    int pagerCount = 7,
    int pageSize = 10,
  }) {
    _state!._currentPage = 1;
    _state!._total = total;
    _state!._pagerCount = pagerCount;
    _state!._pageSize = pageSize;
    _state!.reflesh();
  }

  int get pageSize => _state!._pageSize;
  int get currentPage => _state!._currentPage;

  void _attach(_SkyPaginationState state) {
    _state = state;
  }

  void _detach(_SkyPaginationState state) {
    if (_state == state) {
      _state = null;
    }
  }
}
