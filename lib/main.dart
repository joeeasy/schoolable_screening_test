import 'package:flutter/material.dart';
import 'package:schoolable/constants/constants.dart';

import 'core/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff5e66f4),
      ),
      home: SchoolableHome(),
    );
  }
}




