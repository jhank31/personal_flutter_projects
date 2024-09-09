import 'dart:developer';

import 'package:flutter/services.dart';

class PlatformService {
  static const MethodChannel _channel = MethodChannel('com.example.bird_game/openThirdPartyApp');

  Future<void> openThirdPartyApp(String packageName) async {
    try {
       await _channel.invokeMethod('openThirdPartyApp', {'packagename': packageName});
    } on PlatformException catch (e) {
      log("Failed to call native method: '${e.message}'.");
    }
  }
}