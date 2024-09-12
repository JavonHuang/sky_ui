import 'package:flutter/material.dart';

import '../alert/index.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget({super.key});

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset(0.5, 0.2),
      child: UnconstrainedBox(
        child: Material(
          color: Color.fromARGB(0, 0, 0, 0),
          child: Container(
            // height: 100,
            width: 500,
            child: const SkyAlert(
              title: "不可关闭的 alert",
              type: SkyAlertType.success,
            ),
          ),
        ),
      ),
    );
  }
}
