import 'package:example/common/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:sky_ui/sky_ui.dart';

import '../read_file.dart';

class DisplayBlock extends StatefulWidget {
  final List<Widget>? children;
  final Widget? child;
  final String path;

  final String? description;
  const DisplayBlock({
    super.key,
    this.children = const [],
    this.description,
    this.child,
    required this.path,
  });

  @override
  State<DisplayBlock> createState() => _DisplayBlockState();
}

class _DisplayBlockState extends State<DisplayBlock> {
  late String code = "";
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    ReadFile.read("lib/code/${widget.path}.txt").then((e) {
      setState(() {
        code = e;
      });
    });
  }

  String camelToSnakeCase(String camelCaseStr) {
    String result = camelCaseStr.replaceAllMapped(RegExp(r'([A-Z][a-z0-9]*)'), (match) {
      if (match.start == 0) {
        // 对于字符串的第一个大写字母，我们不需要前导下划线
        return match.group(0)?.toLowerCase() ?? '';
      } else {
        // 对于其他大写字母，我们在前面添加下划线
        return '_${match.group(0)?.toLowerCase() ?? ''}';
      }
    }).toLowerCase();

    result = result.replaceRange(result.length - 1, result.length - 1, "_");
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SkyColors().defaultBg,
        border: Border.all(
          width: 1,
          color: SkyColors().baseBorder,
        ),
        borderRadius: SkyBorderRadius().normalBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: SkyColors().white,
              border: widget.description != null
                  ? Border(
                      bottom: BorderSide(
                        width: 1,
                        color: SkyColors().baseBorder,
                      ),
                    )
                  : null,
              borderRadius: SkyBorderRadius().normalBorderRadius,
            ),
            child: widget.child ??
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.children ?? [],
                ),
          ),
          if (widget.description != null)
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: SkyColors().white,
                border: Border.all(
                  width: 1,
                  color: SkyColors().baseBorder,
                ),
                borderRadius: SkyBorderRadius().normalBorderRadius,
              ),
              child: Text(
                widget.description!,
                style: const TextStyle(color: Color(0xFF5e6d82)),
              ),
            ),
          SkyCollapse(
              contentPadding: EdgeInsets.zero,
              titleBuilder: (context, anima, ctrl, icon) {
                return Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: SkyColors().white,
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: SkyColors().baseBorder,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Icon(
                          ElementIcons.copyDocument,
                          size: SkyIconSizes().mediumFont,
                        ),
                        onTap: () async {
                          await Clipboard.setData(ClipboardData(text: code));
                          SkyMessage(message: "代码复制成功", type: SkyAlertType.success, showIcon: true).open();
                        },
                      ),
                      DemoSpace.hGap20,
                      Icon(
                        ElementIcons.arrowLeft,
                        size: SkyIconSizes().mediumFont,
                      ),
                      Icon(
                        ElementIcons.arrowRight,
                        size: SkyIconSizes().mediumFont,
                      ),
                      DemoSpace.hGap20,
                    ],
                  ),
                );
              },
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: SkyColors().white,
                    padding: const EdgeInsets.all(12),
                    child: HighlightView(
                      code,
                      language: "dart",
                      theme: themeMap['github']!,
                      padding: const EdgeInsets.all(12),
                      // textStyle: TextStyle(fontFamily: 'SFMono-Regular,Consolas,Liberation Mono,Menlo,monospace'),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
