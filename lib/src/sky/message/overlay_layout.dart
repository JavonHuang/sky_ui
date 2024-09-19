// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:sky_ui/src/sky/alert/index.dart';

// import '../../styles/styles.dart';
// import '../../utils/utils.dart';
// import '../register/index.dart';
// import 'message_future.dart';
// import 'message_manager.dart';

part of 'index.dart';

class OverlayLayout {
  OverlayLayout._privateConstructor();
  static final OverlayLayout _instance = OverlayLayout._privateConstructor();
  factory OverlayLayout() => _instance;

  static final GlobalKey<LayoutState> layoutKey = GlobalKey<LayoutState>();
  bool isShow = false;

  OverlayEntry? layout;
  double? _left;
  double? _top;
  double? _right;
  double? _bottom;
  double _width = 200;

  double? get left => _left;
  double? get top => _top;
  double? get right => _right;
  double? get bottom => _bottom;
  double get width => _width;

  void initPosition({
    double? left,
    double? top,
    double? right,
    double? bottom,
    double width = 200,
  }) {
    _left = left;
    _top = top;
    _right = right;
    _bottom = bottom;
    _width = width;
  }

  void init(MessageFuture future) {
    if (!isShow) {
      MessageManager().dismissAll();
      layout = OverlayEntry(
        builder: (context) {
          return Layout(
            key: layoutKey,
            width: width,
          );
        },
      );
      layout!.addListener(() {
        isShow = layout!.mounted;
        if (isShow) {
          Future.delayed(Duration.zero).then((e) {
            insertEntry(future);
          });
        }
      });
      GlobalKey<NavigatorState>? navigatorKey = SkyInit().navigatorKey;
      navigatorKey!.currentState!.overlay!.insert(layout!);
    }
  }

  void insertEntry(MessageFuture future) {
    if (!isShow) {
      init(future);
    } else {
      MessageManager().addFuture(future);
      if (layoutKey.currentState != null) {
        layoutKey.currentState!.addItem(future.id);
        Future.delayed(future.duration).then((e) {
          layoutKey.currentState!.addQueue(future.id);
        });
      }
    }
  }
}

class Layout extends StatefulWidget {
  final double width;
  const Layout({
    super.key,
    required this.width,
  });

  @override
  State<Layout> createState() => LayoutState();
}

class LayoutState extends State<Layout> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  late List<String> _items = [];
  List<String> delQueueList = [];
  final Throttler throttler = Throttler(const Duration(milliseconds: 10));
  late double width = 200;

  @override
  void initState() {
    _items = [];
    delQueueList = [];
    width = widget.width;
    super.initState();
    throttler.callback = remove;
  }

  void addQueue(String id) {
    delQueueList.add(id);
    if (!throttler.isActive) {
      throttler.trigger();
    }
  }

  void remove() {
    if (delQueueList.isEmpty) {
      throttler.cancel();

      return;
    }
    String firstItem = delQueueList.removeAt(0);
    int last = -1;
    MessageFuture? future;
    for (var e in MessageManager().MessageSet) {
      last += 1;
      if (e.id == firstItem) {
        future = e;
        break;
      }
    }
    _removeItem(last);
  }

  void addItem(String id) {
    _items.insert(0, id);
    _listKey.currentState!.insertItem(_items.length - 1);
    if (width == 0) {
      setState(() {
        width = widget.width;
      });
    }
  }

  void _removeItem(int index) {
    final AnimatedListState animatedList = _listKey.currentState!;
    MessageFuture future = MessageManager().getFutureByIndex(index);
    _items.removeAt(index);
    MessageManager().removeFuture(future);

    animatedList.removeItem(index, (BuildContext context, Animation<double> animation) {
      throttler.trigger();
      return SizeTransition(
        sizeFactor: animation,
        child: SkyAlert(
          title: future.title,
          type: future.type,
          effect: future.effect,
        ),
      );
    });
    if (MessageManager().MessageSet.isEmpty) {
      setState(() {
        width = 0;
      });
    }
  }

//AbsorbPointer
  @override
  Widget build(BuildContext context) {
    Widget w = GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: IgnorePointer(
        ignoring: true,
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _items.length,
          itemBuilder: (context, index, animation) {
            MessageFuture future = MessageManager().getFutureByIndex(index);
            return SizeTransition(
              sizeFactor: animation,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: SkySpacings().mainSpacing),
                child: SkyAlert(
                  title: future.title,
                  type: future.type,
                  effect: future.effect,
                  showIcon: future.showIcon,
                ),
              ),
            );
          },
        ),
      ),
    );
    if (OverlayLayout().right == null && OverlayLayout().left == null) {
      return Center(
        child: SizedBox(
          width: width,
          child: w,
        ),
      );
    } else {
      return Positioned(
        top: OverlayLayout().top,
        right: OverlayLayout().right,
        left: OverlayLayout().left,
        bottom: OverlayLayout().bottom ?? MediaQuery.of(context).viewInsets.bottom,
        width: width,
        child: w,
      );
    }
  }
}
