import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schoolable/main.dart';

void main() {
  testWidgets('Comment appears on the screen when the send button is pressed', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    String commentText = 'Example Comment Test';
    await tester.pumpWidget(MyApp());
    await tester.enterText(find.byKey(Key('_commentBox')), commentText);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.tap(
      find.byKey(
        Key('_addCommentButton'),
      ),
    );
    await tester.pump();

    expect(find.text(commentText), findsOneWidget);
  });

//find PTA meeting text before scroll started
  testWidgets('Confirm "PTA meeting" widget visibility before scroll', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    const headerTitle = 'PTA meeting';
    await tester.pumpWidget(MyApp());
    await tester.pump();

    expect(find.text(headerTitle), findsNothing);
  });

  //Test that scroll is
  testWidgets('On sufficient scroll, the "PTA meeting" section disappears and that the screen title becomes Comments', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    const headerTitle = 'PTA meeting';
    const scrollTitle = "Comments (5)";
    await tester.pumpWidget(MyApp());
    final Offset point = tester.getCenter(find.text("Comments (5)"));
    final gesture = await tester.startGesture(point);
    await gesture.moveBy(Offset(0, -300));
    await tester.pump();

    expect(find.text(headerTitle), findsNothing);
    expect(find.text(scrollTitle), findsOneWidget);
  });
}
