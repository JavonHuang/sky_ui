import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'common/display_block.dart';
import 'common/space.dart';
import 'common/title.dart';

class LayoutDemo extends StatefulWidget {
  const LayoutDemo({super.key});

  @override
  State<LayoutDemo> createState() => _LayoutDemoState();
}

class _LayoutDemoState extends State<LayoutDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "Layout 布局",
          descr: "通过基础的 24 分栏，迅速简便地创建布局。",
        ),
        const DemoTitle(
          title: "基础布局",
          descr: "使用单一分栏创建基础的栅格布局。",
        ),
        DisplayBlock(
          children: [
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 12,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 12,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFe5e9f2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 8,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 8,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFe5e9f2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 8,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFe5e9f2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFe5e9f2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 4,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 4,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFe5e9f2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 4,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 4,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFe5e9f2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 4,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 4,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFe5e9f2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        const DemoTitle(
          title: "分栏间隔",
          descr: "分栏之间存在间隔。",
        ),
        DisplayBlock(
          description: "SkyRow 组件 提供 gutter 属性来指定每一栏之间的间隔，默认间隔为 0。",
          children: [
            SkyRow(
              gutter: 20,
              children: [
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        const DemoTitle(
          title: "混合布局",
          descr: "通过基础的 1/24 分栏任意扩展组合形成较为复杂的混合布局。",
        ),
        DisplayBlock(
          children: [
            SkyRow(
              gutter: 20,
              children: [
                SkyCol(
                  span: 16,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 8,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              gutter: 20,
              children: [
                SkyCol(
                  span: 8,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 8,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 4,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 4,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              gutter: 20,
              children: [
                SkyCol(
                  span: 4,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 16,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 4,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        const DemoTitle(
          title: "分栏偏移",
          descr: "支持偏移指定的栏数。",
        ),
        DisplayBlock(
          children: [
            SkyRow(
              gutter: 20,
              children: [
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  offset: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              gutter: 20,
              children: [
                SkyCol(
                  span: 6,
                  offset: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  offset: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              gutter: 20,
              children: [
                SkyCol(
                  span: 12,
                  offset: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        const DemoTitle(
          title: "对齐方式",
          descr: "通过 Wrap 布局来对分栏进行灵活的对齐。",
        ),
        DisplayBlock(
          description: "通过 Wrap 布局,及 alignment 属性来指定 start, center, end, space-between, space-around 其中的值来定义子元素的排版方式。",
          children: [
            SkyRow(
              alignment: WrapAlignment.start,
              children: [
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFe5e9f2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              alignment: WrapAlignment.center,
              children: [
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFe5e9f2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              alignment: WrapAlignment.end,
              children: [
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFe5e9f2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              alignment: WrapAlignment.spaceBetween,
              children: [
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFe5e9f2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              alignment: WrapAlignment.spaceAround,
              children: [
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFe5e9f2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  height: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd3dce6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
