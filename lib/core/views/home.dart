import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schoolable/constants/constants.dart';
import 'package:schoolable/core/model/comment_model.dart';
import 'package:schoolable/core/widgets/comment.dart';
import 'package:schoolable/core/widgets/tool_bar_content.dart';

class SchoolableHome extends StatefulWidget {
  @override
  _SchoolableHomeState createState() => _SchoolableHomeState();
}

class _SchoolableHomeState extends State<SchoolableHome> {
  TextEditingController _commentBoxController = TextEditingController();
  ScrollController _controller = ScrollController();
  ScrollController _nestedScrollController = ScrollController();
  String commentText;

  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _nestedScrollController.hasClients &&
        _nestedScrollController.offset >
            ((MediaQuery.of(context).size.height / 2));
  }

  @override
  void initState() {
    _nestedScrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: commentBackgroundColor,
      body: SafeArea(
        child: GestureDetector(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 10),
            child: NestedScrollView(
              key: Key('_nestedScrollView'),
              controller: _nestedScrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverToBoxAdapter(
                    child: ToolBarContent(),
                  ),
                  SliverAppBar(
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
                              : "Comments (${comments.length ?? 0})",
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
                  ),
                ];
              },
              body: Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        child: ListView.builder(
                          controller: _controller,
                          itemCount: comments.length,
                          itemBuilder: (BuildContext context, index) =>
                              CommentView(
                            index: index,
                          ),
                        ),
                      ),
                    ),
                    _buildCommentComposer(context),
                  ],
                ),
              ),
            ),
          ),
          onTap: () => FocusScope.of(context).unfocus(),
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
            controller: _commentBoxController,
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
              setState(() {
                addNewComment(_commentBoxController.text);
                _commentBoxController.clear();
              });

              _nestedScrollController
                  .jumpTo(_nestedScrollController.position.maxScrollExtent);
              _controller.jumpTo(_controller.position.maxScrollExtent);
              FocusScope.of(context).unfocus();
            },
            child: Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
