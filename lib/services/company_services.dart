import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CompanyServices {
  CompanyServices._internal();

  static final CompanyServices companyServices = CompanyServices._internal();

  FirebaseAuth auth;
  FirebaseFirestore store;

  factory CompanyServices({FirebaseAuth auth, FirebaseFirestore store}) {
    companyServices.auth = auth;
    companyServices.store = store;
    return companyServices;
  }

  Future<bool> createCompany() async {
    return false;
  }
}
