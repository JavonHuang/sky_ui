import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final yourModels = List<Object>.filled(5, 0, growable: true);
    double maxHeight = 0;
    final List<Widget> widgets = yourModels.map((model) {
      final widget = _yourItemWidget();
      final measureHeight = MeasureUtil.measureWidget(widget).height;
      if (maxHeight < measureHeight) {
        maxHeight = measureHeight;
      }
      return widget;
    }).toList();
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: maxHeight,
              child: widgets[index],
            );
          },
          itemCount: widgets.length,
        )),
      ),
    );
  }

  Widget _yourItemWidget() {
    final random = Random();
    final height = Random().nextInt(100).toDouble();
    return Container(
      color: Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1,
      ),
      width: 100,
      height: height,
    );
  }
}

class MeasureUtil {
  static Size measureWidget(Widget widget, [BoxConstraints constraints = const BoxConstraints()]) {
    final PipelineOwner pipelineOwner = PipelineOwner();
    final _MeasurementView rootView = pipelineOwner.rootNode = _MeasurementView(constraints);
    final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());
    final RenderObjectToWidgetElement<RenderBox> element = RenderObjectToWidgetAdapter<RenderBox>(
      container: rootView,
      debugShortDescription: '[root]',
      child: widget,
    ).attachToRenderTree(buildOwner);
    try {
      rootView.scheduleInitialLayout();
      pipelineOwner.flushLayout();
      return rootView.size;
    } finally {
      // Clean up.
      element.update(RenderObjectToWidgetAdapter<RenderBox>(container: rootView));
      buildOwner.finalizeTree();
    }
  }
}

class _MeasurementView extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  final BoxConstraints boxConstraints;
  _MeasurementView(this.boxConstraints);
  @override
  void performLayout() {
    assert(child != null);
    child!.layout(boxConstraints, parentUsesSize: true);
    size = child!.size;
  }

  @override
  void debugAssertDoesMeetConstraints() => true;
}
