import 'package:flutter_test/flutter_test.dart';
import 'package:example/main.dart';

void main() {
  testWidgets('Showcase application renders custom checkbox hub', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the title text is rendered.
    expect(find.text('Checkbox Hub'), findsOneWidget);

    // Verify tabs exist
    expect(find.text('PLAYGROUND'), findsOneWidget);
    expect(find.text('SPECIALIZED'), findsOneWidget);
    expect(find.text('SCENARIOS'), findsOneWidget);
    expect(find.text('FORM'), findsOneWidget);
  });
}
