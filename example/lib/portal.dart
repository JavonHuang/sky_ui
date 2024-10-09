import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'alert_demo.dart';
import 'badge_demo.dart';
import 'button_demo.dart';
import 'checkbox_demo.dart';
import 'collapse_demo.dart';
import 'date_picker_demo.dart';
import 'descriptions_demo.dart';
import 'dialog_demo.dart';
import 'icon_demo.dart';
import 'infinite_scroll_demo.dart';
import 'input_demo.dart';
import 'input_number_demo.dart';
import 'layout_demo.dart';
import 'link_demo.dart';
import 'loading_demo.dart';
import 'menu_demo.dart';
import 'message_box_demo.dart';
import 'message_demo.dart';
import 'radio_demo.dart';
import 'swicth_demo.dart';
import 'tabs_demo.dart';
import 'tag_demo.dart';
import 'tes.dart';
import 'time_picker_demo.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<NavigatorState> globalNavigatorState = GlobalKey<NavigatorState>();
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: globalNavigatorState,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      // routes: routes,
      home: MyMain(globalNavigatorState: globalNavigatorState),
    );
  }
}

class MyMain extends StatefulWidget {
  MyMain({super.key, globalNavigatorState}) {
    SkyInit().register(globalNavigatorState);
  }

  @override
  State<MyMain> createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> with TickerProviderStateMixin {
  PageController controllerPage = PageController();

  List<SkyMenuNode> get pageNodeList {
    List<SkyMenuNode> result = [];
    for (SkyMenuNode item in menuData) {
      result.addAll(item.children);
    }
    return result;
  }

  List<SkyMenuNode> menuData = [
    SkyMenuNode(
      data: const SkyMenuMeta(
        icon: ElementIcons.addLocation,
        label: 'Basic',
      ),
      index: "0",
      children: [
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Layout 布局',
            ext: {
              "widget": LayoutDemo(),
            },
          ),
          index: "0-0",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Icon 图标',
            ext: {
              "widget": IconDemo(),
            },
          ),
          index: "0-1",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Button 按钮',
            ext: {
              "widget": ButtonDemo(),
            },
          ),
          index: "0-2",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Link 文字链接',
            ext: {
              "widget": LinkDemo(),
            },
          ),
          index: "0-3",
        ),
      ],
    ),
    SkyMenuNode(
      data: const SkyMenuMeta(
        icon: ElementIcons.addLocation,
        label: 'Form',
      ),
      index: "1",
      children: [
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Radio 单选框',
            ext: {
              "widget": RadioDemo(),
            },
          ),
          index: "1-0",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Checkbox 多选框',
            ext: {
              "widget": CheckboxDemo(),
            },
          ),
          index: "1-1",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Input 输入框',
            ext: {
              "widget": InputDemo(),
            },
          ),
          index: "1-2",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'InputNumber 计数器',
            ext: {
              "widget": InputNumberDemo(),
            },
          ),
          index: "1-3",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Switch 开关',
            ext: {
              "widget": SwicthDemo(),
            },
          ),
          index: "1-4",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'TimePicker 时间选择器',
            ext: {
              "widget": TimePickerDemo(),
            },
          ),
          index: "1-5",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'DatePicker 日期选择器',
            ext: {
              "widget": DatePickerDemo(),
            },
          ),
          index: "1-6",
        ),
      ],
    ),
    SkyMenuNode(
      data: const SkyMenuMeta(
        icon: ElementIcons.addLocation,
        label: 'Data',
      ),
      index: "2",
      children: [
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Tag 标签',
            ext: {
              "widget": TagDemo(),
            },
          ),
          index: "2-0",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Badge 标记',
            ext: {
              "widget": BadgeDemo(),
            },
          ),
          index: "2-1",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Descriptions 描述列表',
            ext: {
              "widget": DescriptionsDemo(),
            },
          ),
          index: "2-2",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Descriptions 描述列表',
            ext: {
              "widget": DescriptionsDemo(),
            },
          ),
          index: "2-3",
        ),
      ],
    ),
    SkyMenuNode(
      data: const SkyMenuMeta(
        icon: ElementIcons.addLocation,
        label: 'Notice',
      ),
      index: "3",
      children: [
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Alert 警告',
            ext: {
              "widget": AlertDemo(),
            },
          ),
          index: "3-0",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Loading 加载',
            ext: {
              "widget": LoadingDemo(),
            },
          ),
          index: "3-1",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Message 消息提示',
            ext: {
              "widget": MessageDemo(),
            },
          ),
          index: "3-2",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'MessageBox 弹框',
            ext: {
              "widget": MessageBoxDemo(),
            },
          ),
          index: "3-3",
        )
      ],
    ),
    SkyMenuNode(
      data: const SkyMenuMeta(
        icon: ElementIcons.addLocation,
        label: 'Navigation',
      ),
      index: "4",
      children: [
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Tabs 标签页',
            ext: {
              "widget": TabsDemo(),
            },
          ),
          index: "4-0",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'NavMenu 导航菜单',
            ext: {
              "widget": MenuDemo(),
            },
          ),
          index: "4-1",
        ),
      ],
    ),
    SkyMenuNode(
      data: const SkyMenuMeta(
        icon: ElementIcons.addLocation,
        label: 'Others',
      ),
      index: "5",
      children: [
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Dialog 对话框',
            ext: {
              "widget": DialogDemo(),
            },
          ),
          index: "5-0",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Collapse 折叠面板',
            ext: {
              "widget": CollapseDemo(),
            },
          ),
          index: "5-1",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'InfiniteScroll 无限滚动',
            ext: {
              "widget": InfiniteScrollDemo(),
            },
          ),
          index: "5-2",
        ),
        SkyMenuNode(
          data: const SkyMenuMeta(
            label: 'Test 测试页面',
            ext: {
              "widget": TestDemo(),
            },
          ),
          index: "5-3",
        ),
      ],
    )
  ];

  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late Widget? showWiget = null;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    slideAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    ));
    jampPage(0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void jampPage(int i) {
    setState(() {
      showWiget = pageNodeList[i].data.ext!['widget'];
      controller.reset();
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: SkyColors().white,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: SkyColors().baseBorder,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 260,
                    decoration: BoxDecoration(
                      color: SkyColors().white,
                      border: Border(
                        right: BorderSide(
                          width: 1,
                          color: SkyColors().baseBorder,
                        ),
                      ),
                    ),
                    child: SkyMenu(
                      children: menuData,
                      onchanged: (index) {
                        int i = pageNodeList.indexWhere((e) => e.index == index);

                        if (i > -1) {
                          jampPage(i);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: SlideTransition(
                        position: slideAnimation,
                        child: SingleChildScrollView(
                          child: showWiget,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
