import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zingoapp/modules/post/models/user.dart' as model;
import 'package:http/http.dart' as http;

class AuthRepo {
  static const String url = 'https://api.dofhunt.200lab.io/v1/auth/gmail';

  Future<model.User> loginAPI(String? accessToken) async {
    Map<String, String> heads = Map<String, String>();
    heads['Content-Type'] = 'application/json';
    heads['Accept'] = 'application/json';
    Map<String, String> bodys = Map<String, String>();
    bodys['gmail_token'] = accessToken!;
    final response =
        await http.post(Uri.parse(url), headers: heads, body: bodys);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else
      throw Exception('Not Found');
  }

  Future logout() async {
    GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();
  }

  Future<User?> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    debugPrint('_signInWithGoogle -> $userCredential');
    return FirebaseAuth.instance.currentUser;
  }
}
