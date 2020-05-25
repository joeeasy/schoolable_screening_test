import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schoolable/constants/constants.dart';
import 'package:schoolable/core/model/comment_model.dart';

class CommentView extends StatelessWidget {
  final int index;

  CommentView({this.index});

  @override
  Widget build(BuildContext context) {
    bool isMe = commentList[index].sender.id == currentUser.id;
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: isMe ? EdgeInsets.only(left: 70) : EdgeInsets.only(left: 24.0),
            decoration: BoxDecoration(
              color: isMe ? Theme.of(context).primaryColor : Colors.white ,
              borderRadius: isMe ? currentUserborder : userCommentBorder,
              boxShadow: isMe ? [] : [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.2),
                  spreadRadius: 0.5,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            padding: EdgeInsets.only(
              top: 24,
              left: 20,
              right: 16,
              bottom: 24,
            ),
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  commentList[index].text,
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      height: 1.5,
                      color: isMe ? Colors.white : textPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        commentList[index].sender.imageUrl,
                        height: 32,
                        width: 32,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                          isMe ? 'You' : commentList[index].sender.name,
                          style:isMe ? TextStyle(
                            color: Colors.white,
                            fontSize: 14
                          ): cardFooterStyle),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          commentList[index].time,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: isMe ? Colors.white : textSecondaryColor, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
