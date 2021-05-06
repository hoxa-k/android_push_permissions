import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:android_push_permissions_example/main.dart';

void main() {
  testWidgets('Check notification permissions', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that platform version is retrieved.
    expect(
      find.byWidgetPredicate(
        (Widget widget) => widget is Text && widget.data != null &&
                           widget.data!.startsWith('Push is enabled:'),
      ),
      findsOneWidget,
    );
  });
}
