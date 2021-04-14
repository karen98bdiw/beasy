import 'package:beasy/widgets/buttons.dart';
import 'package:beasy/widgets/inpurs.dart';
import 'package:flutter/material.dart';

class InfoPageView extends StatefulWidget {
  InfoPageView({Key key}) : super(key: key);

  @override
  _InfoPageViewState createState() => _InfoPageViewState();
}

class _InfoPageViewState extends State<InfoPageView> {
  var _workerNameController = TextEditingController();
  var _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 65, 85, 1),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          CustomInput(
            hintText: "Worker Name",
            controller: _workerNameController,
          ),
          CustomInput(
            hintText: "Description",
            controller: _workerNameController,
          ),
          CustumButton(
            text: "add servise",
            onTap: () {
              showAlertDialog(context);
            },
          ),
          CustumButton(text: "Add Stream", onTap: () {})
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      //scrollable: true,
      backgroundColor: Color.fromRGBO(50, 65, 85, 1),
      title: Row(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(65)),
                image: DecorationImage(
                    image: AssetImage("assets/user_photo.jpg"),
                    fit: BoxFit.cover)),
          ),
          Text("My title"),
        ],
      ),
      content: Column(
        children: [
          CustomInput(
            hintText: "Servise tyope",
          ),
          CustomInput(
            hintText: "servise duration",
          )
        ],
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
