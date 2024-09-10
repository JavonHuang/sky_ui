part of 'index.dart';

T? _ambiguate<T>(T? value) => value;

class TekLoadingOverlayEntry extends OverlayEntry {
  TekLoadingOverlayEntry({
    required this.widgetBuilder,
  }) : super(builder: widgetBuilder);

  final WidgetBuilder widgetBuilder;

  @override
  void markNeedsBuild() {
    print("45145");

    if (_ambiguate(SchedulerBinding.instance)!.schedulerPhase == SchedulerPhase.persistentCallbacks) {
      _ambiguate(SchedulerBinding.instance)!.addPostFrameCallback(
        (_) {
          print("45145");

          super.markNeedsBuild();
        },
      );
    } else {
      print("45");
      super.markNeedsBuild();
    }
  }
}
