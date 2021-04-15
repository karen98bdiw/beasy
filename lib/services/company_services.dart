import 'package:beasy/models/company_model/company.dart';
import 'package:beasy/utils/api_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CompanyServices {
  CompanyServices._internal();

  static final CompanyServices companyServices = CompanyServices._internal();

  FirebaseAuth auth;
  FirebaseFirestore store;
  Company curentUserCompany;

  factory CompanyServices({FirebaseAuth auth, FirebaseFirestore store}) {
    companyServices.auth = auth;
    companyServices.store = store;
    return companyServices;
  }

  Future<bool> createCompany({Company company}) async {
    try {
      company.companyOwnerId = auth.currentUser.uid;
      company.companyId = auth.currentUser.uid +
          DateTime.now().toString() +
          company.companyName;
      await store
          .collection(companiesCollectionPath)
          .doc(auth.currentUser.uid)
          .set(company.toJson());
      await store
          .collection(usersCollectionPath)
          .doc(auth.currentUser.uid)
          .update({"companyId": company.companyId});
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> deleteCompany({String companyId}) async {
    try {
      await store
          .collection(companiesCollectionPath)
          .doc(auth.currentUser.uid)
          .delete();
      return true;
    } catch (e) {
      print(e.toString());

      return false;
    }
  }

  Future<bool> updateCompany({Company company}) async {
    try {
      await store
          .collection(companiesCollectionPath)
          .doc(auth.currentUser.uid)
          .update(company.toJson());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> getCompany({String companyid}) async {
    try {
      var res = await store
          .collection(companiesCollectionPath)
          .doc(auth.currentUser.uid)
          .get();
      if (res.exists) {
        curentUserCompany = Company.fromJson(res.data());
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}