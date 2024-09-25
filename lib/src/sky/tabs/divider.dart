import 'package:flutter/material.dart';
import 'package:sky_ui/src/styles/styles.dart';

class TabDivider extends StatefulWidget {
  const TabDivider({super.key});

  @override
  State<TabDivider> createState() => TabDividerState();
}

class TabDividerState extends State<TabDivider> with SingleTickerProviderStateMixin {
  late double offsetX = 0;
  late double offsetWidth = 0;
  late AnimationController? _controller;
  late Animation<RelativeRect> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(200, 0, 300, 0),
      end: RelativeRect.fromLTRB(600, 0, 700, 0),
    ).animate(_controller!);
    _controller!.forward();
  }

  void movedOffsetX(double e, double w) {
    setState(() {
      offsetX = e;
      offsetWidth = w;
    });

    // var begin = RelativeRect.fromLTRB(offsetX, 0, offsetX + offsetWidth, 0);
    // var end = RelativeRect.fromLTRB(e, 0, e + w, 0);

    // // setState(() {
    // offsetX = e;
    // offsetWidth = w;
    // // });
    // _animation = RelativeRectTween(
    //   begin: begin,
    //   end: end,
    // ).animate(_controller!);
    // _controller!.reset();
    // _controller!.forward();

    // setState(() {});
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 2,
          color: SkyColors().transparent,
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          curve: Curves.elasticInOut,
          left: offsetX, // 开始位置
          // right: 150.0, // 结束位置
          child: Container(
            color: SkyColors().primary,
            height: 2,
            width: offsetWidth,
          ),
        ),

        // PositionedTransition(
        //   rect: _animation,
        //   child: Container(
        //     height: 2,
        //     width: 60,
        //     color: SkyColors().primary,
        //   ),
        // )
        // Positioned(
        //   bottom: 0,
        //   left: offsetX,
        //   child: Container(
        //     height: 2,
        //     width: offsetWidth,
        //     color: SkyColors().primary,
        //   ),
        // ),
      ],
    );
  }
}
