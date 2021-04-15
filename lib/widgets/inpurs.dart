import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final IconData prefix;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final bool obscureText;
  

  CustomInput({
    this.hintText,
    this.prefix,
    this.onSaved,
    this.validator,
    this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.only(top: 8),
    child: TextFormField(
      
      validator: validator,
      onSaved: onSaved,
      cursorColor: Colors.white,
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        isDense: true,
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        focusColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        labelStyle: TextStyle(
            fontWeight: FontWeight.w300, fontSize: 18, color: Colors.white),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0))),
      ),
    ),
  );
  }
}