import 'package:flutter_test/flutter_test.dart';

import 'package:bopomogo/app.dart';

void main() {
  testWidgets('BopomoGo home screen renders', (WidgetTester tester) async {
    await tester.pumpWidget(const BopomoGoApp());

    expect(find.text('BopomoGo'), findsOneWidget);
    expect(find.text('Translate'), findsOneWidget);
    expect(find.text('Main Translation'), findsOneWidget);
  });
}
