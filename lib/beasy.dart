import 'package:beasy/pages/signin_signup/signin_page.dart';
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
