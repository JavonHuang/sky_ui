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
  });
  final bool loadFinish;
  final List<T> data;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Function()? loadMore;
  final ScrollController? controller;
  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: widget.controller,
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          if (index == widget.data.length - 1 && widget.loadMore != null && !widget.loadFinish) {
            widget.loadMore!.call();
          }
          return widget.itemBuilder(context, index);
        });
  }
}
