import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:android_push_permissions/android_push_permissions.dart';

void main() {
  const MethodChannel channel = MethodChannel('android_push_permissions');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return true;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('isEnabled', () async {
    expect(await AndroidPushPermissions.isEnabled(), true);
  });
}
