import 'package:beasy/models/company_model/company.dart';
import 'package:beasy/pages/buisnes_user/streams_page.dart';
import 'package:beasy/services/beasyApi.dart';
import 'package:flutter/material.dart';

import 'buisnes_user_profile_page.dart';

class HomePageBuisnessUser extends StatefulWidget {
  static final routeName = "HomePageBuisnessUser";

  @override
  _HomePageBuisnessUserState createState() => _HomePageBuisnessUserState();
}

class _HomePageBuisnessUserState extends State<HomePageBuisnessUser> {
  int sectionIndex = 0;
  Company company;

  @override
  void initState() {
    getCompany();
    super.initState();
  }

  getCompany() async {
    await BeasyApi().companyServices.getCompany();
    print("loading ended company getted");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 65, 85, 1),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: sectionIndex,
        selectedItemColor: Colors.cyan[800],
        items: [
          BottomNavigationBarItem(label: "Streams", icon: Icon(Icons.menu)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
        ],
        onTap: (index) {
          setState(() {
            sectionIndex = index;
          });
        },
      ),
      body: _body(),
    );
  }

  Widget _body() {
    switch (sectionIndex) {
      case 0:
        return StreamsPage();
        break;
      case 1:
        return BuisnesUserProfilePage();
        break;
      default:
        return StreamsPage();
    }
  }
}
