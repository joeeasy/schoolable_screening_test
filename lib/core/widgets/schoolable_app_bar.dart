import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schoolable/constants/constants.dart';
import 'package:schoolable/core/model/comment_model.dart';

class SchoolableAppBar extends StatelessWidget {
  const SchoolableAppBar({
    Key key,
    @required this.isShrink,
  }) : super(key: key);

  final bool isShrink;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: isShrink
          ? Theme.of(context).primaryColor
          : Colors.transparent,
      floating: false,
      pinned: true,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: P_L_R_24,
        centerTitle: isShrink ? true : false,
        title: Text(
            isShrink
                ? "Comments"
                : "Comments (${commentList.length ?? 0})",
            key: Key('_toolBarTitle'),
            style: GoogleFonts.nunito(
              textStyle: TextStyle(
                color: isShrink ? Colors.white : headerColor,
                fontSize: isShrink ? 20 : 16.0,
                fontWeight: isShrink
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            )),
      ),
    );
  }
}