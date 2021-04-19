import 'package:beasy/models/company_model/company.dart';
import 'package:beasy/models/company_model/company_category.dart';
import 'package:beasy/models/company_model/company_stream.dart';
import 'package:beasy/models/company_model/company_stream_service.dart';
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

  bool isLoading = false;

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

//testing button
// RaisedButton(
//                     onPressed: () async {
//                       setState(() {
//                         isLoading = true;
//                       });
//                       // BeasyApi().profileServices.createUser();
//                       var comp = Company(
//                         companyName: "testing compnany",
//                         companyCategories: [
//                           CompanyCategory(
//                             categoryName: "Sport",
//                             companyCategoryId: "0",
//                           ),
//                           CompanyCategory(
//                             categoryName: "Health",
//                             companyCategoryId: "1",
//                           ),
//                         ],
//                       );
//                       var stream = CompanyStream(
//                         streamName: "Worker number 1 stream",
//                         streamServices: [
//                           CompanyStreamService(
//                             serviceName: "serice of worker 1",
//                             durationInMinutes: 30,
//                           ),
//                         ],
//                       );
//                       stream.queue = [];
//                       comp.companyStreams = [stream];

//                       BeasyApi().companyServices.createCompany(
//                             company: comp,
//                           );
//                       setState(() {
//                         isLoading = false;
//                       });
//                     },
//                     child: Text("test"),
//                   ),
