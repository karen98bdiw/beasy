import 'package:beasy/pages/buisnes_user/create_buisnes_page.dart';
import 'package:beasy/widgets/buttons.dart';
import 'package:beasy/widgets/stak_card.dart';
import 'package:flutter/material.dart';

class BuisnesUserProfilePage extends StatefulWidget {
  BuisnesUserProfilePage({Key key}) : super(key: key);

  @override
  _BuisnesUserProfilePageState createState() => _BuisnesUserProfilePageState();
}

class _BuisnesUserProfilePageState extends State<BuisnesUserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(children: [
      Column(
        children: [
          Container(
            height: 100,
            width: 100,
            child: Image.asset("assets/user_photo.jpg"),
          ),
          Container(
            child: Text("Name "),
          ),
          Container(
            child: Text("SurName"),
          ),
          Container(
            child: Text("description"),
          ),
          Container(
            child: CustumButton(
              text: "Create Buisnes",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CreateBuisnesPage()));
              },
            ),
          ),
        ],
      ),
      Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return StackCard(
                  description: "desc",
                  name: "name",
                );
              }))
    ]);
  }
}
