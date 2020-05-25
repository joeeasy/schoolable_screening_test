import 'package:flutter/material.dart';
import 'package:schoolable/constants/constants.dart';
import 'package:schoolable/core/model/comment_model.dart';
import 'package:schoolable/core/widgets/schoolable_custom_scroll_view.dart';


class SchoolableHome extends StatefulWidget {
  SchoolableHome({Key key}) : super(key : key);
  @override
  SchoolableHomeState createState() => SchoolableHomeState();
}

class SchoolableHomeState extends State<SchoolableHome> {
  TextEditingController commentBoxController = TextEditingController();

  ScrollController customScrollController = ScrollController();
  String commentText;

  List<Comment> get comments {
    return commentList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: commentBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 10),
                  child: SchoolableScrollView(
                    customScrollController: customScrollController,
                    commentList: comments
                  ),
                ),
                onTap: () => FocusScope.of(context).unfocus(),
              ),
            ),
            _buildCommentComposer(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentComposer(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24, right: 24, left: 24),
      color: commentBackgroundColor,
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextFormField(
            key: Key('_commentBox'),
            controller: commentBoxController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 16, right: 16),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: 'Leave a comment',
              fillColor: Colors.white,
              filled: true,
            ),
          )),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            key: Key('_addCommentButton'),
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
                addNewComment(commentBoxController.text);
                commentBoxController.clear();

              customScrollController.jumpTo(
                  customScrollController.position.maxScrollExtent + 500);
              FocusScope.of(context).unfocus();
              setState(() {
              });
            },
            child: Icon(Icons.send),
          )
        ],
      ),
    );
  }

  void addNewComment(String commentText) {
    comments.add(
      Comment(
        sender: currentUser,
        time: getTime(),
        text: commentText,
      ),
    );
  }
}
