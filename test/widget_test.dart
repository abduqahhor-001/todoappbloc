// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:todoappbloc/main.dart';
import 'package:todoappbloc/pages/list_post_one.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ListPostOne(1));

    expect(find.text('Post ID: 1'), findsOneWidget);
    expect(find.text('Post Title: Test Title'), findsOneWidget);
    expect(find.text('Post Body: Test Body'), findsOneWidget);
  });
}
