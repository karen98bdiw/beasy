import 'package:beasy/models/company_model/company.dart';
import 'package:beasy/models/user_models/user.dart';
import 'package:beasy/pages/buisnes_user/create_buisnes_page.dart';
import 'package:beasy/services/beasyApi.dart';
import 'package:beasy/utils/helpers.dart';
import 'package:beasy/widgets/buttons.dart';
import 'package:beasy/widgets/stak_card.dart';
import 'package:flutter/material.dart';

class BuisnesUserProfilePage extends StatefulWidget {
  static final routeName = "BuisnesUserProfilePage";

  BuisnesUserProfilePage({Key key}) : super(key: key);

  @override
  _BuisnesUserProfilePageState createState() => _BuisnesUserProfilePageState();
}

class _BuisnesUserProfilePageState extends State<BuisnesUserProfilePage> {
  User user = BeasyApi().profileServices.user;

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
            child: Text(user.name),
          ),
          Container(
            child: Text(user.surname),
          ),
          Container(
            child: Text(stringFromUserType(user.userType)),
          ),
          if (user.companyId == null)
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
      if (user.companyId != null)
        Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            child: ListView.builder(
                itemCount: BeasyApi()
                    .companyServices
                    .curentUserCompany
                    .companyStreams
                    .length,
                itemBuilder: (context, index) {
                  var stack = BeasyApi()
                      .companyServices
                      .curentUserCompany
                      .companyStreams[index];
                  return StackCard(
                    id: stack.companyStreamId,
                    state: stack.companyStreamState,
                    description: stack.streamName,
                    name: stack.streamDescription,
                  );
                }))
    ]);
  }
}
