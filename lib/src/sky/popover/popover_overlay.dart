part of 'index.dart';

class _PopoverOverlay extends StatefulWidget {
  final Offset target;
  final Offset? clickPosition;
  final SkyPopoverController? tapRegionGroup;
  final Size boxSize;
  final Animation<double> animation;

  const _PopoverOverlay({
    super.key,
    required this.target,
    this.clickPosition,
    required this.tapRegionGroup,
    required this.boxSize,
    required this.animation,
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
              // onPlacementShift: _onPlacementShift,
              // onSizeFind: (Size size){
              //   if(_size!=null) return;
              //   _size = size;
              //   setState(() {
              //
              //   });
              // },
              target: widget.target,
              // placement: widget.placement,
              gap: 10,
              boxSize: widget.boxSize,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: SkyColors().white,
                boxShadow: [SkyShadows.context],
              ),
              child: Text("78788"),
            )),
      ),
    );
    // return ConstrainedBox(
    //   constraints: BoxConstraints(maxHeight: 50, maxWidth: 100),
    //   child: UnconstrainedBox(
    //     child: Container(
    //       height: 50,
    //       width: 100,
    //       color: Colors.blue,
    //       child: Text("78788"),
    //     ),
    //   ),
    // );
  }
}
