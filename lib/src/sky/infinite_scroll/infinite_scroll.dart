library infinite_scroll;

import 'package:flutter/material.dart';

class SkyInfiniteScroll<T> extends StatefulWidget {
  const SkyInfiniteScroll({
    super.key,
    required this.loadFinish,
    required this.data,
    required this.itemBuilder,
    this.loadMore,
    this.controller,
    this.scrollbars = true,
    required this.loading,
    this.showTips = true,
  });
  final bool loadFinish;
  final List<T> data;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Function()? loadMore;
  final ScrollController? controller;
  final bool scrollbars;
  final bool showTips;
  final bool loading;

  @override
  State<SkyInfiniteScroll> createState() => _SkyInfiniteScrollState();
}

class _SkyInfiniteScrollState extends State<SkyInfiniteScroll> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: widget.scrollbars),
      child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          controller: widget.controller,
          itemCount: widget.data.length + (widget.loadFinish || widget.loading ? 1 : 0),
          itemBuilder: (context, index) {
            if (widget.loadFinish && index == widget.data.length) {
              return SizedBox(
                height: 50,
                child: Center(child: Text(widget.showTips ? '没有更多了' : '')),
              );
            }
            if (widget.loading && index == widget.data.length) {
              return SizedBox(
                height: 50,
                child: Center(
                  child: widget.showTips ? const CircularProgressIndicator() : const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.transparent)),
                ),
              );
            }
            if (index == widget.data.length - 1 && widget.loadMore != null && !widget.loadFinish) {
              Future.delayed(const Duration(seconds: 0), () {
                widget.loadMore!.call();
              });
            }
            return widget.itemBuilder(context, index);
          }),
    );
  }
}
