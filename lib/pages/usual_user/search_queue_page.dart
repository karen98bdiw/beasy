import 'package:beasy/models/company_model/company.dart';
import 'package:beasy/pages/usual_user/company_info_page.dart';
import 'package:beasy/services/beasyApi.dart';
import 'package:beasy/widgets/inpurs.dart';
import 'package:flutter/material.dart';

class SearchQueuePage extends StatefulWidget {
  SearchQueuePage({Key key}) : super(key: key);

  @override
  _SearchQueuePageState createState() => _SearchQueuePageState();
}

class _SearchQueuePageState extends State<SearchQueuePage> {
  bool isLaoding = false;
  List<Company> allCompanies = [];

  void getCompanyes() async {
    setState(() {
      isLaoding = true;
    });

    var res = await BeasyApi().companyServices.getAllCompanyes();
    if (res != null) {
      allCompanies = res;
    }
    setState(() {
      isLaoding = false;
    });
  }

  @override
  void initState() {
    getCompanyes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(46, 61, 77, 1),
      body: _body(),
    );
  }

  Widget _body() {
    return isLaoding
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: CustomInput(
                      prefix: Icons.search,
                      hintText: "Search",
                      obscureText: false)),
              Container(
                margin: EdgeInsets.only(top: 90),
                child: ListView.builder(
                    //physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: allCompanies.length,
                    itemBuilder: (context, index) {
                      return StreamsCard(
                        company: allCompanies[index],
                      );
                    }),
              )
            ],
          );
  }
}

class StreamsCard extends StatefulWidget {
  Company company;

  StreamsCard({this.company});

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
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CompanyInfoPage(
                    company: widget.company,
                  )));
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
                        Text(widget.company.companyName ?? "company name null"),
                        Container(
                          //width: MediaQuery.of(context).size.width * 0.45,
                          child: Text(widget.company.companyDescription ??
                              "compna dec in null"),
                        ),
                        Text(
                          workTime,
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
            Flexible(
              flex: 1,
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (value == false) {
                      value = !value;
                      // FavoriteCompanies.inserWidget(Text("111"));
                      // print(FavoriteCompanies.faforiteList);
                    } else {
                      value = !value;
                      // FavoriteCompanies.deletWidget();
                      // print(FavoriteCompanies.faforiteList);
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Icon(
                    value ? Icons.star : Icons.star_border_outlined,
                    size: 30,
                    color: value ? Colors.pink : Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
