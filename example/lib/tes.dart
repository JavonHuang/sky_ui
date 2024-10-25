import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class TestDemo extends StatefulWidget {
  const TestDemo({super.key});

  @override
  State<TestDemo> createState() => _TestDemoState();
}

class _TestDemoState extends State<TestDemo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.lightBlue,
            alignment: Alignment.center,
            child: const Text('Tap me (Parent)'),
          ),
          AbsorbPointer(
            absorbing: true,
            child: GestureDetector(
              behavior: HitTestBehavior.deferToChild, // 显式指定，但默认就是 opaque
              onTap: () {
                // 这个回调不应该被调用
              },
              child: Container(
                height: 100,
                color: Colors.lightGreen,
                alignment: Alignment.center,
                child: const Text('Tap me (Child)'),
              ),
            ),
          ),
          Container(
            color: Colors.lightGreen,
            height: 100,
            child: ClipPath(
              clipper: MyCustomClipper(),
              // borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                    '按钮',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 10);
    path.lineTo(0, size.height - 10);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Column(
      children: [SkyInput()],
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  // Size childSize  =ChildLayoutHelper.layoutChild(Text("34567890") as RenderBox, constraints)
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkyInput(),
      ],
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [SkyInput()],
    );
  }
}

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [SkyInput()],
    );
  }
}
