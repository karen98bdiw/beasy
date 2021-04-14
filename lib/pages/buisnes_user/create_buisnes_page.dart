
import 'package:beasy/pages/buisnes_user/additional_page.dart';
import 'package:beasy/pages/buisnes_user/info_page.dart';
import 'package:flutter/material.dart';

class CreateBuisnesPage extends StatefulWidget {
  CreateBuisnesPage({Key key}) : super(key: key);

  @override
  _CreateBuisnesPageState createState() => _CreateBuisnesPageState();
}

class _CreateBuisnesPageState extends State<CreateBuisnesPage> {
  final controllerPageView = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return PageView(
      controller: controllerPageView,
      pageSnapping: true,
      children: [
        AdditionalPageView(
          controller: controllerPageView,
        ),
        InfoPageView()
      ],
    );
  }
}
