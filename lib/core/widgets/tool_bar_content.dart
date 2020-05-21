import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schoolable/constants/constants.dart';

class ToolBarContent extends StatelessWidget {
  const ToolBarContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: P_L_R_24,
      //height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: P_T_B_32,
            child: Icon(
              Icons.arrow_back,
              size: 32,
            ),
          ),
          Text(
            TITLE,
            style: GoogleFonts.lato(textStyle: headerStyle),
          ),
          Padding(
            padding: P_T_B_24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    dummy_school_profile,
                    height: 50,
                    width: 50,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child:
                              Text('Vintage Heights', style: textContentStyle),
                        ),
                        SizedBox(
                          height: 18,
                          width: 0.5,
                          child: Container(
                            color: Colors.blueGrey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            '5 Jananuary, 2020',
                            style: TextStyle(
                              color: textSecondaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'To  you (Jehonadab Okpukoro)',
                      style: textContentStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 0.1,
            width: MediaQuery.of(context).size.width,
            child: Container(
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(height: 20),
          Text(
            textContent1,
            style: textContentStyle2,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            textContent2,
            style: textContentStyle2,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.perm_contact_calendar,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(width: 5,),
              Text('Add to calender', style: TextStyle(
                color: Theme.of(context).primaryColor
              ),),
            ],
          )
        ],
      ),
    );
  }
}
