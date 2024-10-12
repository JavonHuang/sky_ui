import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../../common/space.dart';

class LoadingDemo1 extends StatefulWidget {
  const LoadingDemo1({super.key});

  @override
  State<LoadingDemo1> createState() => _LoadingDemo1State();
}

class _LoadingDemo1State extends State<LoadingDemo1> {
  late SkyLoading skyLoading_1 = SkyLoading(hidden: false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        skyLoading_1.builder(
          context,
          child: const SizedBox(
            height: 100,
            child: Text("内容区域区域加载"),
          ),
        ),
      ],
    );
  }
}
