
import 'dart:async';

import 'package:flutter/services.dart';

class AndroidPushPermissions {
  static const MethodChannel _channel =
      const MethodChannel('android_push_permissions');

  static Future<bool> isEnabled({String channelId}) async {
    final bool result = await _channel.invokeMethod('isEnabled', <String, dynamic>{
            'channelId': channelId,
           });
    return result;
  }


}
