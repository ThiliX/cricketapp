import 'package:flutter_test/flutter_test.dart';

import 'package:cricketapp/main.dart';

void main() {
  testWidgets('Mini Cricket smoke test and gameplay flow', (WidgetTester tester) async {
    await tester.pumpWidget(const MiniCricketApp());

    // Verify initial state
    expect(find.text('Mini Cricket'), findsOneWidget);
    expect(find.text('Runs'), findsOneWidget);
    expect(find.text('Balls'), findsOneWidget);
    expect(find.text('0'), findsOneWidget); // Runs
    expect(find.text('6'), findsOneWidget); // Balls
    expect(find.text('Bat'), findsOneWidget);
    expect(find.text('Restart'), findsNothing);

    // Tap Bat once
    await tester.tap(find.text('Bat'));
    await tester.pump();

    // Balls should now be 5
    expect(find.text('5'), findsOneWidget);
    expect(find.text('Bat'), findsOneWidget);

    // Tap remaining 5 times (total 6 balls bowled)
    for (int i = 0; i < 5; i++) {
      await tester.tap(find.text('Bat'));
      await tester.pump();
    }

    // Now balls should be 0 and button should be Restart
    expect(find.text('0'), findsWidgets); // Balls is 0 (and possibly runs or part of it)
    expect(find.text('Bat'), findsNothing);
    expect(find.text('Restart'), findsOneWidget);

    // Tap Restart
    await tester.tap(find.text('Restart'));
    await tester.pump();

    // App resets to initial state
    expect(find.text('Bat'), findsOneWidget);
    expect(find.text('Restart'), findsNothing);
    expect(find.text('6'), findsOneWidget);
  });
}
