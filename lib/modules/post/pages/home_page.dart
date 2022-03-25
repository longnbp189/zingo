import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zingoapp/common/widgets/stateful/search_bar.dart';
import 'package:zingoapp/common/widgets/stateful/story.dart';
import 'package:zingoapp/common/widgets/stateless/avatar.dart';
import 'package:zingoapp/utils/app_colors.dart';
import 'package:zingoapp/utils/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late SharedPreferences logindata;
  // String? email;

  // @override
  // void initState() {
  //   super.initState();
  //   initial();
  // }

  // void initial() async {
  //   logindata = await SharedPreferences.getInstance();
  //   setState(() {
  //     email = logindata.getString('email')!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            children: [
              const SearchBar(),
              // Row(
              //   children: const [
              //     // Text('s'),
              //     Expanded(flex: 9, child: SearchBar()),
              //     Expanded(flex: 1, child: Text('s')),
              //   ],
              // )
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        GoogleSignIn().disconnect();
                        FirebaseAuth.instance.signOut();
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
                    // Text('s'),
                    Avatar(
                        avatarUrl:
                            // "https://static.wikia.nocookie.net/bleach/images/1/16/Hitsugayatoshiro.png/revision/latest?cb=20111020043210&path-prefix=vi",
                            // sizeAvatar: 50,
                            FirebaseAuth.instance.currentUser!.photoURL)
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.002,
              ),
              Row(
                children: const [
                  Story(
                    imageStory:
                        "https://www.nicepng.com/png/detail/147-1479770_toshiro-hitsugaya-from-bleach-tshir-hitsugaya.png",
                    name: "Thomas Curtis",
                  ),
                ],
              ),
              // const SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Story(),
              // )

              // GestureDetector(
              //   onTap: () {
              //     logindata.setBool('login', true);
              //     Navigator.pushReplacement(context,
              //         MaterialPageRoute(builder: (context) => const LoginPage()));
              //   },
              //   child: const Text('LogOut'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
