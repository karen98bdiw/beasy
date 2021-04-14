import 'package:flutter/material.dart';

class StreamInfo extends StatefulWidget {
  StreamInfo({Key key}) : super(key: key);

  @override
  _StreamInfoState createState() => _StreamInfoState();
}

class _StreamInfoState extends State<StreamInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: _body(),
    );
  }
  Widget _body(){
    return ListView(
    children: [
      Container(child: Text("Worker name"),),
      Container(child:Text("Type work")),
      Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context,index){
            return ListTile(
              title: Text("${DateTime.now().hour}:${DateTime.now().minute}"),
            );
          }),  
      ),
    ],
    );
  }
}