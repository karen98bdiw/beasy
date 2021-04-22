import 'package:beasy/models/user_models/user.dart';
import 'package:beasy/pages/buisnes_user/create_buisnes_page.dart';
import 'package:beasy/pages/signin_signup/onBoard.dart';
import 'package:beasy/services/beasyApi.dart';
import 'package:beasy/utils/helpers.dart';
import 'package:beasy/utils/style_color.dart';
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
  double screenWidth;
  double screenHeight;
  final Duration duration = const Duration(milliseconds: 500);
  bool _isSideMenuOpen = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            _isSideMenuOpen ? myBackgroundColor : myBackgroundColor,
        body: Stack(children: [_sideMenu(), _body()]),
      ),
    );
  }

  Widget _sideMenu() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        //decoration: BoxDecoration(),
        width: MediaQuery.of(context).size.width * 0.5,
        margin: EdgeInsets.symmetric(vertical: 50),
        // color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                child: Row(
              children: [
                Container(
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                ),
                Container(
                    child: Text("User",
                        style: TextStyle(color: Colors.white, fontSize: 18)))
              ],
            )),
            Container(
                child: Row(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.email,
                      color: Colors.white,
                      size: 30,
                    )),
                Text("Email",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            )),
            Container(
                child: Row(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 30,
                    )),
                Text("Phone",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            )),
            Container(
                child: Row(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 30,
                    )),
                Text("Settings",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            )),
            InkWell(
              onTap: () async {
                var singOut = await BeasyApi().profileServices.singOut();
                if (singOut) {
                  Navigator.of(context).popAndPushNamed(OnBoard.routeName);
                }
              },
              child: Container(
                  child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 30,
                      )),
                  Text("Log out",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return AnimatedPositioned(
      duration: duration,
      top: _isSideMenuOpen ? 0 : 0.1 * screenHeight,
      bottom: _isSideMenuOpen ? 0 : 0.1 * screenWidth,
      left: _isSideMenuOpen ? 0 : 0.6 * screenWidth,
      right: _isSideMenuOpen ? 0 : -0.4 * screenWidth,
      child: Material(
        elevation: 5,
        borderRadius:
            _isSideMenuOpen ? null : BorderRadius.all(Radius.circular(20)),
        child: Stack(children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
            decoration: BoxDecoration(
                color: myBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _isSideMenuOpen = !_isSideMenuOpen;
                      });
                    },
                    icon: Icon(Icons.menu),
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/user_photo.jpg"))),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                user.name + " " + user.surname,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text(user.email ?? "email not adjusted",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              child: Text(stringFromUserType(user.userType)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                user.companyId == null
                    ? Container(
                        child: CustumButton(
                          text: "Create Buisnes",
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CreateBuisnesPage()));
                          },
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Text(
                          "Your workers queue",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))
              ],
            ),
          ),
          if (user.companyId != null)
            Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.3),
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
                        description: stack.streamDescription,
                        name: stack.streamName,
                      );
                    }))
        ]),
      ),
    );
  }
}
