import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_state_patterns/main.dart';

void main() {
  testWidgets('Initial screen has navigation button', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Loja Virtual'), findsOneWidget);
    expect(find.text('Ver Produtos'), findsOneWidget);
    expect(find.byType(FilledButton), findsOneWidget);
  });
}
