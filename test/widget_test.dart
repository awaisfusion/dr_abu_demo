import 'package:flutter_test/flutter_test.dart';

import 'package:dr_abu_official/main.dart';

void main() {
  testWidgets('Dr Abu app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const DrAbuApp());

    // Verify that our app has the correct title
    expect(find.text('DR ABU'), findsOneWidget);
  });
}
