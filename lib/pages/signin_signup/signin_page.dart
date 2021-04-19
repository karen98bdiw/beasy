import 'package:beasy/models/company_model/company.dart';
import 'package:beasy/models/company_model/company_stream.dart';
import 'package:beasy/models/company_model/stream_queue_item.dart';
import 'package:beasy/models/user_models/user.dart';
import 'package:beasy/pages/buisnes_user/home_page_buisnes_user.dart';
import 'package:beasy/pages/usual_user/home_page_user.dart';
import 'package:beasy/services/beasyApi.dart';
import 'package:beasy/services/company_services.dart';
import 'package:beasy/services/profile_services.dart';
import 'package:beasy/utils/enums.dart';
import 'package:beasy/utils/helpers.dart';
import 'package:beasy/widgets/buttons.dart';
import 'package:beasy/widgets/inpurs.dart';
import 'package:flutter/material.dart';

class SingInPage extends StatefulWidget {
  SingInPage({Key key}) : super(key: key);

  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  String email;
  String password;

  final _formState = GlobalKey<FormState>();

  void _onSign() async {
    if (!_formState.currentState.validate()) {
      return;
    }
    _formState.currentState.save();
    var res = await BeasyApi()
        .profileServices
        .signIn(email: email, password: password);

    if (res) {
      if (BeasyApi().profileServices.user.userType == UserType.UsualUser) {
        Navigator.of(context).pushReplacementNamed(HomePageUser.routeName);
      } else {
        Navigator.of(context)
            .pushReplacementNamed(HomePageBuisnessUser.routeName);
      }
    }
  }

  getData() async {
    await BeasyApi().companyServices.getCompany();
    print(BeasyApi().companyServices.curentUserCompany.companyStreams[0].queue);
  }

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
      child: Form(
        key: _formState,
        child: Column(
          children: [
            Container(
                child: Text("Sing In",
                    style: TextStyle(color: Colors.white, fontSize: 18))),
            CustomInput(
              hintText: "Email",
              onSaved: (v) => this.email = v,
              validator: (v) => v.isEmpty
                  ? "Email is required!"
                  : isValidEmail(v)
                      ? null
                      : "Invalid email",
            ),
            CustomInput(
              hintText: "Password",
              onSaved: (v) => this.password = v,
              validator: (v) => v.isEmpty ? "Password is required" : null,
              obscureText: true,
            ),
            CustumButton(
              text: "Sign In",
              onTap: _onSign,
            )
          ],
        ),
      ),
    );
  }
}
