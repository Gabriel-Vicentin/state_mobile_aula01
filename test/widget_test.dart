import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_state_patterns/main.dart';

void main() {
  testWidgets('Products can be marked as favorite', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Notebook'), findsOneWidget);
    expect(find.text('Mouse'), findsOneWidget);
    expect(find.text('Teclado'), findsOneWidget);
    expect(find.text('Monitor'), findsOneWidget);

    expect(find.byIcon(Icons.favorite), findsNothing);

    await tester.tap(find.byKey(const ValueKey('favorite-Notebook')));
    await tester.pump();

    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsNWidgets(3));
  });
}
