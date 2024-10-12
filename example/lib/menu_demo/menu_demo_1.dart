import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class MenuDemo1 extends StatefulWidget {
  const MenuDemo1({super.key});

  @override
  State<MenuDemo1> createState() => _MenuDemo1State();
}

class _MenuDemo1State extends State<MenuDemo1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UnconstrainedBox(
          // height: 500,
          // width: 200,
          child: Container(
            width: 200,
            // color: Colors.red,
            height: 200,
            child: SkyMenu(
              children: [
                SkyMenuNode(
                  data: const SkyMenuMeta(
                    icon: ElementIcons.addLocation,
                    label: '测试0-0',
                  ),
                  index: "0-0",
                  children: [
                    SkyMenuNode(
                      data: const SkyMenuMeta(
                        icon: ElementIcons.addLocation,
                        label: '测试0-1',
                      ),
                      index: "0-1",
                      children: [
                        SkyMenuNode(
                          data: const SkyMenuMeta(
                            icon: ElementIcons.addLocation,
                            label: '测试0-1-1',
                          ),
                          index: "0-1-1",
                        ),
                      ],
                    ),
                    SkyMenuNode(
                      data: const SkyMenuMeta(
                        icon: ElementIcons.addLocation,
                        label: '测试0-2',
                      ),
                      index: "0-2",
                    ),
                  ],
                ),
                SkyMenuNode(
                  data: const SkyMenuMeta(
                    icon: ElementIcons.addLocation,
                    label: '测试1-0',
                  ),
                  index: "1-0",
                  children: [
                    SkyMenuNode(
                      data: const SkyMenuMeta(
                        icon: ElementIcons.addLocation,
                        label: '测试1-1',
                      ),
                      index: "1-1",
                    ),
                    SkyMenuNode(
                      data: const SkyMenuMeta(
                        icon: ElementIcons.addLocation,
                        label: '测试1-2',
                      ),
                      index: "1-2",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
