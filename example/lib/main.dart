import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:android_push_permissions/android_push_permissions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? _pushEnabled;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    bool? isPushEnabled = false;
    try {
      isPushEnabled = await AndroidPushPermissions.isEnabled();
    } on PlatformException {
      print('Failed to get push restrictions');
    }

    if (!mounted) return;

    setState(() {
      _pushEnabled = isPushEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text(
              'Push is enabled: ${_pushEnabled ?? 'Failed to get push restrictions'}\n'),
        ),
      ),
    );
  }
}
