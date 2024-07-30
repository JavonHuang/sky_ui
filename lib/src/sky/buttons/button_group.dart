part of 'buttons.dart';

class ButtonGroup extends StatefulWidget {
  const ButtonGroup({
    super.key,
    required this.children,
    this.onTap,
    this.type = SkyType.normal,
    this.size = SkySize.small,
  });
  final List<SkyButton> children;
  final Function(String groupId)? onTap;
  final SkyType type;
  final SkySize size;

  static ButtonGroupState? maybeOf(BuildContext context) {
    final _ButtonGroupScope? scope = context.dependOnInheritedWidgetOfExactType<_ButtonGroupScope>();
    return scope?._buttonGroupState;
  }

  @override
  State<ButtonGroup> createState() => ButtonGroupState();
}

class ButtonGroupState extends State<ButtonGroup> {
  SkyType get type => widget.type;
  SkySize get size => widget.size;

  late final SkyButton? _chosenButton = null;

  void callBack(b) {
    for (SkyButton item in widget.children) {
      if (b == item) {
        widget.onTap?.call(item.buttonKey ?? '');
      }
    }
  }

  BorderRadiusGeometry? borderRadius(b) {
    int index = 0;
    for (int i = 0; i < widget.children.length; i++) {
      SkyButton item = widget.children[i];
      if (b == item) {
        index = i;
      }
    }
    if (index == 0) {
      return BorderRadius.only(
        topLeft: SkyBorderRadius().noneCircular,
        bottomLeft: SkyBorderRadius().noneCircular,
      );
    } else if (index == widget.children.length - 1) {
      return BorderRadius.only(
        topRight: SkyBorderRadius().noneCircular,
        bottomRight: SkyBorderRadius().noneCircular,
      );
    } else {
      return SkyBorderRadius().normalBorderRadius;
    }
  }

  List<Widget> renderBtn() {
    return widget.children
        .map(
          (e) => Container(
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 1,
                  color: Colors.white,
                ),
              ),
            ),
            child: e,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return _ButtonGroupScope(
      chosenButton: _chosenButton,
      buttonGroupState: this,
      child: UnconstrainedBox(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 1.scaleSpacing),
          decoration: BoxDecoration(
            color: type.getBackgroundColor(context: context),
            borderRadius: BorderRadius.circular(5.scaleSpacing),
          ),
          child: Row(
            children: renderBtn(),
          ),
        ),
      ),
    );
  }
}

class _ButtonGroupScope extends InheritedWidget {
  const _ButtonGroupScope({
    required super.child,
    required ButtonGroupState buttonGroupState,
    SkyButton? chosenButton,
  })  : _buttonGroupState = buttonGroupState,
        _chosenButton = chosenButton;

  final ButtonGroupState _buttonGroupState;
  final SkyButton? _chosenButton;
  ButtonGroup get buttonGroup => _buttonGroupState.widget;

  @override
  bool updateShouldNotify(_ButtonGroupScope old) => _chosenButton != old._chosenButton;
}
