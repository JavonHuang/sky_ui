import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'package:sky_ui/src/sky/common/sky_hover.dart';
part 'pagination_controller.dart';
part 'setting.dart';

class SkyPagination extends StatefulWidget {
  final SkyPaginationController? controller;
  final int currentPage;
  final int pageSize;
  final List<int> pageSizes;
  final int total;
  final int pagerCount;
  final String? preText;
  final String? nextText;
  final SkyPaginationLayout layout;
  final bool background;
  final Function(int size)? sizeChange;
  final Function(int currentPage)? currentChange;
  final Function(int currentPage)? prevClick;
  final Function(int currentPage)? nextClick;

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
    this.background = false,
    this.pageSizes = const [10, 20, 30, 50],
    this.sizeChange,
    this.currentChange,
    this.prevClick,
    this.nextClick,
  });

  @override
  State<SkyPagination> createState() => _SkyPaginationState();
}

class _SkyPaginationState extends State<SkyPagination> {
  SkyPopoverController controllerPageSize = SkyPopoverController();

  SkyPaginationController? _internalController;
  late Size boxSize = const Size(25, 25);
  late EdgeInsetsGeometry margin = EdgeInsets.symmetric(horizontal: 2.scaleSpacing);
  late int _currentPage = 1;
  late int _pageSize = 10;
  late int _total = 0;
  late int _pagerCount = 7;

  SkyPaginationController get controller => widget.controller ?? _internalController!;
  List<int> get pageList => List.generate((_total / _pageSize).ceil(), (e) => e + 1);
  int get median => _pagerCount - 2;
  int get span => (median / 2).floor();

  List<int> get showPageList {
    List<int> result = [];
    int start = 0;
    int end = 0;
    if (pageList.last < 7) {
      return pageList;
    }
    if (_currentPage < median) {
      start = 0;
    } else {
      start = _currentPage - span - 1;
    }
    if (_currentPage + span < _pagerCount) {
      end = _pagerCount - 1;
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
    if (pageList.length > _pagerCount && showPageList[1] - showPageList[0] > 1) {
      return true;
    }
    return false;
  }

  bool get showNextPagerCount {
    if (pageList.length > _pagerCount && showPageList.last - showPageList[showPageList.length - 2] > 1) {
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
    _pageSize = widget.pageSize;
    _total = widget.total;
    _pagerCount = widget.pagerCount;
    controller._attach(this);
  }

  @override
  void dispose() {
    controller._detach(this);
    super.dispose();
  }

  void changedCurrentPage(int offset) {
    if (_currentPage + offset > pageList.last) {
      _currentPage = pageList.last;
    } else if (_currentPage + offset < 1) {
      _currentPage = 1;
    } else {
      _currentPage = _currentPage + offset;
    }
    widget.currentChange?.call(_currentPage);
    reflesh();
  }

  void pageSizeChanged(int val) {
    _pageSize = val;
    if (_currentPage > pageList.last) {
      _currentPage = pageList.last;
    }
    widget.sizeChange?.call(_pageSize);
    reflesh();
  }

  void reflesh() {
    setState(() {});
  }

  List<Widget> renderPageItem() {
    List<Widget> result = [];
    result = showPageList.map(
      (e) {
        return SkyHover(
          disabled: false,
          onTap: () {
            _currentPage = e;
            changedCurrentPage(0);
          },
          builder: (context, onHover, setvalue) {
            Color textColor = SkyColors().primaryText;
            if (widget.background && _currentPage == e) {
              textColor = SkyColors().white;
            } else {
              textColor = onHover || _currentPage == e ? SkyColors().primary : SkyColors().primaryText;
            }
            return Container(
              alignment: Alignment.center,
              margin: margin,
              width: boxSize.width,
              height: boxSize.height,
              decoration: BoxDecoration(
                color: widget.background ? (_currentPage == e ? SkyColors().primary : SkyColors().defaultBg) : null,
                borderRadius: SkyBorderRadius().smallBorderRadius,
              ),
              child: Text(
                e.toString(),
                style: TextStyle(color: textColor, fontSize: SkyFontSizes().auxiliaryFont),
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
          onTap: () {
            changedCurrentPage(-_pagerCount);
          },
          builder: (context, onHover, setvalue) {
            return Container(
              alignment: Alignment.center,
              margin: margin,
              width: boxSize.width,
              height: boxSize.height,
              decoration: BoxDecoration(
                color: widget.background ? SkyColors().defaultBg : null,
                borderRadius: SkyBorderRadius().smallBorderRadius,
              ),
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
        result.length - 1,
        SkyHover(
          disabled: false,
          onTap: () {
            changedCurrentPage(_pagerCount);
          },
          builder: (context, onHover, setvalue) {
            return Container(
              alignment: Alignment.center,
              margin: margin,
              width: boxSize.width,
              height: boxSize.height,
              decoration: BoxDecoration(
                color: widget.background ? SkyColors().defaultBg : null,
                borderRadius: SkyBorderRadius().smallBorderRadius,
              ),
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
    Widget pageSizeWidget = Column(
      mainAxisSize: MainAxisSize.min,
      children: widget.pageSizes.map((e) {
        return SkyHover(
          disabled: false,
          onTap: () {
            pageSizeChanged(e);
          },
          builder: (context, onHover, setvalue) {
            return Container(
              color: onHover ? SkyColors().defaultBg : null,
              padding: EdgeInsets.symmetric(vertical: 4.scaleSpacing),
              child: Text(
                "$e条/页",
                style: TextStyle(
                  color: onHover ? SkyColors().primary : SkyColors().regularText,
                  fontSize: SkyFontSizes().auxiliaryFont,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
    return IntrinsicHeight(
      child: Row(
        children: [
          if (widget.layout.prev)
            SkyHover(
              disabled: _currentPage == 1,
              onTap: () {
                changedCurrentPage(-1);
                widget.prevClick?.call(_currentPage);
              },
              builder: (context, onHover, setvalue) {
                Color preColor = SkyColors().primaryText;
                if (onHover) {
                  preColor = SkyColors().primary;
                }
                if (_currentPage == 1) {
                  preColor = SkyColors().placeholderText;
                }

                return Container(
                  alignment: Alignment.center,
                  margin: margin,
                  width: widget.preText != null ? null : boxSize.width,
                  height: boxSize.height,
                  decoration: BoxDecoration(
                    color: widget.background ? SkyColors().defaultBg : null,
                    borderRadius: SkyBorderRadius().smallBorderRadius,
                  ),
                  child: widget.preText != null
                      ? Text(
                          widget.preText!,
                          style: TextStyle(
                            color: preColor,
                            fontSize: SkyFontSizes().auxiliaryFont,
                          ),
                        )
                      : Icon(
                          ElementIcons.arrowLeft,
                          color: preColor,
                          size: SkyIconSizes().mediumFont,
                        ),
                );
              },
            ),
          if (widget.layout.pager) ...renderPageItem(),
          if (widget.layout.next)
            SkyHover(
              disabled: _currentPage == pageList.last,
              onTap: () {
                changedCurrentPage(1);
                widget.nextClick?.call(_currentPage);
              },
              builder: (context, onHover, setvalue) {
                Color nextColor = SkyColors().primaryText;
                if (onHover) {
                  nextColor = SkyColors().primary;
                }
                if (_currentPage == pageList.last) {
                  nextColor = SkyColors().placeholderText;
                }
                return Container(
                  alignment: Alignment.center,
                  margin: margin,
                  width: widget.nextText != null ? null : boxSize.width,
                  height: boxSize.height,
                  decoration: BoxDecoration(
                    color: widget.background ? SkyColors().defaultBg : null,
                    borderRadius: SkyBorderRadius().smallBorderRadius,
                  ),
                  child: widget.nextText != null
                      ? Text(
                          widget.nextText!,
                          style: TextStyle(
                            color: nextColor,
                            fontSize: SkyFontSizes().auxiliaryFont,
                          ),
                        )
                      : Icon(
                          ElementIcons.arrowRight,
                          color: nextColor,
                          size: SkyIconSizes().mediumFont,
                        ),
                );
              },
            ),
          if (widget.layout.jumper)
            Container(
              alignment: Alignment.center,
              margin: margin,
              // height: boxSize.height,
              width: 100,
              child: Row(
                children: [
                  Text(
                    "前往",
                    style: TextStyle(
                      color: SkyColors().regularText,
                      fontSize: SkyFontSizes().auxiliaryFont,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.scaleSpacing),
                      child: SkyInputNumber(
                        size: SkySize.small,
                        showCtr: false,
                        model: _currentPage.toDouble(),
                        max: pageList.last.toDouble(),
                        precision: 0,
                        blur: (e) {
                          int val = int.tryParse(e.toString()) ?? e!.toInt();
                          int result = 0;

                          if (val > pageList.last) {
                            result = pageList.last;
                          } else {
                            result = val;
                          }
                          changedCurrentPage(result - _currentPage);
                        },
                      ),
                    ),
                  ),
                  Text(
                    "页",
                    style: TextStyle(
                      color: SkyColors().regularText,
                      fontSize: SkyFontSizes().auxiliaryFont,
                    ),
                  ),
                ],
              ),
            ),
          if (widget.layout.sizes)
            SkyHover(
              disabled: false,
              onTap: () {
                if (controllerPageSize.isOpen) {
                  controllerPageSize.close();
                } else {
                  controllerPageSize.open();
                }
              },
              child: SkyPopover(
                trigger: SkyPopoverTrigger.manual,
                controller: controllerPageSize,
                popoverChild: pageSizeWidget,
                child: Container(
                  alignment: Alignment.center,
                  margin: margin,
                  padding: EdgeInsets.symmetric(horizontal: 4.scaleSpacing),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: SkyColors().baseBorder,
                    ),
                    borderRadius: SkyBorderRadius().normalBorderRadius,
                  ),
                  child: Row(
                    children: [
                      Text(
                        " $_total 条/页",
                        style: TextStyle(
                          color: SkyColors().regularText,
                          fontSize: SkyFontSizes().auxiliaryFont,
                        ),
                      ),
                      Icon(
                        ElementIcons.arrowDown,
                        size: SkyIconSizes().smallFont,
                      )
                    ],
                  ),
                ),
              ),
            ),
          if (widget.layout.total)
            Container(
              alignment: Alignment.center,
              margin: margin,
              height: boxSize.height,
              child: Text(
                "共 $_total 条",
                style: TextStyle(
                  color: SkyColors().regularText,
                  fontSize: SkyFontSizes().auxiliaryFont,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
