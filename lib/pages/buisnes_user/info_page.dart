import 'package:beasy/beasy.dart';
import 'package:beasy/models/company_model/company.dart';
import 'package:beasy/models/company_model/company_stream.dart';
import 'package:beasy/models/company_model/company_stream_service.dart';
import 'package:beasy/pages/buisnes_user/buisnes_user_profile_page.dart';
import 'package:beasy/pages/buisnes_user/home_page_buisnes_user.dart';
import 'package:beasy/services/beasyApi.dart';
import 'package:beasy/services/company_services.dart';
import 'package:beasy/widgets/buttons.dart';
import 'package:beasy/widgets/inpurs.dart';
import 'package:flutter/material.dart';

class InfoPageView extends StatefulWidget {
  @override
  _InfoPageViewState createState() => _InfoPageViewState();
}

class _InfoPageViewState extends State<InfoPageView> {
  var _workerNameController = TextEditingController();
  var _descriptionController = TextEditingController();
  GlobalKey<FormState> _addServiceForm = GlobalKey<FormState>();

  GlobalKey<FormState> _streamAddingFrom = GlobalKey<FormState>();
  CompanyStream companyStream = CompanyStream();
  @override
  void initState() {
    companyStream.streamServices = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 65, 85, 1),
      body: SafeArea(child: _body()),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await BeasyApi().companyServices.createCompany(
                company: BeasyApi().companyServices.companyModel,
              );
          BeasyApi().profileServices.user =
              await BeasyApi().profileServices.getUserData();
          Navigator.of(context).pushReplacementNamed(
            HomePageBuisnessUser.routeName,
          );
        },
        label: Text("Create Buisness"),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: Colors.pink,
            ),
          ),
          margin: EdgeInsets.only(right: 20, left: 20),
          child: Form(
            key: _streamAddingFrom,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomInput(
                  hintText: "Worker Name",
                  controller: _workerNameController,
                  validator: (v) =>
                      v.isEmpty ? "Worker name is required" : null,
                  onSaved: (v) => companyStream.streamName = v,
                ),
                CustomInput(
                  hintText: "Description",
                  controller: _descriptionController,
                  validator: (v) =>
                      v.isEmpty ? "Worker description is required" : null,
                  onSaved: (v) => companyStream.streamDescription = v,
                ),
                Text(companyStream.streamServices.length.toString()),
                CustumButton(
                  text: "Add Service to Worker",
                  onTap: () {
                    showAlertDialog(context);
                  },
                ),
                CustumButton(
                  text: "Apply Worker",
                  onTap: onWorkerApply,
                ),
              ],
            ),
          ),
        ),
        addedWorkerView(),
      ],
    );
  }

  Widget addedWorkerView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (c, i) => Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: ListTile(
              title: Text(BeasyApi()
                      .companyServices
                      .companyModel
                      .companyStreams[i]
                      .streamName ??
                  "name is not adjusted"),
            ),
          ),
          itemCount:
              BeasyApi().companyServices.companyModel.companyStreams.length,
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    CompanyStreamService service = CompanyStreamService();
    // set up the button
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        if (!_addServiceForm.currentState.validate()) {
          return;
        }

        _addServiceForm.currentState.save();
        companyStream.streamServices.add(service);
        setState(() {});
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.all(5),
      //scrollable: true,
      backgroundColor: Color.fromRGBO(50, 65, 85, 1),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
        ],
      ),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _addServiceForm,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomInput(
                onSaved: (v) => service.serviceName = v,
                hintText: "Service Type",
                validator: (v) => v.isEmpty ? "Service type is required" : null,
              ),
              CustomInput(
                type: TextInputType.number,
                hintText: "Service Duration",
                onSaved: (v) => service.durationInMinutes = int.parse(v),
                //TODO:This is opasno should filx
                validator: (v) => v.isEmpty ? "Service type is required" : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void onWorkerApply() {
    if (!_streamAddingFrom.currentState.validate()) {
      return;
    }
    _streamAddingFrom.currentState.save();
    BeasyApi().companyServices.companyModel.companyStreams.add(companyStream);
    companyStream = CompanyStream();
    companyStream.streamServices = [];
    setState(() {});
  }
}
