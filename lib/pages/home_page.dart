import 'package:beasy/widgets/inpurs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 65, 85, 1),
       body: Container(
         child: Column(
           children: [
             CustomInput(hintText: 'Email',)
           ],
         ),
       ),
    );
  }
}