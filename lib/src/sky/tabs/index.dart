import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'divider.dart';
import 'tab_bar.dart';
part 'models/tab_options.dart';

class SkyTabs extends StatefulWidget {
  const SkyTabs({
    super.key,
    required this.items,
  });
  final List<TabOption> items;

  @override
  State<SkyTabs> createState() => _SkyTabsState();
}

class _SkyTabsState extends State<SkyTabs> {
  bool _hasScrollbar = false;

  final innerController = ScrollController();

  Widget renderOption() {
    List<Widget> list = [];
    for (int index = 0; index < widget.items.length; index++) {
      TabOption option = widget.items[index];
      EdgeInsetsGeometry padding = EdgeInsets.symmetric(horizontal: 20.scaleSpacing);
      if (index == 0) {
        padding = EdgeInsets.only(right: 20.scaleSpacing);
      }
      if (option == widget.items.last) {
        padding = EdgeInsets.only(left: 20.scaleSpacing);
      }
      list.add(
        Container(
          padding: padding,
          child: SkyTabBar(
            child: option,
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(ElementIcons.arrowLeft),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: SkyColors().white,
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: SkyColors().baseBorder,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 40,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification notification) {
                    if (notification is ScrollUpdateNotification) {
                      final ScrollMetrics metrics = notification.metrics;
                      // 检查是否有滚动内容超出视图
                      _hasScrollbar = metrics.extentAfter > 0;
                    }
                    print(_hasScrollbar);
                    return false;
                  },
                  child: Scrollbar(
                    controller: innerController,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                      child: SingleChildScrollView(
                        controller: innerController,
                        scrollDirection: Axis.horizontal,
                        child: IntrinsicWidth(
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: renderOption(),
                              ),
                              TabDivider(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Icon(ElementIcons.arrowRight),
      ],
    );
  }
}
