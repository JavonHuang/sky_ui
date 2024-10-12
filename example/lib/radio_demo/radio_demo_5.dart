import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class RadioDemo5 extends StatefulWidget {
  const RadioDemo5({super.key});

  @override
  State<RadioDemo5> createState() => _RadioDemo5State();
}

class _RadioDemo5State extends State<RadioDemo5> {
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
    );
  }
}
