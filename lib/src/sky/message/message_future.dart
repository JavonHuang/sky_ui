import '../alert/index.dart';

class MessageFuture {
  final Duration duration;
  final String id;
  final String title;
  final SkyAlertType type;
  final SkyAlertEffect effect;
  final bool showIcon;

  MessageFuture({
    required this.duration,
    required this.id,
    required this.title,
    required this.type,
    required this.effect,
    required this.showIcon,
  });

  bool _dismissed = false;

  bool get dismissed => _dismissed;

  void dismiss() {}
}
