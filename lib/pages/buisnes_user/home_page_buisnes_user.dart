import 'package:beasy/pages/buisnes_user/streams_page.dart';
import 'package:beasy/pages/usual_user/search_queue_page.dart';
import 'package:flutter/material.dart';

import 'buisnes_user_profile_page.dart';

class HomePageBuisnessUser extends StatefulWidget {
  int sectionIndex = 0;
  HomePageBuisnessUser({this.sectionIndex});

  @override
  _HomePageBuisnessUserState createState() => _HomePageBuisnessUserState();
}

class _HomePageBuisnessUserState extends State<HomePageBuisnessUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 65, 85, 1),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.sectionIndex,
        items: [
          BottomNavigationBarItem(
              label: "Streams", icon: Icon(Icons.menu)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
        ],
         onTap: (index) {
          setState(() {
            widget.sectionIndex = index;
          });
        },
      ),
      body: _body(),
    );
  }

  Widget _body() {
    switch (widget.sectionIndex) {
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
