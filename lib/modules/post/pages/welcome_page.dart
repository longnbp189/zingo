import 'package:flutter/material.dart';
import 'package:zingoapp/common/widgets/stateless/button_orange.dart';
import 'package:zingoapp/common/widgets/stateless/button_white.dart';
import 'package:zingoapp/common/widgets/stateless/page_shadow.dart';
import 'package:zingoapp/utils/app_assets.dart';
import 'package:zingoapp/utils/app_colors.dart';
import 'package:zingoapp/utils/app_text_styles.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final AuthBloc? bloc = AuthBlsoc();

    final size = MediaQuery.of(context).size;
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
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "With milions of users all over the world, we gives you the ability to connect with people no matter where you are.",
                          style: AppStyles.h2,
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
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: GestureDetector(
                                  onTap: () {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const LoginPage()));
                                  },
                                  child: const ButtonWhite(title: "Log in")),
                            )),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        // const Expanded(flex: 0, child: SizedBox()),
                        const Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: ButtonOrange(title: "Sign up"),
                              ),
                            )),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: size.height * 0.05,
                  // ),
                  // const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Or login with",
                                style: AppStyles.h4
                                    .copyWith(color: AppColor.textGray),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        // Expanded(
                        //   flex: 2,
                        //   child: Align(
                        //     alignment: Alignment.topCenter,
                        //     child: StreamBuilder (
                        //       stream: bloc.isLogin(),
                        //       builder: (context, snapshot) => ElevatedButton(
                        //         child: const Icon(
                        //           Icons.email,
                        //           color: Colors.white,
                        //         ),
                        //         onPressed: () {
                        //           signInWithGoogle();
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
