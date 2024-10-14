part of 'index.dart';

class _PopoverOverlay extends StatefulWidget {
  final Widget? child;
  final Offset target;
  final Offset? clickPosition;
  final SkyPopoverController? tapRegionGroup;
  final Size boxSize;
  final Animation<double> animation;
  final SkyPlacement placement;

  const _PopoverOverlay({
    super.key,
    required this.target,
    this.clickPosition,
    required this.tapRegionGroup,
    required this.boxSize,
    required this.animation,
    this.child,
    required this.placement,
  });

  @override
  State<_PopoverOverlay> createState() => _PopoverOverlayState();
}

class _PopoverOverlayState extends State<_PopoverOverlay> {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: 0.0,
      child: FadeTransition(
        opacity: widget.animation,
        child: CustomSingleChildLayout(
            delegate: PopoverPositionDelegate(
              clickPosition: widget.clickPosition,
              // offsetCalculator: widget.offsetCalculator,
              // onPlacementShift: _onPlacementShift,3
              // onSizeFind: (Size size){zauu8
              //   if(_size!=null) return;sa
              //   _size = size;
              //   setState(() {
              //
              //   });
              // },
              target: widget.target,
              placement: widget.placement,
              gap: 20,
              boxSize: widget.boxSize,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.scaleSpacing, vertical: 12.scaleSpacing),
              decoration: BoxDecoration(
                color: SkyColors().white,
                boxShadow: [SkyShadows.context],
              ),
              child: widget.child ?? const SizedBox(),
            )),
      ),
    );
  }
}
