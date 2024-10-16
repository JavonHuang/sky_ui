import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class TooltipDemo1 extends StatefulWidget {
  const TooltipDemo1({super.key});

  @override
  State<TooltipDemo1> createState() => _TooltipDemo1State();
}

class _TooltipDemo1State extends State<TooltipDemo1> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          children: [
            SkyCol(
              span: 2,
              child: SkyTooltip(
                content: "Top Start 提示文字",
                placement: SkyPlacement.topStart,
                child: SkyButton(
                  text: "上左",
                ),
              ),
            ),
            SkyCol(
              span: 2,
              child: SkyTooltip(
                content: "Top Center 提示文字",
                placement: SkyPlacement.topCenter,
                child: SkyButton(
                  text: "上边",
                ),
              ),
            ),
            SkyCol(
              span: 2,
              child: SkyTooltip(
                content: "Top End 提示文字",
                placement: SkyPlacement.topEnd,
                child: SkyButton(
                  text: "上右",
                ),
              ),
            ),
          ],
        ),
        DemoSpace.vGap20,
        SkyRow(
          children: [
            SkyCol(
              span: 2,
              child: SkyTooltip(
                content: "Left Start 提示文字",
                placement: SkyPlacement.leftStart,
                child: SkyButton(
                  text: "左上",
                ),
              ),
            ),
            SkyCol(span: 2, child: SizedBox()),
            SkyCol(
              span: 2,
              child: SkyTooltip(
                content: "Right Start 提示文字",
                placement: SkyPlacement.rightStart,
                child: SkyButton(
                  text: "右上",
                ),
              ),
            ),
          ],
        ),
        DemoSpace.vGap20,
        SkyRow(
          children: [
            SkyCol(
              span: 2,
              child: SkyTooltip(
                content: "Left Center 提示文字",
                placement: SkyPlacement.leftCenter,
                child: SkyButton(
                  text: "左边",
                ),
              ),
            ),
            SkyCol(span: 2, child: SizedBox()),
            SkyCol(
              span: 2,
              child: SkyTooltip(
                content: "Right Center 提示文字",
                placement: SkyPlacement.rightCenter,
                child: SkyButton(
                  text: "右边",
                ),
              ),
            ),
          ],
        ),
        DemoSpace.vGap20,
        SkyRow(
          children: [
            SkyCol(
              span: 2,
              child: SkyTooltip(
                content: "Left End 提示文字",
                placement: SkyPlacement.leftEnd,
                child: SkyButton(
                  text: "左下",
                ),
              ),
            ),
            SkyCol(span: 2, child: SizedBox()),
            SkyCol(
              span: 2,
              child: SkyTooltip(
                content: "Right End 提示文字",
                placement: SkyPlacement.rightEnd,
                child: SkyButton(
                  text: "右下",
                ),
              ),
            ),
          ],
        ),
        DemoSpace.vGap20,
        SkyRow(
          children: [
            SkyCol(
              span: 2,
              child: SkyTooltip(
                content: "Bottom Start 提示文字",
                placement: SkyPlacement.bottomStart,
                child: SkyButton(
                  text: "下左",
                ),
              ),
            ),
            SkyCol(
              span: 2,
              child: SkyTooltip(
                content: "Bottom Center 提示文字",
                placement: SkyPlacement.bottomCenter,
                child: SkyButton(
                  text: "下边",
                ),
              ),
            ),
            SkyCol(
              span: 2,
              child: SkyTooltip(
                content: "Bottom End 提示文字",
                placement: SkyPlacement.bottomEnd,
                child: SkyButton(
                  text: "下右",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
