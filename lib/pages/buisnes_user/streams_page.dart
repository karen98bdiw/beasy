import 'package:beasy/pages/buisnes_user/stream_info_page.dart';
import 'package:flutter/material.dart';

class StreamsPage extends StatefulWidget {
  StreamsPage({Key key}) : super(key: key);

  @override
  _StreamsPageState createState() => _StreamsPageState();
}

class _StreamsPageState extends State<StreamsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return StreamsCard();
        });
  }
}

class StreamsCard extends StatefulWidget {
  // comp.Company company;

  StreamsCard();

  @override
  _StreamsCardState createState() => _StreamsCardState();
}

class _StreamsCardState extends State<StreamsCard> {
  bool value = false;

  String workDays = "";
  String workTime = "";

  @override
  void initState() {
    // widget.company.workDays.forEach((element) {
    //   workDays += element.toString().substring(0, 3) + ",";
    // });
    // workTime = widget.company.workDayStartTime.hour.toString() +
    //     ":" +
    //     widget.company.workDayStartTime.hour.toString() +
    //     "-" +
    //     widget.company.workDayEndTime.hour.toString() +
    //     ":" +
    //     widget.company.workDayEndTime.minute.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          border: Border.all(color: Colors.grey, width: 0.5)),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => StreamInfo()));
        },
        child: Row(
          children: [
            Flexible(
              flex: 4,
              child: Row(
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
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("name"),
                        Container(
                          //width: MediaQuery.of(context).size.width * 0.45,
                          child: Text("description"),
                        ),
                        Text(
                          workDays,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          workTime,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Flexible(
            //   flex: 1,
            //   child: InkWell(
            //     onTap: () {
            //       setState(() {
            //         if (value == false) {
            //           value = !value;
            //           // FavoriteCompanies.inserWidget(Text("111"));
            //           // print(FavoriteCompanies.faforiteList);
            //         } else {
            //           value = !value;
            //           // FavoriteCompanies.deletWidget();
            //           // print(FavoriteCompanies.faforiteList);
            //         }
            //       });
            //     },
            //     child: Container(
            //       margin: EdgeInsets.only(left: 20),
            //       child: Icon(
            //         value ? Icons.star : Icons.star_border_outlined,
            //         size: 30,
            //         color: value ? Colors.pink : Colors.grey,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
