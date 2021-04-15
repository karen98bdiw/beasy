import 'package:beasy/utils/api_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:beasy/models/user_models/user.dart' as userModel;

class ProfileServices {
  ProfileServices._internal();

  static final profileServices = ProfileServices._internal();

  FirebaseAuth auth;
  FirebaseFirestore store;

  factory ProfileServices({
    @required FirebaseAuth auth,
    @required FirebaseFirestore store,
  }) {
    profileServices.auth = auth;
    profileServices.store = store;
    return profileServices;
  }

  Future<bool> createUser({String email, String password}) async {
    try {
      var res = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return res.user != null;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> deleteUser() async {
    try {
      await store
          .collection(usersCollectionPath)
          .doc(auth.currentUser.uid)
          .delete();
      await auth.currentUser.delete();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> postUser(userModel.User user) async {
    user.id = auth.currentUser.uid;
    try {
      await store
          .collection(usersCollectionPath)
          .doc(auth.currentUser.uid)
          .set(user.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signIn({String email, String password}) async {
    try {
      var res = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return res.user != null;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<userModel.User> getUserData() async {
    try {
      var collection = await store
          .collection(usersCollectionPath)
          .doc(auth.currentUser.uid)
          .get();
      return collection.exists
          ? userModel.User.fromJson(collection.data())
          : null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> singOut() async {
    try {
      await auth.signOut();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> updateUser({userModel.User user}) async {
    try {
      await store
          .collection(usersCollectionPath)
          .doc(auth.currentUser.uid)
          .update(user.toJson());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
