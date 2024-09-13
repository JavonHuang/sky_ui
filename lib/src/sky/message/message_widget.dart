import 'dart:async';

import 'package:flutter/material.dart';

import '../alert/index.dart';

class MessageWidget extends StatefulWidget {
  final Widget child;

  const MessageWidget({
    super.key,
    required this.child,
  });

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> with SingleTickerProviderStateMixin {
  /// Start the showing animations for the toast
  showIt() {
    _animationController!.forward();
  }

  /// Start the hidding animations for the toast
  hideIt() {
    _animationController!.reverse();
    _timer?.cancel();
  }

  /// Controller to start and hide the animation
  AnimationController? _animationController;
  late Animation _fadeAnimation;

  Timer? _timer;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
    _fadeAnimation = CurvedAnimation(parent: _animationController!, curve: Curves.easeIn);
    super.initState();

    showIt();
    _timer = Timer(Duration(milliseconds: 3000), () {
      hideIt();
    });
  }

  @override
  void deactivate() {
    _timer?.cancel();
    _animationController!.stop();
    super.deactivate();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: IgnorePointer(
        child: FadeTransition(
          opacity: _fadeAnimation as Animation<double>,
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Align(
  //     alignment: FractionalOffset(0.5, 0.2),
  //     child: UnconstrainedBox(
  //       child: Material(
  //         color: Color.fromARGB(0, 0, 0, 0),
  //         child: Container(
  //           // height: 100,
  //           width: 500,
  //           child: const SkyAlert(
  //             title: "不可关闭的 alert",
  //             type: SkyAlertType.success,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
