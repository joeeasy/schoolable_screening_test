import 'package:flutter/material.dart';
import 'package:schoolable/core/model/comment_model.dart';
import 'package:schoolable/core/widgets/comment.dart';

class CommentList extends StatefulWidget {
  final List<Comment> commentList;
  CommentList({this.commentList});
  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return CommentView(
          index: index,
        );
      }, childCount: commentList.length),
    );
  }
}
