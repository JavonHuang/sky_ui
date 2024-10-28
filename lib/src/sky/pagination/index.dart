import 'package:flutter/material.dart';
import 'package:sky_ui/src/sky/common/sky_hover.dart';
import '../../styles/styles.dart';
part 'pagination_controller.dart';
part 'setting.dart';

class SkyPagination extends StatefulWidget {
  final SkyPaginationController? controller;
  final int currentPage;
  final int pageSize;
  final int total;
  final int pagerCount;
  final String? preText;
  final String? nextText;
  final SkyPaginationLayout layout;
  const SkyPagination({
    super.key,
    this.controller,
    this.currentPage = 1,
    this.pageSize = 10,
    required this.total,
    this.pagerCount = 7,
    this.preText,
    this.nextText,
    this.layout = const SkyPaginationLayout(prev: true, pager: true, next: true, jumper: true, total: true, sizes: true),
  });

  @override
  State<SkyPagination> createState() => _SkyPaginationState();
}

class _SkyPaginationState extends State<SkyPagination> {
  SkyPaginationController? _internalController;

  late int _currentPage = 1;

  SkyPaginationController get controller => widget.controller ?? _internalController!;
  List<int> get pageList => List.generate((widget.total / widget.pageSize).ceil(), (e) => e + 1);
  int get median => widget.pagerCount - 2;
  int get span => (median / 2).floor();

  List<int> get showPageList {
    List<int> result = [];
    int start = 0;
    int end = 0;
    if (_currentPage < median) {
      start = 0;
    } else {
      start = _currentPage - span - 1;
    }
    if (_currentPage + span < widget.pagerCount) {
      end = widget.pagerCount - 1;
    } else {
      end = _currentPage + span;
      if (end >= pageList.length) {
        end = pageList.length - 1;
        start = end - median;
      }
    }
    if (start > 0) {
      result.add(1);
    }
    result.addAll([...pageList.sublist(start, end)]);
    if (end < pageList.length) {
      result.add(pageList.last);
    }
    return result;
  }

  bool get showPrePagerCount {
    if (pageList.length > widget.pagerCount && showPageList[1] - showPageList[0] > 1) {
      return true;
    }
    return false;
  }

  bool get showNextPagerCount {
    if (pageList.length > widget.pagerCount && showPageList.last - showPageList[showPageList.length - 2] > 1) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = SkyPaginationController();
    }
    _currentPage = widget.currentPage;
    controller._attach(this);
  }

  @override
  void dispose() {
    controller._detach(this);
    super.dispose();
  }

  List<Widget> renderPageItem() {
    List<Widget> result = [];
    result = showPageList.map(
      (e) {
        return SkyHover(
          disabled: false,
          onTap: () {
            setState(() {
              _currentPage = e;
            });
          },
          builder: (context, onHover, setvalue) {
            return Container(
              alignment: Alignment.center,
              width: 35,
              child: Text(
                e.toString(),
                style: TextStyle(
                  color: onHover || _currentPage == e ? SkyColors().primary : SkyColors().primaryText,
                ),
              ),
            );
          },
        );
      },
    ).toList();
    if (showPrePagerCount) {
      result.insert(
        1,
        SkyHover(
          disabled: false,
          builder: (context, onHover, setvalue) {
            return Container(
              alignment: Alignment.center,
              width: 35,
              child: Icon(
                onHover ? ElementIcons.dArrowLeft : ElementIcons.more,
                color: onHover ? SkyColors().primary : SkyColors().primaryText,
                size: SkyIconSizes().mediumFont,
              ),
            );
          },
        ),
      );
    }
    if (showNextPagerCount) {
      result.insert(
        result.length - 2,
        SkyHover(
          disabled: false,
          builder: (context, onHover, setvalue) {
            return Container(
              alignment: Alignment.center,
              width: 35,
              child: Icon(
                onHover ? ElementIcons.dArrowRight : ElementIcons.more,
                color: onHover ? SkyColors().primary : SkyColors().primaryText,
                size: SkyIconSizes().mediumFont,
              ),
            );
          },
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SkyHover(
            disabled: false,
            builder: (context, onHover, setvalue) {
              return Container(
                alignment: Alignment.center,
                width: 35,
                child: Icon(
                  ElementIcons.arrowLeft,
                  color: onHover ? SkyColors().primary : SkyColors().primaryText,
                  size: SkyIconSizes().mediumFont,
                ),
              );
            },
          ),
          ...renderPageItem(),
          SkyHover(
            disabled: false,
            builder: (context, onHover, setvalue) {
              return Container(
                alignment: Alignment.center,
                width: 35,
                child: Icon(
                  ElementIcons.arrowRight,
                  color: onHover ? SkyColors().primary : SkyColors().primaryText,
                  size: SkyIconSizes().mediumFont,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
