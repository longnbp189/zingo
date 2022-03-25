import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseInitializer extends StatefulWidget {
  final Widget child;
  const FirebaseInitializer({Key? key, required this.child}) : super(key: key);

  @override
  State<FirebaseInitializer> createState() => _FirebaseInitializerState();
}

class _FirebaseInitializerState extends State<FirebaseInitializer> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC0oT-e9O_orwEEc2vd8qgj1RQIfW6-EAs",
      appId: "1:369373914241:android:8fdce7ca7570f49c22d980",
      messagingSenderId: "369373914241",
      projectId: "zingoapp-200",
    ),
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return widget.child;
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
