import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class TreeDemo3 extends StatefulWidget {
  const TreeDemo3({super.key});

  @override
  State<TreeDemo3> createState() => _TreeDemo3State();
}

class _TreeDemo3State extends State<TreeDemo3> {
  List<SkyTreeNode> childrenData = [
    SkyTreeNode(
      index: "1",
      isExpend: true,
      data: const SkyTreeMeta(
        label: "一级1",
      ),
    ),
    // SkyTreeNode(
    //   index: "2",
    //   data: SkyTreeMeta(
    //     label: "一级2",
    //   ),
    // ),
    // SkyTreeNode(
    //   index: "3",
    //   data: SkyTreeMeta(
    //     label: "一级3",
    //   ),
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyTree(
          children: childrenData,
          lazy: true,
          showCheckbox: true,
          load: (SkyTreeNode e) async {
            await Future.delayed(const Duration(seconds: 1));

            if (e.index == '1') {
              return Future.value([
                SkyTreeNode(
                  index: "1-1",
                  data: const SkyTreeMeta(
                    label: "二级1-1",
                  ),
                ),
                SkyTreeNode(
                  index: "1-2",
                  data: const SkyTreeMeta(
                    label: "二级1-2",
                  ),
                ),
              ]);
            } else if (e.index == '2') {
              return Future.value([
                SkyTreeNode(
                  index: "2-1",
                  data: const SkyTreeMeta(
                    label: "二级2-1",
                  ),
                ),
              ]);
            }
            return Future.value([]);
          },
        ),
      ],
    );
  }
}
