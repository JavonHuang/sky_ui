import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class LoadingDemo2 extends StatefulWidget {
  const LoadingDemo2({super.key});

  @override
  State<LoadingDemo2> createState() => _LoadingDemo2State();
}

class _LoadingDemo2State extends State<LoadingDemo2> {
  late SkyLoading skyLoading_2 = SkyLoading(hidden: false, customizeColor: const Color.fromARGB(61, 0, 0, 0));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        skyLoading_2.builder(
          context,
          loadingText: "自定义加载文案",
          textWidget: Icon(
            size: 40,
            ElementIcons.loading,
            color: SkyColors().primary,
          ),
          child: const SizedBox(
            height: 100,
            child: Text("内容区域区域加载"),
          ),
        ),
      ],
    );
  }
}
