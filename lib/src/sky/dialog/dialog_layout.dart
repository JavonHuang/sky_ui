part of 'index.dart';

class DialogLayout extends StatefulWidget {
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
  final bool fullscreen;
  final Widget? foot;
  const DialogLayout({
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
    required this.fullscreen,
    this.foot,
  });

  static _DialogLayoutState? maybeOf(BuildContext context) {
    final _DialogLayoutScope? scope = context.dependOnInheritedWidgetOfExactType<_DialogLayoutScope>();
    return scope?.dialogLayoutState;
  }

  @override
  State<DialogLayout> createState() => _DialogLayoutState();
}

class _DialogLayoutState extends State<DialogLayout> {
  // ignore: avoid_init_to_null
  late dynamic _value = null;
  void setValue(dynamic e) {
    _value = e;
  }

  dynamic get value => _value;

  void close() {
    widget.close.call();
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: _DialogLayoutScope(
        dialogLayoutState: this,
        child: Stack(
          children: [
            Container(
              width: widget.fullscreen ? MediaQuery.of(context).size.width : widget.width,
              height: widget.fullscreen ? MediaQuery.of(context).size.height : null,
              constraints: BoxConstraints(
                maxWidth: widget.fullscreen ? MediaQuery.of(context).size.width : widget.width,
                maxHeight: widget.fullscreen ? MediaQuery.of(context).size.height : widget.maxHeight + 120,
                minHeight: 100,
                minWidth: 100,
              ),
              decoration: BoxDecoration(
                color: SkyColors().white,
                borderRadius: widget.fullscreen ? null : SkyBorderRadius().normalBorderRadius,
              ),
              padding: const EdgeInsets.only(top: 40, bottom: 60),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min, // 主轴方向最小
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
              width: widget.fullscreen ? MediaQuery.of(context).size.width : widget.width,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  right: 15,
                  bottom: 10,
                  left: 15,
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
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
            if ((widget.cancelButtonText != null || widget.confirmButtonText != null) && widget.foot == null)
              Positioned(
                bottom: 0,
                left: 0,
                width: widget.fullscreen ? MediaQuery.of(context).size.width : widget.width,
                height: 60,
                child: Container(
                  padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
                  child: IntrinsicHeight(
                    child: SkyRow(
                      alignment: WrapAlignment.end,
                      gutter: 20,
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
            if (widget.foot != null)
              Positioned(
                bottom: 0,
                left: 0,
                width: widget.fullscreen ? MediaQuery.of(context).size.width : widget.width,
                height: 60,
                child: Container(
                  padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
                  child: IntrinsicHeight(
                    child: widget.foot!,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _DialogLayoutScope extends InheritedWidget {
  const _DialogLayoutScope({
    required super.child,
    required this.dialogLayoutState,
  });

  final _DialogLayoutState dialogLayoutState;

  @override
  bool updateShouldNotify(_DialogLayoutScope old) => dialogLayoutState != old.dialogLayoutState;
}
