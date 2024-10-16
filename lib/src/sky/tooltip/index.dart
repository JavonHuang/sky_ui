import 'package:flutter/material.dart';
import 'package:sky_ui/src/utils/utils.dart';

import '../../styles/styles.dart';
import '../common/position_delegate.dart';
import '../common/sky_hover.dart';
part 'tooltip_overlay.dart';

class SkyTooltip extends StatefulWidget {
  final Widget child;
  final String? content;
  final Duration reverseDuration;
  final Duration animDuration;
  final SkyPlacement placement;
  final double gutter;
  final Color bgColor;
  final bool disabled;
  const SkyTooltip({
    super.key,
    required this.child,
    this.content,
    this.placement = SkyPlacement.topCenter,
    this.animDuration = const Duration(milliseconds: 100),
    this.reverseDuration = const Duration(milliseconds: 100),
    this.gutter = 10,
    this.bgColor = Colors.black,
    this.disabled = false,
  });

  @override
  State<SkyTooltip> createState() => _SkyTooltipState();
}

class _SkyTooltipState extends State<SkyTooltip> with TickerProviderStateMixin, WidgetsBindingObserver {
  final OverlayPortalController overlayController = OverlayPortalController();
  AnimationController? animationInitPopoverController;

  bool get isOpen => overlayController.isShowing;

  @override
  void initState() {
    super.initState();
    animationInitPopoverController = AnimationController(
      duration: widget.animDuration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    )..addStatusListener(handleStatusChanged);
    WidgetsBinding.instance.addObserver(this);
  }

  void handleStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.dismissed && mounted) {
      if (isOpen) {
        overlayController.hide();
      }
    }
  }

  void open({Offset? position}) {
    if (isOpen || widget.disabled) return;
    animationInitPopoverController!.forward();
    overlayController.show();
  }

  void close() {
    if (!isOpen) return;
    animationInitPopoverController!.reverse();
    overlayController.hide();
  }

  //监听窗口尺寸变化
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    close();
  }

  @override
  Widget build(BuildContext context) {
    return SkyHover(
      disabled: false,
      onchanged: (hover) {
        if (hover) {
          open();
        } else {
          close();
        }
      },
      child: TapRegion(
        onTapOutside: (PointerDownEvent event) {
          close();
        },
        child: OverlayPortal(
          controller: overlayController,
          overlayChildBuilder: (ctx) {
            final OverlayState overlayState = Overlay.of(context, debugRequiredFor: widget);
            final RenderBox box = this.context.findRenderObject()! as RenderBox;
            Offset target = box.localToGlobal(
              box.size.center(Offset.zero),
              ancestor: overlayState.context.findRenderObject(),
            );
            return _TooltipOverlay(
              color: widget.bgColor,
              placement: widget.placement,
              target: target,
              boxSize: box.size,
              animation: animationInitPopoverController!,
              gutter: widget.gutter,
              child: Text(
                widget.content ?? '',
                style: TextStyle(
                  color: SkyColors().white,
                ),
              ),
            );
          },
          child: widget.child,
        ),
      ),
    );
  }
}
