import 'package:beasy/pages/home_page.dart';
import 'package:beasy/pages/buisnes_user/home_page_buisnes_user.dart';
import 'package:beasy/pages/signIn_signup/signin_page.dart';
import 'package:flutter/material.dart';

class Beasy extends StatelessWidget {
  const Beasy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SingInPage(),
    );
  }
}