import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class DescriptionsDemo4 extends StatefulWidget {
  const DescriptionsDemo4({super.key});

  @override
  State<DescriptionsDemo4> createState() => _DescriptionsDemo4State();
}

class _DescriptionsDemo4State extends State<DescriptionsDemo4> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
