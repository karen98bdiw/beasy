import 'package:beasy/widgets/buttons.dart';
import 'package:beasy/widgets/inpurs.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(50, 65, 85, 1), body: _body());
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      child: Column(
        children: [
          tapChange(),
          Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          CustomInput(
            hintText: 'Name',
          ),
          CustomInput(
            hintText: 'Sure Name',
          ),
          CustomInput(
            hintText: 'Email',
          ),
          CustomInput(
            hintText: 'Password',
          ),
          CustomInput(
            hintText: 'Reapit Password',
          ),
          userTypeCheckView(),
          CustumButton(text: "Sign Up"),
        ],
      ),
    );
  }

  Widget userTypeCheckView() => Column(
        children: [
          Text(
            "I will use Stack for",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 9,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Book a Queue",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "My Buisnes",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );

  Widget tapChange() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
            onTap: () {},
            child: Text(
              "Sign Up",
              style: TextStyle(color: Colors.white),
            )),
        GestureDetector(
            onTap: () {},
            child: Text("Sign In", style: TextStyle(color: Colors.white)))
      ],
    );
  }
}
