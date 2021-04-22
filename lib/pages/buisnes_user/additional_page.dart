import 'package:beasy/models/company_model/company.dart';
import 'package:beasy/services/beasyApi.dart';
import 'package:beasy/widgets/buttons.dart';
import 'package:beasy/widgets/inpurs.dart';
import 'package:beasy/widgets/select_week_days.dart';
import 'package:flutter/material.dart';

class AdditionalPageView extends StatefulWidget {
  final PageController controller;
  AdditionalPageView({this.controller});

  @override
  _AdditionalPageViewState createState() => _AdditionalPageViewState();
}

class _AdditionalPageViewState extends State<AdditionalPageView> {
  Company company;
  var _formState = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  DateTime _selectedTimeEnd = DateTime.now();
  DateTime _selectedTimeStart = DateTime.now();
  List<String> workDays;
  DateTime curentTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 65, 85, 1),
      body: _body(),
    );
  }

  onSave() {
    if (_formState.currentState.validate()) {
      return;
    }
    _formState.currentState.save();
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Form(
        key: _formState,
        child: ListView(
          children: [
            //_avatarImage(),
            CustomInput(
                hintText: "Copany Name",
                onSaved: (v) =>
                    BeasyApi().companyServices.companyModel.companyName = v,
                controller: _nameController,
                obscureText: false),
            CustomInput(
                hintText: "Copany Descripton",
                onSaved: (v) => BeasyApi()
                    .companyServices
                    .companyModel
                    .companyDescription = v,
                controller: _descriptionController,
                obscureText: false),
            _selectWorkDay(),
            _selectWorkTime(),
            CustumButton(
              text: "Next",
              onTap: () {
                setState(() {
                  _formState.currentState.save();
                  widget.controller.animateToPage(1,
                      duration: Duration(milliseconds: 250),
                      curve: Curves.bounceInOut);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectWorkDay() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "Select work days from - to",
                style: TextStyle(fontSize: 15, color: Colors.white),
              )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: WeekDays(
              padding: 0,
              selectedDayTextColor: Colors.white,
              unSelectedDayTextColor: Colors.white,
              daysFillColor: Colors.pink,
              backgroundColor: null,
              border: false,
              boxDecoration: BoxDecoration(),
              onSelect: (List<String> values) {
                setState(() {
                  BeasyApi().companyServices.companyModel.workDays = values;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> _selectTimeStart(BuildContext context) async {
    TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedTimeStart),
    );

    if (time != null) {
      setState(() {
        _selectedTimeStart = DateTime(curentTime.year, curentTime.month,
            curentTime.day, time.hour, time.minute);
        BeasyApi().companyServices.companyModel.startTime = _selectedTimeStart;
      });
    }
  }

  Future<Null> _selectTimeEnd(BuildContext context) async {
    TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedTimeEnd),
    );

    if (time != null) {
      setState(() {
        _selectedTimeEnd = DateTime(curentTime.year, curentTime.month,
            curentTime.day, time.hour, time.minute);
        BeasyApi().companyServices.companyModel.endTime = _selectedTimeEnd;
      });
    }
  }

  Widget _selectWorkTime() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(left: 5, bottom: 10),
              child: Text(
                "Select work Time",
                style: TextStyle(fontSize: 15, color: Colors.white),
              )),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _selectTimeStart(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    padding: EdgeInsets.only(left: 15, right: 15),
                    height: 45,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Start  ${_selectedTimeStart.hour}:${_selectedTimeStart.minute}",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Icon(
                          Icons.schedule,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _selectTimeEnd(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    padding: EdgeInsets.only(left: 15, right: 15),
                    height: 45,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "End  ${_selectedTimeEnd.hour}:${_selectedTimeEnd.minute}",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Icon(
                          Icons.schedule,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
