import 'package:flutter/material.dart';
import 'package:schoolable/core/model/comment_model.dart';
import 'package:schoolable/core/widgets/tool_bar_content.dart';

import 'comment_list.dart';
import 'schoolable_app_bar.dart';

class SchoolableScrollView extends StatefulWidget {
  final ScrollController customScrollController;
  final List<Comment> commentList;

  SchoolableScrollView({ Key key, this.customScrollController, this.commentList}) : super(key: key);
  @override
  SchoolableScrollViewState createState() => SchoolableScrollViewState();
}

class SchoolableScrollViewState extends State<SchoolableScrollView> {

  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return widget.customScrollController.hasClients &&
        widget.customScrollController.offset >
            ((MediaQuery.of(context).size.height / 2));
  }

  @override
  void initState() {
    widget.customScrollController.addListener(_scrollListener);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: Key('_customScrollView'),
      controller: widget.customScrollController,
      slivers: <Widget>[
        ToolBarContent(),
        SchoolableAppBar(isShrink: isShrink),
        CommentList(),
      ],
    );
  }
}
