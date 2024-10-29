import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ParentSizeProvider(
              size: Size(300, 200), // 假设这是父元素的大小
              child: SkyEmpty(),
            )
          ],
        ),
      ),
    );
  }
}
