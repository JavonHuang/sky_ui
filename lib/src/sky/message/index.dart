// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import '../alert/index.dart';
// import '../register/index.dart';
// import 'message_future.dart';
// import 'message_manager.dart';
// import 'message_widget.dart';

// class SkyMessage {
//   final String message;
//   final SkyAlertType type;
//   final Duration duration;
//   final bool showClose;
//   final bool center;
//   final Function()? onClose;
//   final double offset;
//   SkyMessage({
//     required this.message,
//     this.type = SkyAlertType.info,
//     this.duration = const Duration(milliseconds: 3000),
//     this.showClose = false,
//     this.center = false,
//     this.onClose,
//     this.offset = 20,
//   });

//   MessageFuture open() {
//     late OverlayEntry? _overlayEntry;

//     GlobalKey<NavigatorState>? navigatorKey = SkyInit().navigatorKey;
//     if (navigatorKey == null) {
//       assert(navigatorKey != null, "service need to run register function");
//     }
//     _overlayEntry = OverlayEntry(
//       builder: (context) {
//         // print(MediaQuery.of(context).viewInsets.bottom);
//         return Positioned(
//           child: MessageWidget(child: const Text("7878789789")),
//         );
//         // return MessageWidget(child: const Text("7878789789"));
//       },
//     );
//     final MessageFuture future = MessageFuture(entry: _overlayEntry!, duration: duration);
//     MessageManager().addFuture(future);

//     future.insertEntry(navigatorKey!.currentState!.overlay!);
//     return future;
//   }
// }
