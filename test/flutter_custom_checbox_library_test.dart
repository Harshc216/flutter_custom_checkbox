import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_custom_checbox_library/flutter_custom_checbox_library.dart';

void main() {
  group('CustomCheckbox Tests', () {
    testWidgets('CustomCheckbox renders unchecked by default', (WidgetTester tester) async {
      bool checked = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return CustomCheckbox(
                  value: checked,
                  onChanged: (val) {
                    setState(() {
                      checked = val;
                    });
                  },
                );
              },
            ),
          ),
        ),
      );

      // Verify widget exists
      expect(find.byType(CustomCheckbox), findsOneWidget);
    });

    testWidgets('CustomCheckbox toggles value on tap', (WidgetTester tester) async {
      bool checked = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return CustomCheckbox(
                  value: checked,
                  onChanged: (val) {
                    setState(() {
                      checked = val;
                    });
                  },
                );
              },
            ),
          ),
        ),
      );

      // Tap the checkbox
      await tester.tap(find.byType(CustomCheckbox));
      await tester.pumpAndSettle();

      // Verify that value toggled to true
      expect(checked, isTrue);
    });
  });

  group('CircleCheckbox Tests', () {
    testWidgets('CircleCheckbox renders properly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CircleCheckbox(
              value: true,
              onChanged: (val) {},
            ),
          ),
        ),
      );

      expect(find.byType(CircleCheckbox), findsOneWidget);
    });
  });
}
