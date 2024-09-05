import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'common/display_block.dart';
import 'common/title.dart';

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({super.key});

  @override
  State<CheckboxDemo> createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "Checkbox 多选框",
          descr: "一组备选项中进行多选",
        ),
        const DemoTitle(
          title: "基础用法",
          descr: "单独使用可以表示两种状态之间的切换，写在标签中的内容为 checkbox 按钮后的介绍。",
        ),
        const DisplayBlock(
          children: [
            SkyRow(
              gutter: 10,
              children: [
                SkyCheckbox(
                  text: "备选项",
                  label: "备选项",
                  model: true,
                ),
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "禁用状态",
          descr: "多选框不可用状态。",
        ),
        const DisplayBlock(
          children: [
            SkyRow(
              gutter: 10,
              children: [
                SkyCheckbox(
                  text: "备选项1",
                  label: "备选项1",
                  disabled: true,
                ),
                SkyCheckbox(
                  text: "备选项",
                  label: "备选项",
                  disabled: true,
                ),
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "多选框组",
          descr: "适用于多个勾选框绑定到同一个数组的情景，通过是否勾选来表示这一组选项中选中的项。",
        ),
        DisplayBlock(
          children: [
            SkyRow(
              gutter: 10,
              children: [
                SkyCheckboxGroup(
                  model: ["val1", "val5"],
                  children: [
                    SkyCheckboxOption(
                      text: "复选A",
                      label: "val1",
                    ),
                    SkyCheckboxOption(
                      text: "复选B",
                      label: "val2",
                    ),
                    SkyCheckboxOption(
                      text: "复选C",
                      label: "val3",
                    ),
                    SkyCheckboxOption(
                      text: "禁用",
                      label: "val4",
                    ),
                    SkyCheckboxOption(
                      text: "选中且禁用",
                      label: "val5",
                      disabled: true,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
