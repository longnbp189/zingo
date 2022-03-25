import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zingoapp/modules/post/models/user.dart' as model;
import 'package:http/http.dart' as http;

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signOut() async {
    try {
      GoogleSignIn().disconnect();
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  static const String url = 'https://api.dofhunt.200lab.io/v1/auth/gmail';

  Future<model.User> loginAPI(String? accessToken) async {
    // Map<String, String> heads = Map<String, String>();
    // heads['Content-Type'] = 'application/json; charset=utf-8';
    // heads['Accept'] = 'application/json';
    Map<String, String> bodys = Map<String, String>();
    bodys['gmail_token'] = accessToken!;
    final response = await http.post(Uri.parse(url), body: bodys);

    if (response.statusCode == 200) {
      return model.User.fromJson(jsonDecode(response.body)["data"]);
    } else
      throw Exception('Not Found');
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      model.User user = await loginAPI(credential.accessToken);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", user.accessToken!);
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
