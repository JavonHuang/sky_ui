import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'common/display_block.dart';
import 'common/title.dart';

class MenuDemo extends StatefulWidget {
  const MenuDemo({super.key});

  @override
  State<MenuDemo> createState() => _MenuDemoState();
}

class _MenuDemoState extends State<MenuDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "Link 文字链接",
          descr: "文字链接",
        ),
        const DemoTitle(
          title: "基础用法",
          descr: "基础的文字链接用法。",
        ),
        DisplayBlock(
          description: "Alert 组件提供四种主题，由type属性指定，默认值为info。",
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
        ),
      ],
    );
  }
}
