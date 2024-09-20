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
              title: "用户名",
              border: true,
              children: [
                DescriptionsItem(
                  labelWidget: Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Icon(
                          ElementIcons.user,
                          size: SkyIconSizes().mediumFont,
                        ),
                      ),
                      const Text("用户名"),
                    ],
                  ),
                  value: "kooriookami",
                ),
                DescriptionsItem(
                  labelWidget: Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Icon(
                          ElementIcons.mobilePhone,
                          size: SkyIconSizes().mediumFont,
                        ),
                      ),
                      const Text("电话"),
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
      ],
    );
  }
}
