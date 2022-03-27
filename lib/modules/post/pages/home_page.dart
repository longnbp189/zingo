import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zingoapp/common/widgets/stateful/search_bar.dart';
import 'package:zingoapp/common/widgets/stateless/avatar.dart';
import 'package:zingoapp/modules/authentication/bloc/test/auth_bloc.dart';
import 'package:zingoapp/modules/authentication/bloc/test/auth_event.dart';
import 'package:zingoapp/modules/authentication/bloc/test/auth_state.dart';
import 'package:zingoapp/modules/post/blocs/post_bloc.dart';
import 'package:zingoapp/modules/post/blocs/post_state.dart';
import 'package:zingoapp/modules/post/blocs/story_bloc.dart';
import 'package:zingoapp/modules/post/blocs/story_state.dart';
import 'package:zingoapp/modules/post/pages/welcome_page.dart';
import 'package:zingoapp/modules/post/widgets/post_item.dart';
import 'package:zingoapp/modules/post/widgets/story_item.dart';
import 'package:zingoapp/utils/app_colors.dart';
import 'package:zingoapp/utils/app_text_styles.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final user = FirebaseAuth.instance.currentUser!;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: AppColor.background,
//       body: BlocListener<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is UnAuthenticated) {
//             // Navigate to the sign in screen when the user Signs Out
//             Navigator.of(context).pushAndRemoveUntil(
//               MaterialPageRoute(builder: (context) => const WelcomePage()),
//               (route) => false,
//             );
//           }
//         },
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
//             child: Column(
//               children: [
//                 const SearchBar(),
//                 Center(
//                     child: ElevatedButton(
//                         onPressed: () {
//                           context.read<AuthBloc>().add(SignOutRequested());
//                         },
//                         child: const Text('Logout'))),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 20),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           "What's new?",
//                           style: AppStyles.h7,
//                         ),
//                       ),
//                       Avatar(
//                           avatarUrl:
//                               FirebaseAuth.instance.currentUser!.photoURL)
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: size.height * 0.002,
//                 ),
//                 Row(
//                   children: const [
//                     Story(
//                       imageStory:
//                           "https://www.nicepng.com/png/detail/147-1479770_toshiro-hitsugaya-from-bleach-tshir-hitsugaya.png",
//                       name: "Thomas Curtis",
//                     ),
//                   ],
//                 ),
//                 BlocListener<PostBloc, PostState>(
//                   listener: (context, state) {
//                     // if (state is LoadingPost) {
//                     //   // Navigating to the dashboard screen if the user is authenticated
//                     //   // Navigator.pushReplacement(context,
//                     //   //     MaterialPageRoute(builder: (context) => const HomePage()));
//                     // }
//                     if (state is LoadErrorPost) {
//                       // Showing the error message if the user has entered invalid credentials
//                       ScaffoldMessenger.of(context)
//                           .showSnackBar(SnackBar(content: Text(state.error)));
//                     }
//                   },
//                   child: BlocBuilder<PostBloc, PostState>(
//                     builder: (context, state) {
//                       if (state is LoadingPost) {
//                         // Showing the loading indicator while the user is signing in
//                         return Container(
//                           color: AppColor.background,
//                           child: const Center(
//                             child: CircularProgressIndicator(),
//                           ),
//                         );
//                       }
//                       if (state is LoadedPost) {
//                         return SizedBox(
//                           height: 350,
//                           child: ListView.builder(
//                               itemCount: state.list!.length,
//                               itemBuilder: (context, snapshot) {
//                                 return PostItem(
//                                   post: state.list![snapshot],
//                                 );
//                               }),
//                         );
//                       }

//                       return Container(color: AppColor.background);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.background,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            // Navigate to the sign in screen when the user Signs Out
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const WelcomePage()),
              (route) => false,
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: BlocListener<StoryBloc, StoryState>(
              listener: (context, state) {
                if (state is LoadErrorStory) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              child: Column(
                children: [
                  const SearchBar(),
                  Center(
                      child: ElevatedButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(SignOutRequested());
                          },
                          child: const Text('Logout'))),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "What's new?",
                            style: AppStyles.h7,
                          ),
                        ),
                        Avatar(
                            avatarUrl:
                                FirebaseAuth.instance.currentUser!.photoURL)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.002,
                  ),
                  BlocBuilder<StoryBloc, StoryState>(
                    builder: (context, state) {
                      if (state is LoadingStory) {
                        // Showing the loading indicator while the user is signing in
                        return Container(
                          color: AppColor.background,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (state is LoadedStory) {
                        return SizedBox(
                          height: size.height / 4.5,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.list!.length - 1,
                              itemBuilder: (context, snapshot) {
                                return StoryItem(
                                  user: state.list![snapshot],
                                );
                              }),
                        );
                        // return Row(
                        //   children: const [
                        //     Story(
                        //       imageStory:
                        //           "https://www.nicepng.com/png/detail/147-1479770_toshiro-hitsugaya-from-bleach-tshir-hitsugaya.png",
                        //       name: "Thomas Curtis",
                        //     ),
                        //   ],
                        // );
                      }
                      return Container(color: AppColor.background);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocListener<PostBloc, PostState>(
                    listener: (context, state) {
                      // if (state is LoadingPost) {
                      //   // Navigating to the dashboard screen if the user is authenticated
                      //   // Navigator.pushReplacement(context,
                      //   //     MaterialPageRoute(builder: (context) => const HomePage()));
                      // }
                      if (state is LoadErrorPost) {
                        // Showing the error message if the user has entered invalid credentials
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(state.error)));
                      }
                    },
                    child: BlocBuilder<PostBloc, PostState>(
                      builder: (context, state) {
                        if (state is LoadingPost) {
                          // Showing the loading indicator while the user is signing in
                          return Container(
                            color: AppColor.background,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        if (state is LoadedPost) {
                          return SizedBox(
                            height: 300,
                            child: ListView.builder(
                                itemCount: state.list!.length,
                                itemBuilder: (context, snapshot) {
                                  return Column(
                                    children: [
                                      PostItem(
                                        post: state.list![snapshot],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      )
                                    ],
                                  );
                                }),
                          );
                        }

                        return Container(color: AppColor.background);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
