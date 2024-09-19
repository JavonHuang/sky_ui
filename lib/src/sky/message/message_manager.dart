import 'message_future.dart';

class MessageManager {
  factory MessageManager() => _instance;

  MessageManager._();

  static final MessageManager _instance = MessageManager._();

  final Set<MessageFuture> MessageSet = <MessageFuture>{};

  void dismissAll() {
    MessageSet.toList().forEach((MessageFuture v) {
      MessageSet.remove(v);
    });
  }

  void removeFuture(MessageFuture future) {
    MessageSet.remove(future);
  }

  void addFuture(MessageFuture future) {
    MessageSet.add(future);
  }

  MessageFuture getFutureByIndex(int index) {
    return MessageSet.toList()[index];
  }
}
