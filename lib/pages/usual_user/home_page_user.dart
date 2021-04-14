import 'package:beasy/pages/buisnes_user/streams_page.dart';
import 'package:beasy/pages/usual_user/search_queue_page.dart';
import 'package:beasy/pages/usual_user/user_profile_page.dart';
import 'package:flutter/material.dart';

class HomePageUser extends StatefulWidget {
  int sectionIndex  = 0;
  HomePageUser({this.sectionIndex});

  @override
  _HomePageUserState createState() => _HomePageUserState();
}

class _HomePageUserState extends State<HomePageUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Color.fromRGBO(50, 65, 85, 1),
       body: _body(),
    );
  }
  Widget _body(){
    switch (widget.sectionIndex) {
      case 0:
      return SearchQueuePage();
        break;
          case 1:
      return UserProfilePage();
        break;
      default:
      return SearchQueuePage();
    }
  }
}