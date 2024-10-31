import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  bool _absorb = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print('GestureDetector clicked');
      },
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Enter text',
          ),
          onTap: () {
            print('TextField clicked');
            // 这里可以添加额外的逻辑
          },
        ),
      ),
    );
  }
}
