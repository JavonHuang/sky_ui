library infinite_scroll;

import 'package:flutter/material.dart';

class InfiniteScroll<T> extends StatefulWidget {
  const InfiniteScroll({
    super.key,
    required this.loadFinish,
    required this.data,
    required this.itemBuilder,
    this.loadMore,
    this.controller,
    this.scrollbars = true,
  });
  final bool loadFinish;
  final List<T> data;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Function()? loadMore;
  final ScrollController? controller;
  final bool scrollbars;

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: widget.scrollbars),
      child: ListView.builder(
          controller: widget.controller,
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            if (index == widget.data.length - 1 && widget.loadMore != null && !widget.loadFinish) {
              widget.loadMore!.call();
            }
            return widget.itemBuilder(context, index);
          }),
    );
  }
}
