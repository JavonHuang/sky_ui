import 'package:flutter/material.dart';

class SkyInit {
  SkyInit._privateConstructor();

  static final SkyInit _instance = SkyInit._privateConstructor();

  factory SkyInit() => _instance;

  GlobalKey<NavigatorState>? _navigatorKey;

  void register(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  get navigatorKey => _navigatorKey;
}
