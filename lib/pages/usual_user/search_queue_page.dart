import 'package:flutter/material.dart';

class SearchQueuePage extends StatefulWidget {
  SearchQueuePage({Key key}) : super(key: key);

  @override
  _SearchQueuePageState createState() => _SearchQueuePageState();
}

class _SearchQueuePageState extends State<SearchQueuePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Text('SearchQueuePage'),
    );
  }
}
