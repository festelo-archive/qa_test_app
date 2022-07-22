// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:qa_test_app/main.dart';

void main() {
  testWidgets('Ensure there\'s a widget with text `Item 5`',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TestApp());
    expect(find.text('Item 5').hitTestable(), findsOneWidget);
  });

  testWidgets('Ensure there\'s 10 `Item X` widgets',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TestApp());
    final textWidgets =
        tester.widgetList(find.textContaining('Item')).cast<Text>().toList();

    expect(textWidgets.length, 10);
  });

  testWidgets(
      'Ensure the number X in elements `Item X` is growing: Item 1, Item 2, Item 3, etc',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TestApp());
    final textWidgets =
        tester.widgetList(find.textContaining('Item')).cast<Text>().toList();

    expect(
      textWidgets.map((e) => e.data),
      List.generate(textWidgets.length, (i) => 'Item ${i + 1}'),
    );

    // OR

    for (var i = 0; i < textWidgets.length; i++) {
      expect(
        textWidgets[i].data,
        'Item ${i + 1}',
      );
    }
  });
}
