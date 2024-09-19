part of 'index.dart';

class MessageBoxWidget extends StatefulWidget {
  final String title;
  final Widget child;
  final double width;
  final double maxHeight;
  final String? confirmButtonText;
  final String? cancelButtonText;
  final Function() close;
  final Function() withOnClose;

  final Future<bool> Function(dynamic e)? onCancel;
  final Future<bool> Function(dynamic e)? onConfirm;
  const MessageBoxWidget({
    super.key,
    required this.title,
    required this.child,
    required this.width,
    required this.maxHeight,
    required this.close,
    required this.withOnClose,
    this.confirmButtonText,
    this.cancelButtonText,
    this.onCancel,
    this.onConfirm,
  });
  static _MessageBoxWidgetState? maybeOf(BuildContext context) {
    final _MessageBoxScope? scope = context.dependOnInheritedWidgetOfExactType<_MessageBoxScope>();
    return scope?.messageBoxWidgetState;
  }

  @override
  State<MessageBoxWidget> createState() => _MessageBoxWidgetState();
}

class _MessageBoxWidgetState extends State<MessageBoxWidget> {
  late dynamic _value = null;
  void setValue(dynamic e) {
    _value = e;
  }

  dynamic get value => _value;
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: _MessageBoxScope(
        messageBoxWidgetState: this,
        child: Stack(
          children: [
            Container(
              width: widget.width,
              constraints: BoxConstraints(maxWidth: widget.width, maxHeight: widget.maxHeight, minHeight: 100, minWidth: 100),
              decoration: BoxDecoration(
                color: SkyColors().white,
                borderRadius: SkyBorderRadius().normalBorderRadius,
              ),
              padding: EdgeInsets.only(top: 40.scaleSpacing, bottom: 60.scaleSpacing),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min, // 主轴方向最小
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.scaleSpacing, horizontal: 15.scaleSpacing),
                      child: SingleChildScrollView(
                        child: widget.child,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              width: widget.width,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 15.scaleSpacing,
                  right: 15.scaleSpacing,
                  bottom: 10.scaleSpacing,
                  left: 15.scaleSpacing,
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: SkyFontSizes().titleFont,
                            color: SkyColors().primaryText,
                          ),
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            widget.withOnClose.call();
                          },
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 4.scaleSpacing,
                              ),
                              child: Icon(
                                color: SkyColors().baseBorder,
                                ElementIcons.close,
                                size: SkyIconSizes().largeFont,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (widget.cancelButtonText != null || widget.confirmButtonText != null)
              Positioned(
                bottom: 0,
                left: 0,
                width: widget.width,
                height: 60.scaleSpacing,
                child: Container(
                  padding: EdgeInsets.only(right: 15.scaleSpacing, left: 15.scaleSpacing, top: 10.scaleSpacing),
                  child: IntrinsicHeight(
                    child: SkyRow(
                      alignment: WrapAlignment.end,
                      gutter: 20.scaleSpacing,
                      children: [
                        if (widget.cancelButtonText != null)
                          SkyButton(
                            text: widget.cancelButtonText!,
                            type: SkyType.normal,
                            onTap: () async {
                              if (widget.onCancel != null) {
                                bool result = await widget.onCancel!.call(value);
                                if (result) {
                                  widget.close.call();
                                }
                              } else {
                                widget.close.call();
                              }
                            },
                          ),
                        if (widget.confirmButtonText != null)
                          SkyButton(
                            text: widget.confirmButtonText!,
                            type: SkyType.primary,
                            onTap: () async {
                              if (widget.onConfirm != null) {
                                bool result = await widget.onConfirm!.call(value);
                                if (result) {
                                  widget.close.call();
                                }
                              } else {
                                widget.close.call();
                              }
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _MessageBoxScope extends InheritedWidget {
  const _MessageBoxScope({
    required super.child,
    required this.messageBoxWidgetState,
  });

  final _MessageBoxWidgetState messageBoxWidgetState;

  @override
  bool updateShouldNotify(_MessageBoxScope old) => messageBoxWidgetState != old.messageBoxWidgetState;
}
