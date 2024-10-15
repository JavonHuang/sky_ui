part of 'index.dart';

class _PopoverOverlay extends StatefulWidget {
  final Widget? child;
  final Offset target;
  final SkyPopoverController? tapRegionGroup;
  final Size boxSize;
  final Animation<double> animation;
  final SkyPlacement placement;
  final double gutter;

  const _PopoverOverlay({
    required this.target,
    required this.tapRegionGroup,
    required this.boxSize,
    required this.animation,
    this.child,
    required this.placement,
    required this.gutter,
  });

  @override
  State<_PopoverOverlay> createState() => _PopoverOverlayState();
}

class _PopoverOverlayState extends State<_PopoverOverlay> {
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
                color: Colors.black,
                boxSize: widget.boxSize,
                shiftX: 0,
                shadows: [SkyShadows.context],
                placement: effectPlacement,
                borderColor: const Color(0xff414243),
                radius: const Radius.circular(4),
                style: PaintingStyle.fill,
              ),
              child: widget.child ?? const SizedBox(),
            )),
      ),
    );
  }
}
