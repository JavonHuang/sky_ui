import 'package:flutter/material.dart';
import 'package:sky_ui/src/sky/alert/index.dart';

import '../register/index.dart';
import 'message_manager.dart';
import 'message_widget.dart';

class OverlayLayout {
  OverlayLayout._privateConstructor();

  static final OverlayLayout _instance = OverlayLayout._privateConstructor();

  factory OverlayLayout() => _instance;
  static final GlobalKey<LayoutState> layoutKey = GlobalKey<LayoutState>();
  static final GlobalKey<NavigatorState>? navigatorKey = SkyInit().navigatorKey;

  static final OverlayEntry layout = OverlayEntry(
    builder: (context) {
      return Positioned(
        top: 0,
        width: 200,
        // bottom: 0,
        bottom: MediaQuery.of(context!).viewInsets.bottom,
        child: Layout(
          key: layoutKey,
        ),
      );
    },
  );

  void init() {
    navigatorKey!.currentState!.overlay!.insert(layout);
  }

  void insertEntry() {
    if (layoutKey.currentState != null) {
      layoutKey.currentState!.insertEntry();
    }

    // if (MessageManager().MessageSet.isEmpty) {
    //   navigatorKey!.currentState!.overlay!.insert(layout);
    //   layout.addListener(() {
    //     if (layoutKey.currentState != null) {
    //       layoutKey.currentState!.insertEntry();
    //     }
    //   });
    // } else {
    //   layoutKey.currentState!.insertEntry();
    // }
  }
}

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => LayoutState();
}

class LayoutState extends State<Layout> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  late List<int> _items = [];

  void insertEntry() {
    _items.insert(0, _items.length);
    _listKey.currentState!.insertItem(_items.length - 1);

    setState(() {});
  }

  void _removeItem(int index) {
    final AnimatedListState animatedList = _listKey.currentState!;
    int item = _items.removeAt(index);
    animatedList.removeItem(index, (BuildContext context, Animation<double> animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: Card(
          child: ListTile(
            title: Text('Item $item'),
          ),
        ),
      );
    });
  }

//AbsorbPointer
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: IgnorePointer(
        ignoring: true,
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _items.length,
          itemBuilder: (context, index, animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: Card(
                child: SkyAlert(
                  title: "测试",
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
