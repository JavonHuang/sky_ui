import 'package:example/common/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'common/display_block.dart';
import 'common/title.dart';

class InfiniteScrollDemo extends StatefulWidget {
  const InfiniteScrollDemo({super.key});

  @override
  State<InfiniteScrollDemo> createState() => _InfiniteScrollDemoState();
}

class _InfiniteScrollDemoState extends State<InfiniteScrollDemo> {
  late List<int> listData = [];
  late bool loadFinish = false;
  late bool loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      listData = List.generate(10, (index) => index);
    });
  }

  void loadMore() async {
    if (loading) {
      return;
    }
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(seconds: 2), () {
      listData = [
        ...listData,
        ...List.generate(10, (index) => index + listData.length),
      ];
      if (mounted) {
        setState(() {
          loadFinish = listData.length > 50;
          loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "InfiniteScroll 无限滚动",
          descr: "滚动至底部时，加载更多数据。",
        ),
        const DemoTitle(
          title: "基础用法",
        ),
        DisplayBlock(
          children: [
            SizedBox(
              height: 400,
              child: SkyInfiniteScroll(
                loadFinish: loadFinish,
                loading: loading,
                loadMore: loadMore,
                data: listData,
                itemBuilder: (context, index) {
                  return Container(
                    height: 40,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: const Color(0xFF7dbcfc),
                    child: Text("选项$index"),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
