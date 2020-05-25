import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schoolable/core/views/home.dart';
import 'package:schoolable/core/widgets/comment.dart';
import 'package:schoolable/core/widgets/schoolable_custom_scroll_view.dart';
import 'package:schoolable/main.dart';
import 'package:flutter/widgets.dart';

void main() {
  testWidgets('Comment appears on the screen when the send button is pressed',
      (WidgetTester tester) async {
    final schoolableHomeKey = Key('schoolableHomeKey');
    String commentText = 'Comment test';

    //Load SchoolableHomeView widget
    await tester.pumpWidget(MaterialApp(
      home: SchoolableHome(
        key: schoolableHomeKey,
      ),
    ));

    /*Attempt to acess the state of the SchoolablehomeView
    * For easy update of the UI
    * */
    final StatefulElement schoolableHomeView =
        tester.element(find.byKey(schoolableHomeKey));
    final SchoolableHomeState schoolableHomeState =
        schoolableHomeView.state as SchoolableHomeState;

    //Simulate text input and button press before state update
    await tester.enterText(find.byKey(Key('_commentBox')), commentText);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.tap(find.byKey(Key('_addCommentButton')));
    schoolableHomeState.customScrollController.jumpTo(schoolableHomeState.customScrollController.position.maxScrollExtent + 500);
    schoolableHomeState.build(schoolableHomeState.context);

    await tester.pump(const Duration(milliseconds: 10));
    final newComment = schoolableHomeState.comments[schoolableHomeState.comments.length - 1];

    expect(commentText, newComment.text);

  });

//find PTA meeting text before scroll started
  testWidgets('Confirm "PTA meeting" widget visibility before scroll',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    const headerTitle = 'PTA Meeting';
    await tester.pumpWidget(MyApp());
    Text headerWidgetTitle = tester.firstWidget(find.descendant(
      of: find.byType(SliverToBoxAdapter),
      matching: find.byType(Text),
    ));
    await tester.pump(const Duration(milliseconds: 10));
    expect(headerWidgetTitle.data, headerTitle);
  });

  //Test that scroll is
  testWidgets(
      'On sufficient scroll, the "PTA meeting" section disappears and that the screen title becomes Comments',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    const headerTitle = 'PTA Meeting';
    const scrollTitle = "Comments";
    const prevAppBarTitle = "Comments (5)";
    final ScrollController customScrollController = ScrollController();
    final scrollkey = Key('schoolable_scroll_view');

    /*
    * 1. Scroll down the end of the page using the ScrollView controller
    * 2. Obtain The ScrollView Shrink State
    *
    * */
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          child: Container(
            child: SchoolableScrollView(
              key: scrollkey,
              customScrollController: customScrollController,
            ),
          ),
        ),
      ),
    ));
    final StatefulElement schoolableScrollView =
        tester.element(find.byKey(scrollkey));
    final SchoolableScrollViewState schoolableScrollViewState =
        schoolableScrollView.state as SchoolableScrollViewState;
    customScrollController
        .jumpTo(customScrollController.position.maxScrollExtent);

    schoolableScrollViewState.setState(() {});
    await tester.pump(const Duration(milliseconds: 10));

    expect(find.text(headerTitle), findsNothing);
    expect(find.text(prevAppBarTitle), findsNothing);
    expect(find.text(scrollTitle), findsOneWidget);
  });
}
