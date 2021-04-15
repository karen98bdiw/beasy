import 'package:beasy/pages/buisnes_user/home_page_buisnes_user.dart';
import 'package:beasy/widgets/buttons.dart';
import 'package:beasy/widgets/inpurs.dart';
import 'package:flutter/material.dart';

class SingInPage extends StatefulWidget {
  SingInPage({Key key}) : super(key: key);

  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 65, 85, 1),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      child: Column(
        children: [
          Container(
              child: Text("Sing In",
                  style: TextStyle(color: Colors.white, fontSize: 18))),
          CustomInput(
            hintText: "Email",
          ),
          CustomInput(
            hintText: "Password",
          ),
          CustumButton(
            text: "Sign In",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomePageBuisnessUser()));
            },
          )
        ],
      ),
    );
  }
}
