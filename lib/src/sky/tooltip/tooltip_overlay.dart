part of 'index.dart';

class _TooltipOverlay extends StatefulWidget {
  final Widget? child;
  final Offset target;
  final Size boxSize;
  final Animation<double> animation;
  final SkyPlacement placement;
  final double gutter;
  final Color color;
  const _TooltipOverlay({
    required this.target,
    required this.boxSize,
    required this.animation,
    this.child,
    required this.placement,
    required this.gutter,
    required this.color,
  });

  @override
  State<_TooltipOverlay> createState() => _TooltipOverlayState();
}

class _TooltipOverlayState extends State<_TooltipOverlay> {
  late SkyPlacement effectPlacement = widget.placement;

  void onPlacementChanged(SkyPlacement placement) {
    effectPlacement = placement;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: 0.0,
      child: FadeTransition(
        opacity: widget.animation,
        child: CustomSingleChildLayout(
            delegate: PopoverPositionDelegate(
              target: widget.target,
              placement: widget.placement,
              gutter: widget.gutter,
              boxSize: widget.boxSize,
              onPlacementChanged: onPlacementChanged,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.scaleSpacing, vertical: 12.scaleSpacing),
              decoration: SkyDecoration(
                color: widget.color,
                boxSize: widget.boxSize,
                shiftX: 0,
                shadows: [SkyShadows.context],
                placement: effectPlacement,
                borderColor: SkyColors().lighterBorder,
                radius: const Radius.circular(4),
                style: PaintingStyle.fill,
              ),
              child: widget.child ?? const SizedBox(),
            )),
      ),
    );
  }
}
