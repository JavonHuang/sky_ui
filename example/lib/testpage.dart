import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with SingleTickerProviderStateMixin {
  final MenuController menuController = MenuController();
  final FocusNode focusNode = FocusNode();

  late AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  );
  late Animation<double> _opacityAnimation;
  late Animation<double> _sizeAnimation;

  bool _isExpanded = false;

  void toggleMenu(bool isExpanded) {
    setState(() {
      _isExpanded = isExpanded;

      if (_isExpanded) {
        _size = 100; // 切换大小
      } else {
        _size = 0; // 切换大小
      }
    });
  }

  void setPopupIsOpen(bool e) {
    if (e) {
    } else {
      focusNode.unfocus();
    }
    toggleMenu(e);
  }

  @override
  void initState() {
    super.initState();
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _sizeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  onTap() {
    if (menuController.isOpen && focusNode.hasFocus) {
      menuController.close();
    } else {
      menuController.open();
    }
  }

  double _size = 0; // 初始大小
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: menuController,
      onOpen: () => setPopupIsOpen(true),
      onClose: () => setPopupIsOpen(false),
      menuChildren: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedSize(
                duration: Duration(milliseconds: 1000), // 动画持续时间
                child: Container(
                  width: _size, // 容器宽度
                  height: _size, // 容器高度
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        )
      ],
      child: SkyBaseInput(
        controller: TextEditingController(),
        focusNode: focusNode,
        disabled: false,
        readOnly: false,
        size: SkySize.small,
        onTap: onTap,
      ),
    );
  }
}
