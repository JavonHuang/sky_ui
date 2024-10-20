import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class TreeDemo6 extends StatefulWidget {
  const TreeDemo6({super.key});

  @override
  State<TreeDemo6> createState() => _TreeDemo6State();
}

class _TreeDemo6State extends State<TreeDemo6> {
  List<SkyTreeNode> childrenData = [
    SkyTreeNode(
      index: "1",
      isExpend: true,
      data: SkyTreeMeta(
        label: "一级1",
      ),
      children: [
        SkyTreeNode(
          index: "1-1",
          data: SkyTreeMeta(
            label: "二级1-1",
          ),
        ),
        SkyTreeNode(
          index: "1-2",
          data: SkyTreeMeta(
            label: "二级1-2",
          ),
          children: [
            SkyTreeNode(
              index: "1-2-1",
              data: SkyTreeMeta(
                label: "三级1-2-1",
              ),
            )
          ],
        ),
      ],
    ),
    SkyTreeNode(
        index: "2",
        data: SkyTreeMeta(
          label: "一级2",
        ),
        children: [
          SkyTreeNode(
            index: "2-1",
            data: SkyTreeMeta(
              label: "二级2-1",
            ),
          ),
        ]),
    SkyTreeNode(
      index: "3",
      data: SkyTreeMeta(
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
          accordion: true,
          buildContent: (e) {
            return Row(
              children: [
                Text(e.data.label),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SkyButton(
                        type: SkyType.text,
                        text: "Append",
                        customSize: Size(70, 20),
                      ),
                      SkyButton(
                        type: SkyType.text,
                        text: "Delete",
                        customSize: Size(70, 20),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
