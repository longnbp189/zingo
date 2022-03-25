import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text('asdasdsadasda'),
        ),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  GoogleSignIn().disconnect();
                  FirebaseAuth.instance.signOut();
                },
                child: const Text('Logout'))),
      ],
    );
  }
}
