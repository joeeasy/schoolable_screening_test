

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


  testWidgets('On sufficient scroll, the "PTA meeting" section disappears and that the screen title becomes Comments', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    const headerTitle = 'PTA meeting';
    await tester.pumpWidget(MyApp());
    await tester.drag(find.byKey(Key('_nestedScrollView')), Offset(0, -500));
    await tester.pump();

    expect(find.text(headerTitle), findsOneWidget);
  });
}
