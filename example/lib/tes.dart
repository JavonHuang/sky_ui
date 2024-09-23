import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sky_ui/sky_ui.dart';

class TestDemo extends StatefulWidget {
  const TestDemo({super.key});

  @override
  State<TestDemo> createState() => _TestDemoState();
}

class _TestDemoState extends State<TestDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      child: PageView(
        children: [
          Page1(),
          Page2(),
          Page3(),
          Page4(),
        ],
      ),
    );
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
    return const Column(
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
