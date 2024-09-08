import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'common/display_block.dart';
import 'common/space.dart';
import 'common/title.dart';

class SwicthDemo extends StatefulWidget {
  const SwicthDemo({super.key});

  @override
  State<SwicthDemo> createState() => _SwicthDemoState();
}

class _SwicthDemoState extends State<SwicthDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Switch 开关",
          descr: "表示两种相互对立的状态间的切换，多用于触发「开/关」。",
        ),
        DemoTitle(
          title: "基本用法",
          descr: "",
        ),
        DisplayBlock(
          description: "绑定model到一个Boolean类型的变量。可以使用active-color属性与inactive-color属性来设置开关的背景色。",
          children: [
            SkyRow(
              children: [
                SkyCol(
                  span: 6,
                  child: SkySwitch(
                    model: true,
                    activeColor: Color(0xff13ce66),
                    inactiveColor: Color(0xffff4949),
                  ),
                )
              ],
            ),
          ],
        ),
        DemoTitle(
          title: "文字描述",
          descr: "",
        ),
        DisplayBlock(
          description: "使用active-text属性与inactive-text属性来设置开关的文字描述。",
          children: [
            SkyRow(
              children: [
                SkyCol(
                  span: 8,
                  child: SkySwitch(
                    model: true,
                    activeText: "按月付费",
                    inactiveText: "按年付费",
                  ),
                )
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 8,
                  child: SkySwitch(
                    model: true,
                    activeColor: Color(0xff13ce66),
                    inactiveColor: Color(0xffff4949),
                    activeText: "按月付费",
                    inactiveText: "按年付费",
                  ),
                )
              ],
            ),
          ],
        ),
        DemoTitle(
          title: "扩展的 value 类型",
          descr: "",
        ),
        DisplayBlock(
          description: "设置active-value和inactive-value属性，接受Boolean, String或Number类型的值。",
          children: [
            SkyRow(
              children: [
                SkyCol(
                  span: 6,
                  child: SkySwitch(
                    model: "0",
                    activeColor: Color(0xff13ce66),
                    inactiveColor: Color(0xffff4949),
                    activeValue: "100",
                    inactiveValue: "0",
                  ),
                )
              ],
            ),
          ],
        ),
        DemoTitle(
          title: "禁用状态",
          descr: "",
        ),
        DisplayBlock(
          children: [
            SkyRow(
              children: [
                SkyCol(
                  span: 4,
                  child: SkySwitch(
                    model: true,
                    disabled: true,
                  ),
                ),
                SkyCol(
                  span: 4,
                  child: SkySwitch(
                    model: false,
                    disabled: true,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
