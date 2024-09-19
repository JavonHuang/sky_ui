import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'common/display_block.dart';
import 'common/space.dart';
import 'common/title.dart';

class RadioDemo extends StatefulWidget {
  const RadioDemo({super.key});

  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  late String example1 = "1";
  late String example2 = "1";
  late String example3 = "1";
  late String example4 = "1";
  late String example5 = "1";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "Radio 单选框",
          descr: "一组备选项中进行单选",
        ),
        const DemoTitle(
          title: "基础用法",
          descr: "由于选项默认可见，不宜过多，若选项过多，建议使用 Select 选择器。",
        ),
        DisplayBlock(
          description: "要使用 Radio 组件，只需要设置model绑定变量，选中意味着变量的值为相应 Radio label属性的值，label仅限String",
          children: [
            SkyRow(
              children: [
                SkyRadio(
                  text: "备选项",
                  label: "1",
                  model: example1,
                  onChanged: (e) {
                    setState(() {
                      example1 = e;
                    });
                  },
                ),
                SkyRadio(
                  text: "备选项",
                  label: "2",
                  model: example1,
                  onChanged: (e) {
                    setState(() {
                      example1 = e;
                    });
                  },
                ),
              ],
            )
          ],
        ),
        const DemoTitle(
          title: "禁用状态",
          descr: "单选框不可用的状态。",
        ),
        const DisplayBlock(
          children: [
            SkyRow(
              children: [
                SkyRadio(
                  text: "备选项",
                  label: "1",
                  disabled: true,
                ),
                SkyRadio(
                  text: "备选项",
                  label: "2",
                  model: "2",
                  disabled: true,
                ),
              ],
            )
          ],
        ),
        const DemoTitle(
          title: "单选框组",
          descr: "适用于在多个互斥的选项中选择的场景",
        ),
        DisplayBlock(
          children: [
            SkyRow(
              children: [
                SkyGroupRadio(
                  model: "1",
                  options: [
                    SkyRadioOption(
                      text: "备选项",
                      label: "1",
                    ),
                    SkyRadioOption(
                      text: "备选项",
                      label: "2",
                    ),
                    SkyRadioOption(
                      text: "备选项",
                      label: "3",
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        const DemoTitle(
          title: "按钮样式",
          descr: "按钮样式的单选组合。",
        ),
        DisplayBlock(
          description: "设置border属性可以渲染为带有边框的单选框。",
          children: [
            SkyRow(
              gutter: 20,
              children: [
                SkyGroupRadio(
                  model: "1",
                  buttonStyle: true,
                  size: SkySize.large,
                  options: [
                    SkyRadioOption(
                      text: "上海",
                      label: "1",
                    ),
                    SkyRadioOption(
                      text: "北京",
                      label: "2",
                    ),
                    SkyRadioOption(
                      text: "广州",
                      label: "3",
                    ),
                    SkyRadioOption(
                      text: "深圳",
                      label: "4",
                    ),
                  ],
                ),
                DemoSpace.vGap20,
                SkyGroupRadio(
                  model: "1",
                  buttonStyle: true,
                  options: [
                    SkyRadioOption(
                      text: "上海",
                      label: "1",
                    ),
                    SkyRadioOption(
                      text: "北京",
                      label: "2",
                    ),
                    SkyRadioOption(
                      text: "广州",
                      label: "3",
                    ),
                    SkyRadioOption(
                      text: "深圳",
                      label: "4",
                    ),
                  ],
                ),
                DemoSpace.vGap20,
                SkyGroupRadio(
                  model: "1",
                  buttonStyle: true,
                  size: SkySize.small,
                  options: [
                    SkyRadioOption(
                      text: "上海",
                      label: "1",
                    ),
                    SkyRadioOption(
                      text: "北京",
                      label: "2",
                      disabled: true,
                    ),
                    SkyRadioOption(
                      text: "广州",
                      label: "3",
                    ),
                    SkyRadioOption(
                      text: "深圳",
                      label: "4",
                    ),
                  ],
                ),
                DemoSpace.vGap20,
                SkyGroupRadio(
                  buttonStyle: true,
                  size: SkySize.mini,
                  disabled: true,
                  options: [
                    SkyRadioOption(
                      text: "上海",
                      label: "1",
                    ),
                    SkyRadioOption(
                      text: "北京",
                      label: "2",
                    ),
                    SkyRadioOption(
                      text: "广州",
                      label: "3",
                    ),
                    SkyRadioOption(
                      text: "深圳",
                      label: "4",
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
        DisplayBlock(
          description: "设置border属性可以渲染为带有边框的单选框。",
          children: [
            SkyRow(
              gutter: 20,
              children: [
                SkyRadio(
                  text: "备选项1",
                  label: "1",
                  model: example2,
                  border: true,
                  size: SkySize.large,
                  onChanged: (e) {
                    setState(() {
                      example2 = e;
                    });
                  },
                ),
                SkyRadio(
                  text: "备选项2",
                  label: "2",
                  model: example1,
                  border: true,
                  size: SkySize.large,
                  onChanged: (e) {
                    setState(() {
                      example2 = e;
                    });
                  },
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              gutter: 20,
              children: [
                SkyRadio(
                  text: "备选项1",
                  label: "1",
                  model: example3,
                  border: true,
                  size: SkySize.medium,
                  onChanged: (e) {
                    setState(() {
                      example3 = e;
                    });
                  },
                ),
                SkyRadio(
                  text: "备选项2",
                  label: "2",
                  model: example3,
                  border: true,
                  size: SkySize.medium,
                  onChanged: (e) {
                    setState(() {
                      example3 = e;
                    });
                  },
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              gutter: 20,
              children: [
                SkyRadio(
                  text: "备选项1",
                  label: "1",
                  model: example4,
                  border: true,
                  size: SkySize.small,
                  onChanged: (e) {
                    setState(() {
                      example4 = e;
                    });
                  },
                ),
                SkyRadio(
                  text: "备选项2",
                  label: "2",
                  model: example4,
                  border: true,
                  size: SkySize.small,
                  onChanged: (e) {
                    setState(() {
                      example4 = e;
                    });
                  },
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              gutter: 20,
              children: [
                SkyRadio(
                  text: "备选项1",
                  label: "1",
                  model: example5,
                  border: true,
                  size: SkySize.mini,
                  onChanged: (e) {
                    setState(() {
                      example5 = e;
                    });
                  },
                ),
                SkyRadio(
                  text: "备选项2",
                  label: "2",
                  model: example5,
                  border: true,
                  size: SkySize.mini,
                  onChanged: (e) {
                    setState(() {
                      example5 = e;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
