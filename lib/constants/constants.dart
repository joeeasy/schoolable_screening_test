import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const APP_NAME = 'Schoolable screening project';
const TITLE = 'PTA Meeting';
const dummy_school_profile = 'assets/images/profile_icon.png';
const P_L_R_24 = EdgeInsets.only(left: 24, right: 24);
const P_T_B_24 = EdgeInsets.only(top: 24, bottom: 24);
const P_T_B_32 = EdgeInsets.only(top: 32, bottom: 40);

const textPrimaryColor = Color(0xff3c3c56);
const textSecondaryColor = Color(0xff757493);
const textAccentColor = Color(0xff5e66f4);
const commentBackgroundColor = Color(0xfff3f3f7);
const headerColor = Color(0xff232338);
const lineColor = Color(0xfff9f9fb);

const headerStyle = TextStyle(
    fontSize: 24, color: headerColor, fontFamily: 'AribauGrotesk-Medium');
const cardFooterStyle = TextStyle(
    fontSize: 14, color: headerColor, fontFamily: 'AribauGrotesk-Medium');

var textContentStyle = GoogleFonts.lato(
  textStyle: TextStyle(
    fontSize: 14,
    color: headerColor,
  ),
);

var textContentStyle2 = GoogleFonts.nunito(
  textStyle: TextStyle(
    fontSize: 14,
    color: Colors.black,
  ),
);

const userCommentBorder = BorderRadius.only(
  topLeft: Radius.circular(24),
  topRight: Radius.circular(24),
  bottomRight: Radius.circular(24),
);
const currentUserborder = BorderRadius.only(
  topLeft: Radius.circular(24),
  topRight: Radius.circular(24),
  bottomLeft: Radius.circular(24),
);


const textContent1 = '''
  1. We now charge for Bitcoin deposits. We deduct a small fee for each Bitcoin amount you send to our app.
''';
const textContent2 = '''
  2. We posted this notice on our communituy group few days ago, But since many people missed it, we decided to write it in this email as well.
''';