// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bmi_cal/main.dart';

void main() {
  testWidgets('BMI Calculator Smoke Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BMICalculator());

    // Verify that the title is displayed.
    expect(find.text('BMI CALCULATOR'), findsOneWidget);

    // Verify default state displays metric values.
    expect(find.text('170 cm'), findsOneWidget);
    expect(find.text('70'), findsOneWidget);

    // Tap the Imperial toggle.
    await tester.tap(find.text('IMPERIAL'));
    await tester.pumpAndSettle();

    // Verify it changed to imperial values.
    expect(find.text('5\' 7"'), findsOneWidget);
    expect(find.text('154'), findsOneWidget);
  });
}
