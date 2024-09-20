import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'common/display_block.dart';
import 'common/space.dart';
import 'common/title.dart';

class DescriptionsDemo extends StatefulWidget {
  const DescriptionsDemo({super.key});

  @override
  State<DescriptionsDemo> createState() => _DescriptionsDemoState();
}

class _DescriptionsDemoState extends State<DescriptionsDemo> {
  late SkySize mysize = SkySize.medium;
  late String model = "2";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "Descriptions 描述列表",
          descr: "列表形式展示多个字段。",
        ),
        const DemoTitle(
          title: "基本用法",
          descr: "",
        ),
        DisplayBlock(
          children: [
            SkyDescriptions(
              title: "用户信息",
              children: [
                DescriptionsItem(
                  label: "用户名：",
                  value: "kooriookami",
                ),
                DescriptionsItem(label: "手机号：", value: "18100000000"),
                DescriptionsItem(label: "居住地：", value: "苏州市"),
                DescriptionsItem(
                  label: "备注：",
                  valueWidget: Container(
                    alignment: Alignment.centerLeft,
                    child: const UnconstrainedBox(
                      child: SkyTag(
                        text: "学校",
                        type: SkyType.primary,
                        plain: true,
                        size: SkySize.mini,
                      ),
                    ),
                  ),
                ),
                DescriptionsItem(label: "联系地址：", value: "江苏省苏州市吴中区吴中大道 1188 号"),
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "不同尺寸",
        ),
        DisplayBlock(
          children: [
            SkyGroupRadio(
              model: model,
              options: [
                SkyRadioOption(
                  text: "大型",
                  label: "1",
                ),
                SkyRadioOption(
                  text: "中等",
                  label: "2",
                ),
                SkyRadioOption(
                  text: "小型",
                  label: "3",
                ),
                SkyRadioOption(
                  text: "超小",
                  label: "4",
                ),
              ],
              onChanged: (e) {
                model = e;
                switch (e) {
                  case '1':
                    mysize = SkySize.large;
                    break;
                  case '2':
                    mysize = SkySize.medium;
                    break;
                  case '3':
                    mysize = SkySize.small;
                    break;
                  case '4':
                    mysize = SkySize.mini;
                    break;
                }
                setState(() {});
              },
            ),
            Text(
              '带边框列表',
              style: TextStyle(
                fontSize: SkyFontSizes().titleSmallFont,
                color: SkyColors().primaryText,
                fontWeight: FontWeight.bold,
              ),
            ),
            DemoSpace.vGap20,
            SkyDescriptions(
              border: true,
              size: mysize,
              children: [
                DescriptionsItem(
                  labelWidget: Row(
                    children: [
                      SizedBox(
                        // height: 24,
                        // width: 24,
                        child: Icon(
                          ElementIcons.user,
                          size: SkyIconSizes().mediumFont,
                          color: SkyColors().secondaryText,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "用户名",
                        style: TextStyle(
                          color: SkyColors().secondaryText,
                        ),
                      ),
                    ],
                  ),
                  value: "kooriookami",
                ),
                DescriptionsItem(
                  width: 200,
                  labelWidget: Row(
                    children: [
                      SizedBox(
                        // height: 24,
                        // width: 24,
                        child: Icon(
                          ElementIcons.mobilePhone,
                          size: SkyIconSizes().mediumFont,
                          color: SkyColors().secondaryText,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "电话",
                        style: TextStyle(
                          color: SkyColors().secondaryText,
                        ),
                      ),
                    ],
                  ),
                  value: "内容",
                ),
                DescriptionsItem(label: "测试测试测试容", value: "内容", span: 2),
                DescriptionsItem(label: "测试3", value: "内容"),
                DescriptionsItem(label: "测试4", value: "内容"),
                DescriptionsItem(label: "测测试5测试5测试5试5", value: "内容"),
                DescriptionsItem(label: "测试6", value: "内容"),
                DescriptionsItem(label: "测试7", value: "内容"),
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "垂直列表",
        ),
        DisplayBlock(
          children: [
            const Text("垂直无边框列表"),
            DemoSpace.vGap20,
            SkyDescriptions(
              title: "用户信息",
              axis: Axis.vertical,
              border: true,
              children: [
                DescriptionsItem(
                  label: "用户名：",
                  value: "kooriookami",
                ),
                DescriptionsItem(label: "手机号：", value: "18100000000"),
                DescriptionsItem(label: "居住地：", value: "苏州市"),
                DescriptionsItem(
                  label: "备注：",
                  valueWidget: Container(
                    alignment: Alignment.centerLeft,
                    child: const UnconstrainedBox(
                      child: SkyTag(
                        text: "学校",
                        type: SkyType.primary,
                        plain: true,
                        size: SkySize.mini,
                      ),
                    ),
                  ),
                ),
                DescriptionsItem(label: "联系地址：", value: "江苏省苏州市吴中区吴中大道 1188 号"),
              ],
            ),
            DemoSpace.vGap20,
            const Text("垂直无边框列表"),
            DemoSpace.vGap20,
            SkyDescriptions(
              title: "用户信息",
              axis: Axis.vertical,
              children: [
                DescriptionsItem(
                  label: "用户名：",
                  value: "kooriookami",
                ),
                DescriptionsItem(label: "手机号：", value: "18100000000"),
                DescriptionsItem(label: "居住地：", value: "苏州市"),
                DescriptionsItem(
                  label: "备注：",
                  valueWidget: Container(
                    alignment: Alignment.centerLeft,
                    child: const UnconstrainedBox(
                      child: SkyTag(
                        text: "学校",
                        type: SkyType.primary,
                        plain: true,
                        size: SkySize.mini,
                      ),
                    ),
                  ),
                ),
                DescriptionsItem(label: "联系地址：", value: "江苏省苏州市吴中区吴中大道 1188 号"),
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "自定义样式",
          descr: "",
        ),
        DisplayBlock(
          children: [
            SkyDescriptions(
              title: "自定义样式列表",
              border: true,
              children: [
                DescriptionsItem(
                  bgLabelColor: const Color(0xFFe1f3d8),
                  bgValueColor: const Color(0xFFfde2e2),
                  labelWidget: Text(
                    "用户名",
                    style: TextStyle(
                      color: SkyColors().secondaryText,
                    ),
                  ),
                  valueWidget: Text(
                    "kooriookami",
                    style: TextStyle(
                      color: SkyColors().secondaryText,
                    ),
                  ),
                ),
                DescriptionsItem(label: "手机号", value: "18100000000"),
                DescriptionsItem(label: "居住地", value: "苏州市"),
                DescriptionsItem(
                  label: "备注",
                  valueWidget: Container(
                    alignment: Alignment.centerLeft,
                    child: const UnconstrainedBox(
                      child: SkyTag(
                        text: "学校",
                        type: SkyType.primary,
                        plain: true,
                        size: SkySize.mini,
                      ),
                    ),
                  ),
                ),
                DescriptionsItem(label: "联系地址：", value: "江苏省苏州市吴中区吴中大道 1188 号"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
