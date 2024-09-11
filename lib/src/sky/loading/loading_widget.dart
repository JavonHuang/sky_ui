import 'package:flutter/material.dart';

import '../../../sky_ui.dart';

class SkyLoadingWidget extends StatefulWidget {
  final bool body;
  final Widget? textWidget;

  const SkyLoadingWidget({
    super.key,
    required this.body,
    this.textWidget,
  });

  @override
  State<SkyLoadingWidget> createState() => SkyLoadingWidgetState();
}

class SkyLoadingWidgetState extends State<SkyLoadingWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _loadingItem(double opacity) => Container(
        height: 14,
        width: 14,
        decoration: BoxDecoration(
          color: SkyColors().primary.withOpacity(opacity),
          shape: BoxShape.circle,
        ),
      );

  Widget _buildLoading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
          child: SizedBox(
            width: 36,
            height: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _loadingItem(0.4),
                    _loadingItem(0.6),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _loadingItem(0.8),
                    _loadingItem(1),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: SkySpacings().textSpacing,
        ),
        if(widget.textWidget!=null)
        widget.textWidget!,
 if(widget.textWidget==null)
        Text(
          SkyLoading().defaultLoadingText,
          style: TextStyle(
            decoration: TextDecoration.none,
            color: SkyColors().primaryText,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
            fontSize: 17,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.body) {
      return _buildLoading();
    } else {
      return Positioned(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: _buildLoading(),
      );
    }
  }
}
