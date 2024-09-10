import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

part 'loading_overlay_entry.dart';
part 'loading_controller.dart';
part 'loading_wrapper.dart';
part 'loading_widget.dart';

class SkyLoading {
  SkyLoading._privateConstructor();

  static final SkyLoading _instance = SkyLoading._privateConstructor();

  factory SkyLoading() => _instance;

  static final SkyLoadingController appLoading = SkyLoadingController();

  String _defaultLoadingText = 'Loading...';

  void setDefaultLoadingText(String text) => _defaultLoadingText = text;

  get defaultLoadingText => _defaultLoadingText;
}
