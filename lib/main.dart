// import 'package:flutter/material.dart';
// import 'package:zingoapp/modules/authentication/pages/auth_page.dart';
// import 'package:zingoapp/modules/authentication/pages/login_page.dart';
// import 'package:zingoapp/modules/firebase/widgets/firebase_initializer.dart';

// void main() {
//   runApp(const FirebaseInitializer(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const AuthPage(),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:zingoapp/modules/authentication/bloc/auth_bloc.dart';
// import 'package:zingoapp/modules/authentication/bloc/auth_event.dart';
// import 'package:zingoapp/modules/authentication/bloc/auth_state.dart';
// import 'package:zingoapp/modules/authentication/pages/home.dart';
// import 'package:zingoapp/modules/authentication/pages/login.dart';
// import 'package:zingoapp/modules/authentication/repos/auth_repo.dart';

// void main() => runApp(
//         // Injects the Authentication service
//         RepositoryProvider<AuthRepo>(
//       create: (context) {
//         return AuthRepo();
//       },
//       // Injects the Authentication BLoC
//       child: BlocProvider<AuthBloc>(
//         create: (context) {
//           final authService = RepositoryProvider.of<AuthRepo>(context);
//           return AuthBloc(authService)..add(AppLoaded());
//         },
//         child: MyApp(),
//       ),
//     ));

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Authentication Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//       ),
//       // BlocBuilder will listen to changes in AuthenticationState
//       // and build an appropriate widget based on the state.
//       home: BlocBuilder<AuthBloc, AuthState>(
//         builder: (context, state) {
//           if (state is AuthenticationAuthenticated) {
//             // show home page
//             return HomePagee(
//               user: state.user,
//             );
//           }
//           // otherwise show login page
//           return LoginnPage();
//         },
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zingoapp/modules/authentication/bloc/test/auth_bloc.dart';
import 'package:zingoapp/modules/authentication/repos/auth_repo.dart';
import 'package:zingoapp/modules/post/blocs/post_bloc.dart';
import 'package:zingoapp/modules/post/blocs/story_bloc.dart';
import 'package:zingoapp/modules/post/pages/home_page.dart';
import 'package:zingoapp/modules/post/pages/welcome_page.dart';
import 'package:zingoapp/modules/post/repos/post_repo.dart';
import 'package:zingoapp/modules/post/repos/story_repo.dart';

import 'modules/post/blocs/post_event.dart';
import 'modules/post/blocs/story_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepo>(create: (context) => AuthRepo()),
        RepositoryProvider<PostRepo>(create: (context) => PostRepo()),
        RepositoryProvider<StoryRepo>(create: (context) => StoryRepo()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (BuildContext context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepo>(context),
            ),
          ),
          BlocProvider<PostBloc>(
            create: (BuildContext context) => PostBloc(
              postRepo: RepositoryProvider.of<PostRepo>(context),
            ),
          ),
          BlocProvider<StoryBloc>(
            create: (BuildContext context) => StoryBloc(
              storyRepo: RepositoryProvider.of<StoryRepo>(context),
            ),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                // If the snapshot has user data, then they're already signed in. So Navigating to the Dashboard.
                if (snapshot.hasData) {
                  _getStoryList(context);
                  _getPostList(context);

                  return const HomePage();
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (bcontext) {
                  //   _getPostList(bcontext);
                  //   return const HomePage();
                  // }));
                }
                // Otherwise, they're not signed in. Show the sign in page.
                return const WelcomePage();
              }),
        ),
      ),
    );
  }

  void _getPostList(context) {
    BlocProvider.of<PostBloc>(context).add(
      GetPostRequested(),
    );
  }

  void _getStoryList(context) {
    BlocProvider.of<StoryBloc>(context).add(
      GetStoryRequested(),
    );
  }
}
