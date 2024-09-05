import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'common/display_block.dart';
import 'common/space.dart';
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
        const DemoTitle(
          title: "indeterminate 状态",
          descr: "indeterminate 属性用以表示 checkbox 的不确定状态，一般用于实现全选的效果",
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
                  indeterminate: true,
                ),
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "可选项目数量的限制",
          descr: "使用 min 和 max 属性能够限制可以被勾选的项目的数量。",
        ),
        DisplayBlock(
          children: [
            SkyRow(
              gutter: 10,
              children: [
                SkyCheckboxGroup(
                  model: ["val1", "val3"],
                  min: 1,
                  max: 2,
                  children: [
                    SkyCheckboxOption(
                      text: "上海",
                      label: "val1",
                    ),
                    SkyCheckboxOption(
                      text: "广州",
                      label: "val2",
                    ),
                    SkyCheckboxOption(
                      text: "深圳",
                      label: "val3",
                    ),
                    SkyCheckboxOption(
                      text: "北京",
                      label: "val4",
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "按钮样式",
          descr: "按钮样式的多选组合。",
        ),
        DisplayBlock(
          children: [
            SkyRow(
              children: [
                SkyCheckboxGroup(
                  model: ["val1"],
                  buttonStyle: true,
                  size: SkySize.large,
                  children: [
                    SkyCheckboxOption(
                      text: "上海",
                      label: "val1",
                    ),
                    SkyCheckboxOption(
                      text: "广州",
                      label: "val2",
                    ),
                    SkyCheckboxOption(
                      text: "深圳",
                      label: "val3",
                    ),
                    SkyCheckboxOption(
                      text: "北京",
                      label: "val4",
                    ),
                  ],
                )
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCheckboxGroup(
                  model: ["val1"],
                  buttonStyle: true,
                  size: SkySize.medium,
                  children: [
                    SkyCheckboxOption(
                      text: "上海",
                      label: "val1",
                    ),
                    SkyCheckboxOption(
                      text: "广州",
                      label: "val2",
                    ),
                    SkyCheckboxOption(
                      text: "深圳",
                      label: "val3",
                    ),
                    SkyCheckboxOption(
                      text: "北京",
                      label: "val4",
                    ),
                  ],
                )
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCheckboxGroup(
                  model: ["val1"],
                  buttonStyle: true,
                  size: SkySize.small,
                  children: [
                    SkyCheckboxOption(
                      text: "上海",
                      label: "val1",
                    ),
                    SkyCheckboxOption(
                      text: "广州",
                      label: "val2",
                    ),
                    SkyCheckboxOption(
                      text: "深圳",
                      label: "val3",
                    ),
                    SkyCheckboxOption(
                      text: "北京",
                      label: "val4",
                    ),
                  ],
                )
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCheckboxGroup(
                  model: ["val1"],
                  buttonStyle: true,
                  size: SkySize.mini,
                  children: [
                    SkyCheckboxOption(
                      text: "上海",
                      label: "val1",
                    ),
                    SkyCheckboxOption(
                      text: "广州",
                      label: "val2",
                    ),
                    SkyCheckboxOption(
                      text: "深圳",
                      label: "val3",
                    ),
                    SkyCheckboxOption(
                      text: "北京",
                      label: "val4",
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "带有边框",
          descr: "",
        ),
        const DisplayBlock(
          children: [
            SkyRow(
              gutter: 20,
              children: [
                SkyCheckbox(
                  text: "备选项1",
                  label: "备选项1",
                  border: true,
                  model: true,
                  size: SkySize.large,
                ),
                SkyCheckbox(
                  text: "备选项2",
                  label: "备选项2",
                  border: true,
                  model: false,
                  size: SkySize.large,
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              gutter: 20,
              children: [
                SkyCheckbox(
                  text: "备选项1",
                  label: "备选项1",
                  border: true,
                  model: false,
                  size: SkySize.medium,
                ),
                SkyCheckbox(
                  text: "备选项2",
                  label: "备选项2",
                  border: true,
                  model: true,
                  size: SkySize.medium,
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              gutter: 20,
              children: [
                SkyCheckbox(
                  text: "备选项1",
                  label: "备选项1",
                  border: true,
                  model: false,
                  size: SkySize.small,
                ),
                SkyCheckbox(
                  text: "备选项2",
                  label: "备选项2",
                  border: true,
                  disabled: true,
                  size: SkySize.small,
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              gutter: 20,
              children: [
                SkyCheckbox(
                  text: "备选项1",
                  label: "备选项1",
                  border: true,
                  model: false,
                  disabled: true,
                  size: SkySize.mini,
                ),
                SkyCheckbox(
                  text: "备选项2",
                  label: "备选项2",
                  border: true,
                  disabled: true,
                  size: SkySize.mini,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
