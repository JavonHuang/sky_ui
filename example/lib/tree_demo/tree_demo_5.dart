import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class TreeDemo5 extends StatefulWidget {
  const TreeDemo5({super.key});

  @override
  State<TreeDemo5> createState() => _TreeDemo5State();
}

class _TreeDemo5State extends State<TreeDemo5> {
  List<SkyTreeNode> childrenData = [
    SkyTreeNode(
      index: "1",
      isExpend: true,
      data: const SkyTreeMeta(
        label: "一级1",
      ),
      children: [
        SkyTreeNode(
          index: "1-1",
          disabled: true,
          data: const SkyTreeMeta(
            label: "二级1-1",
          ),
        ),
        SkyTreeNode(
          index: "1-2",
          disabled: true,
          data: const SkyTreeMeta(
            label: "二级1-2",
          ),
          children: [
            SkyTreeNode(
              index: "1-2-1",
              data: const SkyTreeMeta(
                label: "三级1-2-1",
              ),
            )
          ],
        ),
      ],
    ),
    SkyTreeNode(
        index: "2",
        data: const SkyTreeMeta(
          label: "一级2",
        ),
        children: [
          SkyTreeNode(
            index: "2-1",
            data: const SkyTreeMeta(
              label: "二级2-1",
            ),
          ),
        ]),
    SkyTreeNode(
      index: "3",
      data: const SkyTreeMeta(
        label: "一级3",
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyTree(
          children: childrenData,
        ),
      ],
    );
  }
}
