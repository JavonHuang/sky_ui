import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class SelectTest extends StatefulWidget {
  const SelectTest({super.key});

  @override
  State<SelectTest> createState() => _SelectTestState();
}

class _SelectTestState extends State<SelectTest> {
  late List<SkySelectOption<String>> options = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      options = List.generate(100, (i) => SkySelectOption(label: "选项$i", value: "1$i")).toList();
    });
  }

  final List<String> data = ['语文', '数学', '英语', '物理', '化学', '生物', '地理'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkySelect(
          clearable: true,
          filterable: true,
          options: [
            SkySelectOption(label: "选项1", value: "1"),
            SkySelectOption(label: "选项2", value: "2"),
            SkySelectOption(label: "选项3", value: "3", disabled: true),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // SizedBox(height: 600),
        SkySelect(
          clearable: true,
          filterable: true,
          multiple: true,
          collapseTags: true,
          options: options,
        ),
        DropdownMenu(
          requestFocusOnTap: true,
          label: const Text('Color'),
          menuHeight: 150,
          menuStyle: const MenuStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
            surfaceTintColor: MaterialStatePropertyAll<Color>(Colors.white),
            padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 20)),
          ),
          dropdownMenuEntries: options.map((value) {
            return DropdownMenuEntry<String>(value: value.value, label: value.label);
          }).toList(),
        ),
        PopupMenuButton(
          child: Text("8989"),
          tooltip: "",
          itemBuilder: (context) {
            // return <PopupMenuItem<String>>[
            return [
              ///建议指定value属性
              PopupMenuItem<String>(
                value: 'one',
                onTap: () => debugPrint('tap one'),
                child: SizedBox(
                  // height: 600,
                  child: const Text('1'),
                ),
              ),
              PopupMenuItem<String>(
                value: 'two',
                onTap: () => debugPrint('tap two'),
                child: const Text('2'),
              ),
              PopupMenuItem<String>(
                value: 'three',
                onTap: () => debugPrint('tap three'),
                child: const Text('3'),
              ),

              ///另外一种菜单项目，它可以被选择，通过checked控制，默认值为false,设置为true时显示对号；
              const CheckedPopupMenuItem<String>(
                value: 'four',
                checked: true,
                child: Text('4'),
              ),
            ];
          },
        )
      ],
    );
  }
}
