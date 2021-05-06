import 'dart:async';

import 'package:flutter/services.dart';

class AndroidPushPermissions {
  static const MethodChannel _channel =
      MethodChannel('android_push_permissions');

  static Future<bool?> isEnabled({String? channelId}) async {
    final result =
        await _channel.invokeMethod<bool>('isEnabled', <String, dynamic>{
      'channelId': channelId,
    });
    return result;
  }
}
