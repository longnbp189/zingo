import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zingoapp/common/widgets/stateless/button_orange.dart';
import 'package:zingoapp/common/widgets/stateless/page_shadow.dart';
import 'package:zingoapp/modules/authentication/bloc/test/auth_bloc.dart';
import 'package:zingoapp/modules/authentication/bloc/test/auth_event.dart';
import 'package:zingoapp/modules/authentication/bloc/test/auth_state.dart';
import 'package:zingoapp/modules/post/blocs/post_bloc.dart';
import 'package:zingoapp/modules/post/blocs/post_event.dart';
import 'package:zingoapp/modules/post/blocs/story_bloc.dart';
import 'package:zingoapp/modules/post/pages/home_page.dart';
import 'package:zingoapp/utils/app_assets.dart';
import 'package:zingoapp/utils/app_colors.dart';
import 'package:zingoapp/utils/app_text_styles.dart';

import '../blocs/story_event.dart';

// class WelcomePage extends StatelessWidget {
//   const WelcomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // final AuthBloc? bloc = AuthBlsoc();

//     final size = MediaQuery.of(context).size;
//     return Stack(
//       children: [
//         Container(
//             height: size.height,
//             width: size.width,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(AppAssets.imagePath + "i1.jpg"),
//                 fit: BoxFit.cover,
//               ),
//             )),
//         const PageShadow(),
//         Column(
//           children: [
//             Expanded(
//               flex: 1,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Text(
//                     "Find new friends nearby",
//                     style: AppStyles.h1,
//                   ),
//                 ),
//               ),
//             ),
//             // SizedBox(
//             //   height: size.height * 0.05,
//             // ),
//             Expanded(
//               flex: 1,
//               child: Column(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 25),
//                       child: Align(
//                         alignment: Alignment.center,
//                         child: Text(
//                           "With milions of users all over the world, we gives you the ability to connect with people no matter where you are.",
//                           style: AppStyles.h2,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: size.height * 0.05,
//                   // ),
//                   Expanded(
//                     flex: 1,
//                     child: Column(
//                       children: [
//                         Expanded(
//                             flex: 1,
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 25),
//                               child: GestureDetector(
//                                   onTap: () {
//                                     // Navigator.of(context).push(
//                                     //     MaterialPageRoute(
//                                     //         builder: (context) =>
//                                     //             const LoginPage()));
//                                   },
//                                   child: const ButtonWhite(title: "Log in")),
//                             )),
//                         SizedBox(
//                           height: size.height * 0.01,
//                         ),
//                         // const Expanded(flex: 0, child: SizedBox()),
//                         const Expanded(
//                             flex: 2,
//                             child: Align(
//                               alignment: Alignment.topCenter,
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 25),
//                                 child: ButtonOrange(title: "Sign up"),
//                               ),
//                             )),
//                       ],
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: size.height * 0.05,
//                   // ),
//                   // const Expanded(flex: 1, child: SizedBox()),
//                   Expanded(
//                     flex: 1,
//                     child: Column(
//                       children: [
//                         Expanded(
//                           flex: 1,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 25),
//                             child: Align(
//                               alignment: Alignment.bottomCenter,
//                               child: Text(
//                                 "Or login with",
//                                 style: AppStyles.h4
//                                     .copyWith(color: AppColor.textGray),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: size.height * 0.01,
//                         ),
//                         Expanded(
//                           flex: 2,
//                           child: Align(
//                             alignment: Alignment.topCenter,
//                             child: ElevatedButton(
//                               child: const Icon(
//                                 Icons.email,
//                                 color: Colors.white,
//                               ),
//                               onPressed: () {
//                                 _authenticateWithGoogle(context);
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   void _authenticateWithGoogle(context) {
//     BlocProvider.of<AuthBloc>(context).add(
//       GoogleSignInRequested(),
//     );
//   }
// }

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          // Navigating to the dashboard screen if the user is authenticated
          // _getPostList(context);
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => MultiProvider(providers: [
          //           ChangeNotifierProvider(create: (_) => _getPostList(context))
          //         ])));
          // ChangeNotifierProvider(
          //   create: (_) => GetPostRequested(),
          //   child: const HomePage(),
          // );
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (bcontext) {
            _getStoryList(bcontext);
            _getPostList(bcontext);
            return const HomePage();
          }));
        }
        if (state is AuthError) {
          // Showing the error message if the user has entered invalid credentials
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Loading) {
            // Showing the loading indicator while the user is signing in
            return Container(
              color: AppColor.background,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is UnAuthenticated) {
            // Showing the sign in form if the user is not authenticated
            return Stack(
              children: [
                Container(
                    height: size.height,
                    width: size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.imagePath + "i1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    )),
                const PageShadow(),
                Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Find new friends nearby",
                            style: AppStyles.h1,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: size.height * 0.05,
                    // ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "With milions of users all over the world, we gives you the ability to connect with people no matter where you are.",
                                  style: AppStyles.h2,
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: SizedBox(),
                          ),

                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                  _authenticateWithGoogle(context);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  child: ButtonOrange(
                                      title: "Sign in with Google"),
                                )),
                          ),
                          const Expanded(
                            flex: 3,
                            child: SizedBox(),
                          )

                          // Expanded(
                          //   flex: 2,
                          //   child: Align(
                          //     alignment: Alignment.topCenter,
                          //     child: ElevatedButton(
                          //       child: const Icon(
                          //         Icons.email,
                          //         color: Colors.white,
                          //       ),
                          //       onPressed: () {
                          //         _authenticateWithGoogle(context);
                          //       },
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          return Container(color: AppColor.background);
        },
      ),
    );
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
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
