import 'package:flutter/material.dart';

class CustumButton extends StatelessWidget {
  final String text;
  final Function onTap;
  CustumButton({this.text,this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      onPressed:onTap
    );
  }
}