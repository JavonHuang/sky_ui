import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class PopoverDemo2 extends StatefulWidget {
  const PopoverDemo2({super.key});

  @override
  State<PopoverDemo2> createState() => _PopoverDemo2State();
}

class _PopoverDemo2State extends State<PopoverDemo2> {
  SkyPopoverController controllerTopStart = SkyPopoverController();
  SkyPopoverController controllerTopCenter = SkyPopoverController();
  SkyPopoverController controllerTopEnd = SkyPopoverController();

  SkyPopoverController controllerlLeftStart = SkyPopoverController();
  SkyPopoverController controllerLeftCenter = SkyPopoverController();
  SkyPopoverController controllerLeftEnd = SkyPopoverController();

  SkyPopoverController controllerlBottomStart = SkyPopoverController();
  SkyPopoverController controllerBottomCenter = SkyPopoverController();
  SkyPopoverController controllerBottomEnd = SkyPopoverController();

  SkyPopoverController controllerRightStart = SkyPopoverController();
  SkyPopoverController controllerRightCenter = SkyPopoverController();
  SkyPopoverController controllerRightEnd = SkyPopoverController();

  @override
  Widget build(BuildContext context) {
    Widget context = Container(
      height: 200,
      width: 100,
      child: Text("567890"),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 20,
          children: [
            SkyPopover(
              trigger: SkyPopoverTrigger.manual,
              placement: SkyPlacement.topStart,
              controller: controllerTopStart,
              popoverChild: context,
              child: SkyButton(
                text: "topStart",
                onTap: () {
                  controllerTopStart.open();
                },
              ),
            ),
            SkyPopover(
              trigger: SkyPopoverTrigger.manual,
              placement: SkyPlacement.topCenter,
              controller: controllerTopCenter,
              popoverChild: context,
              child: SkyButton(
                text: "topCenter",
                onTap: () {
                  controllerTopCenter.open();
                },
              ),
            ),
            SkyPopover(
              trigger: SkyPopoverTrigger.manual,
              placement: SkyPlacement.topEnd,
              controller: controllerTopEnd,
              popoverChild: context,
              child: SkyButton(
                text: "topEnd",
                onTap: () {
                  controllerTopEnd.open();
                },
              ),
            ),
          ],
        ),
        DemoSpace.vGap20,
        SkyRow(
          gutter: 20,
          children: [
            SkyPopover(
              trigger: SkyPopoverTrigger.manual,
              placement: SkyPlacement.leftStart,
              controller: controllerlLeftStart,
              popoverChild: context,
              child: SkyButton(
                text: "leftStart",
                onTap: () {
                  controllerlLeftStart.open();
                },
              ),
            ),
            SkyPopover(
              trigger: SkyPopoverTrigger.manual,
              placement: SkyPlacement.leftCenter,
              controller: controllerLeftCenter,
              popoverChild: context,
              child: SkyButton(
                text: "leftCenter",
                onTap: () {
                  controllerLeftCenter.open();
                },
              ),
            ),
            SkyPopover(
              trigger: SkyPopoverTrigger.manual,
              placement: SkyPlacement.leftEnd,
              controller: controllerLeftEnd,
              popoverChild: context,
              child: SkyButton(
                text: "leftEnd",
                onTap: () {
                  controllerLeftEnd.open();
                },
              ),
            ),
          ],
        ),
        DemoSpace.vGap20,
        SkyRow(
          gutter: 20,
          children: [
            SkyPopover(
              trigger: SkyPopoverTrigger.manual,
              placement: SkyPlacement.bottomStart,
              controller: controllerlBottomStart,
              popoverChild: context,
              child: SkyButton(
                text: "bottomStart",
                onTap: () {
                  controllerlBottomStart.open();
                },
              ),
            ),
            SkyPopover(
              trigger: SkyPopoverTrigger.manual,
              placement: SkyPlacement.bottomCenter,
              controller: controllerBottomCenter,
              popoverChild: context,
              child: SkyButton(
                text: "bottomCenter",
                onTap: () {
                  controllerBottomCenter.open();
                },
              ),
            ),
            SkyPopover(
              trigger: SkyPopoverTrigger.manual,
              placement: SkyPlacement.bottomEnd,
              controller: controllerBottomEnd,
              popoverChild: context,
              child: SkyButton(
                text: "bottomEnd",
                onTap: () {
                  controllerBottomEnd.open();
                },
              ),
            ),
          ],
        ),
        DemoSpace.vGap20,
        SkyRow(
          gutter: 20,
          children: [
            SkyPopover(
              trigger: SkyPopoverTrigger.manual,
              placement: SkyPlacement.rightStart,
              controller: controllerRightStart,
              popoverChild: context,
              child: SkyButton(
                text: "rightStart",
                onTap: () {
                  controllerRightStart.open();
                },
              ),
            ),
            SkyPopover(
              trigger: SkyPopoverTrigger.manual,
              placement: SkyPlacement.rightCenter,
              controller: controllerRightCenter,
              popoverChild: context,
              child: SkyButton(
                text: "rightCenter",
                onTap: () {
                  controllerRightCenter.open();
                },
              ),
            ),
            SkyPopover(
              trigger: SkyPopoverTrigger.manual,
              placement: SkyPlacement.rightEnd,
              controller: controllerRightEnd,
              popoverChild: context,
              child: SkyButton(
                text: "rightEnd",
                onTap: () {
                  controllerRightEnd.open();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
